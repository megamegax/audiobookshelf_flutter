import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/optimized_background_loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComprehensiveLoadingScreen extends ConsumerStatefulWidget {
  final List<Library> libraries;
  final String selectedLibraryId;
  final VoidCallback? onLoadingComplete;

  const ComprehensiveLoadingScreen({
    super.key,
    required this.libraries,
    required this.selectedLibraryId,
    this.onLoadingComplete,
  });

  @override
  ConsumerState<ComprehensiveLoadingScreen> createState() =>
      _ComprehensiveLoadingScreenState();
}

class _ComprehensiveLoadingScreenState
    extends ConsumerState<ComprehensiveLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _pulseController.repeat(reverse: true);
    _fadeController.forward();

    // Start background loading
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startLoading();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _startLoading() {
    ref
        .read(optimizedBackgroundLoadingProvider.notifier)
        .startBackgroundLoading(widget.libraries, widget.selectedLibraryId);
  }

  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(optimizedBackgroundLoadingProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header section
                Expanded(
                  flex: 2,
                  child: _buildHeader(theme, colorScheme),
                ),

                // Progress section
                Expanded(
                  flex: 3,
                  child:
                      _buildProgressSection(loadingState, theme, colorScheme),
                ),

                // Libraries section
                Expanded(
                  flex: 4,
                  child:
                      _buildLibrariesSection(loadingState, theme, colorScheme),
                ),

                // Footer section
                Expanded(
                  flex: 1,
                  child: _buildFooter(loadingState, theme, colorScheme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // App logo/icon with pulse animation
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.library_music,
                  size: 40,
                  color: colorScheme.onPrimary,
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 24),

        // Title
        Text(
          'Audiobookshelf',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 8),

        // Subtitle
        Text(
          'Loading your library...',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection(OptimizedBackgroundLoadingState loadingState,
      ThemeData theme, ColorScheme colorScheme) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Overall progress indicator
          _buildOverallProgress(loadingState, theme, colorScheme),

          const SizedBox(height: 24),

          // Status message
          _buildStatusMessage(loadingState, theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildOverallProgress(OptimizedBackgroundLoadingState loadingState,
      ThemeData theme, ColorScheme colorScheme) {
    return Column(
      children: [
        // Progress circle
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              // Background circle
              CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(
                  colorScheme.surfaceContainerHighest,
                ),
              ),
              // Progress circle
              CircularProgressIndicator(
                value: _getOverallProgress(loadingState),
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getProgressColor(colorScheme, loadingState),
                ),
              ),
              // Percentage text
              Center(
                child: Text(
                  '${(_getOverallProgress(loadingState) * 100).round()}%',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _getProgressColor(colorScheme, loadingState),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Progress text
        Text(
          _getProgressText(loadingState),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStatusMessage(OptimizedBackgroundLoadingState loadingState,
      ThemeData theme, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _getStatusColor(colorScheme, loadingState),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _getStatusMessage(loadingState),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: _getStatusTextColor(colorScheme, loadingState),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLibrariesSection(OptimizedBackgroundLoadingState loadingState,
      ThemeData theme, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Libraries',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: widget.libraries.length,
            itemBuilder: (context, index) {
              final library = widget.libraries[index];
              return _buildLibraryItem(library, theme, colorScheme);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLibraryItem(
      Library library, ThemeData theme, ColorScheme colorScheme) {
    final isSelected = library.id == widget.selectedLibraryId;
    final isLoading = ref
        .watch(optimizedBackgroundLoadingProvider.notifier)
        .isLibraryLoading(library.id);
    final isCompleted = ref
        .watch(optimizedBackgroundLoadingProvider.notifier)
        .isLibraryLoaded(library.id);
    final hasError = ref
        .watch(optimizedBackgroundLoadingProvider.notifier)
        .hasLibraryError(library.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primaryContainer
            : colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.outline.withOpacity(0.2),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Library icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primary : colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.library_books,
              color:
                  isSelected ? colorScheme.onPrimary : colorScheme.onSecondary,
              size: 20,
            ),
          ),

          const SizedBox(width: 16),

          // Library info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  library.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getLibraryStatusText(isLoading, isCompleted, hasError),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isSelected
                        ? colorScheme.onPrimaryContainer
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Status indicator
          if (isLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (isCompleted)
            Icon(
              Icons.check_circle,
              color: colorScheme.tertiary,
              size: 20,
            )
          else if (hasError)
            Icon(
              Icons.error,
              color: colorScheme.error,
              size: 20,
            )
          else
            Icon(
              Icons.pending,
              color: colorScheme.onSurfaceVariant,
              size: 20,
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(OptimizedBackgroundLoadingState loadingState,
      ThemeData theme, ColorScheme colorScheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Loading stats
        if (loadingState.isLoading) ...[
          Text(
            'Loading ${ref.read(optimizedBackgroundLoadingProvider.notifier).loadingLibrariesCount} libraries',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Cancel button (only show if loading)
        if (loadingState.isLoading)
          TextButton(
            onPressed: () {
              ref
                  .read(optimizedBackgroundLoadingProvider.notifier)
                  .cancelAllLoading();
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }

  double _getOverallProgress(OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return 1.0;
    if (loadingState.hasError) return 0.0;

    // Calculate progress based on completed libraries
    final completedLibraries = widget.libraries
        .where((lib) => ref
            .read(optimizedBackgroundLoadingProvider.notifier)
            .isLibraryLoaded(lib.id))
        .length;

    return completedLibraries / widget.libraries.length;
  }

  Color _getProgressColor(
      ColorScheme colorScheme, OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return colorScheme.tertiary;
    if (loadingState.hasError) return colorScheme.error;
    return colorScheme.primary;
  }

  String _getProgressText(OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return 'All libraries loaded successfully!';
    if (loadingState.hasError) return 'Loading failed';

    final completedLibraries = widget.libraries
        .where((lib) => ref
            .read(optimizedBackgroundLoadingProvider.notifier)
            .isLibraryLoaded(lib.id))
        .length;

    return 'Loading libraries... ($completedLibraries/${widget.libraries.length} completed)';
  }

  Color _getStatusColor(
      ColorScheme colorScheme, OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return colorScheme.tertiaryContainer;
    if (loadingState.hasError) return colorScheme.errorContainer;
    return colorScheme.primaryContainer;
  }

  Color _getStatusTextColor(
      ColorScheme colorScheme, OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return colorScheme.onTertiaryContainer;
    if (loadingState.hasError) return colorScheme.onErrorContainer;
    return colorScheme.onPrimaryContainer;
  }

  String _getStatusMessage(OptimizedBackgroundLoadingState loadingState) {
    if (loadingState.isCompleted) return 'Ready to use!';
    if (loadingState.hasError) return 'Something went wrong';
    return 'Synchronizing with server...';
  }

  String _getLibraryStatusText(
      bool isLoading, bool isCompleted, bool hasError) {
    if (isLoading) return 'Loading...';
    if (isCompleted) return 'Ready';
    if (hasError) return 'Error';
    return 'Pending';
  }
}
