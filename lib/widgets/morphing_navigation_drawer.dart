import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:audiobookshelf_flutter/pages/downloads_page.dart';
import 'package:audiobookshelf_flutter/pages/download_queue_page.dart';
import 'package:audiobookshelf_flutter/pages/series_screen.dart';
import 'package:audiobookshelf_flutter/pages/authors_screen.dart';
import 'package:audiobookshelf_flutter/pages/narrators_screen.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';

enum SelectedItem {
  home,
  library,
  downloads,
  downloadQueue,
  series,
  authors,
  narrators
}

class MorphingNavigationDrawer extends StatefulWidget {
  final SelectedItem selectedItem;
  final ServerSettings? serverSettings;

  const MorphingNavigationDrawer({
    super.key,
    required this.selectedItem,
    required this.serverSettings,
  });

  @override
  State<MorphingNavigationDrawer> createState() =>
      _MorphingNavigationDrawerState();
}

class _MorphingNavigationDrawerState extends State<MorphingNavigationDrawer>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _morphController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _morphAnimation;

  @override
  void initState() {
    super.initState();

    // Slide animation controller
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Morph animation controller
    _morphController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Fade animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    ));

    // Morph animation
    _morphAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _morphController,
      curve: Curves.easeInOut,
    ));

    // Start animations
    _slideController.forward();
    _fadeController.forward();
    _morphController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    _morphController.dispose();
    super.dispose();
  }

  void _navigateToPage(Widget page) {
    Navigator.pop(context);
    NavigationService.replace(context, page);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AnimatedBuilder(
      animation:
          Listenable.merge([_slideAnimation, _fadeAnimation, _morphAnimation]),
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 280,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.surface.withOpacity(0.95),
                    colorScheme.surfaceContainerLow.withOpacity(0.9),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.2),
                    blurRadius: 24,
                    offset: const Offset(8, 0),
                  ),
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.1),
                    blurRadius: 16,
                    offset: const Offset(4, 0),
                  ),
                ],
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: colorScheme.outline.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Header with glassmorphism
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorScheme.primaryContainer.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // App logo/icon with morphing
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 48 + (_morphAnimation.value * 8),
                                height: 48 + (_morphAnimation.value * 8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      colorScheme.primary,
                                      colorScheme.primary.withOpacity(0.8),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colorScheme.primary.withOpacity(
                                          0.3 * _morphAnimation.value),
                                      blurRadius: 16 * _morphAnimation.value,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.library_music,
                                  color: colorScheme.onPrimary,
                                  size: 24 + (_morphAnimation.value * 4),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // App title with morphing
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 500),
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onSurface,
                                  letterSpacing: -0.5,
                                  fontSize: 20 + (_morphAnimation.value * 4),
                                ),
                                child: const Text('AudioBookShelf'),
                              ),

                              const SizedBox(height: 4),

                              // Server info with morphing
                              if (widget.serverSettings != null)
                                AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 500),
                                  style: theme.textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: colorScheme.onSurfaceVariant,
                                    letterSpacing: 0.1,
                                    fontSize: 12 + (_morphAnimation.value * 2),
                                  ),
                                  child: Text(
                                    'Server ID: ${widget.serverSettings!.id}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // Navigation items with morphing
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            children: [
                              _buildNavigationItem(
                                icon: Icons.home_outlined,
                                selectedIcon: Icons.home,
                                label: 'Home',
                                isSelected:
                                    widget.selectedItem == SelectedItem.home,
                                onTap: () =>
                                    _navigateToPage(const HomeScreen()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.library_books_outlined,
                                selectedIcon: Icons.library_books,
                                label: 'Library',
                                isSelected:
                                    widget.selectedItem == SelectedItem.library,
                                onTap: () =>
                                    _navigateToPage(const BookshelfScreen()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.download_outlined,
                                selectedIcon: Icons.download,
                                label: 'Downloads',
                                isSelected: widget.selectedItem ==
                                    SelectedItem.downloads,
                                onTap: () =>
                                    _navigateToPage(const DownloadsPage()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.queue_outlined,
                                selectedIcon: Icons.queue,
                                label: 'Download Queue',
                                isSelected: widget.selectedItem ==
                                    SelectedItem.downloadQueue,
                                onTap: () =>
                                    _navigateToPage(const DownloadQueuePage()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.collections_bookmark_outlined,
                                selectedIcon: Icons.collections_bookmark,
                                label: 'Series',
                                isSelected:
                                    widget.selectedItem == SelectedItem.series,
                                onTap: () =>
                                    _navigateToPage(const SeriesScreen()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.person_outline,
                                selectedIcon: Icons.person,
                                label: 'Authors',
                                isSelected:
                                    widget.selectedItem == SelectedItem.authors,
                                onTap: () =>
                                    _navigateToPage(const AuthorsScreen()),
                              ),
                              _buildNavigationItem(
                                icon: Icons.mic_outlined,
                                selectedIcon: Icons.mic,
                                label: 'Narrators',
                                isSelected: widget.selectedItem ==
                                    SelectedItem.narrators,
                                onTap: () =>
                                    _navigateToPage(const NarratorsScreen()),
                              ),
                            ],
                          ),
                        ),

                        // Footer with morphing
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                colorScheme.surfaceContainerHigh
                                    .withOpacity(0.3),
                              ],
                            ),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            padding: EdgeInsets.all(
                                12 + (_morphAnimation.value * 4)),
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHigh
                                  .withOpacity(0.8),
                              borderRadius: BorderRadius.circular(
                                  16 + (_morphAnimation.value * 4)),
                              border: Border.all(
                                color: colorScheme.outline.withOpacity(0.1),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: colorScheme.shadow.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Material Design 3\nAdvanced UI',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.onSurfaceVariant,
                                      letterSpacing: 0.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primaryContainer.withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: isSelected
                  ? Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant.withOpacity(0.1),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: colorScheme.primary.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    isSelected ? selectedIcon : icon,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : colorScheme.onSurfaceVariant,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSurface,
                      letterSpacing: 0.1,
                    ),
                    child: Text(label),
                  ),
                ),
                if (isSelected)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
