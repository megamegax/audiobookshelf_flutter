import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/layouts/layout_constants.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/downloads_page.dart';
import 'package:audiobookshelf_flutter/pages/download_queue_page.dart';
import 'package:audiobookshelf_flutter/pages/series_screen.dart';
import 'package:audiobookshelf_flutter/pages/authors_screen.dart';
import 'package:audiobookshelf_flutter/pages/narrators_screen.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';

/// Desktop master-detail layout with permanent sidebar
class DesktopLayout extends ConsumerWidget {
  final Widget body;
  final String title;
  final PreferredSizeWidget? appBar;
  final SelectedItem selectedDrawerItem;
  final ServerSettings? serverSettings;
  final List<Widget>? appBarActions;

  const DesktopLayout({
    super.key,
    required this.body,
    required this.title,
    required this.selectedDrawerItem,
    required this.serverSettings,
    this.appBar,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final audioPlayer = ref.watch(audioPlayerProvider);

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              // Permanent sidebar (master)
              Container(
                width: LayoutConstants.sidebarWidth,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLow,
                  border: Border(
                    right: BorderSide(
                      color: colorScheme.outlineVariant.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                ),
                child: _SidebarContent(
                  selectedItem: selectedDrawerItem,
                  serverSettings: serverSettings,
                ),
              ),
              // Main content area (detail)
              Expanded(
                child: Column(
                  children: [
                    // AppBar for the detail area
                    if (appBar != null)
                      SizedBox(
                        height: kToolbarHeight +
                            (appBar!.preferredSize.height - kToolbarHeight),
                        child: appBar!,
                      )
                    else
                      AppBar(
                        title: Text(title),
                        actions: appBarActions,
                        automaticallyImplyLeading: false, // No hamburger menu
                      ),
                    // Body content
                    Expanded(child: body),
                  ],
                ),
              ),
            ],
          ),
          // Global floating player - visible on all screens when playing
          if (audioPlayer.audioSource != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Player(source: audioPlayer.audioSource!),
            ),
        ],
      ),
    );
  }
}

/// Sidebar content widget that displays the navigation drawer content
/// without the sliding animations (permanent display)
class _SidebarContent extends StatelessWidget {
  final SelectedItem selectedItem;
  final ServerSettings? serverSettings;

  const _SidebarContent({
    required this.selectedItem,
    required this.serverSettings,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        // Header section
        Container(
          height: kToolbarHeight + MediaQuery.of(context).padding.top,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 20,
            right: 20,
            bottom: 8,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer.withOpacity(0.8),
                colorScheme.primaryContainer.withOpacity(0.4),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.headphones,
                color: colorScheme.primary,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Audiobookshelf',
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Navigation items
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                _buildNavigationItem(
                  context: context,
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  label: 'Home',
                  isSelected: selectedItem == SelectedItem.home,
                  onTap: () => _navigateToPage(context, const HomeScreen()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.library_books_outlined,
                  selectedIcon: Icons.library_books,
                  label: 'Library',
                  isSelected: selectedItem == SelectedItem.library,
                  onTap: () =>
                      _navigateToPage(context, const BookshelfScreen()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.download_outlined,
                  selectedIcon: Icons.download,
                  label: 'Downloads',
                  isSelected: selectedItem == SelectedItem.downloads,
                  onTap: () => _navigateToPage(context, const DownloadsPage()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.queue_outlined,
                  selectedIcon: Icons.queue,
                  label: 'Download Queue',
                  isSelected: selectedItem == SelectedItem.downloadQueue,
                  onTap: () =>
                      _navigateToPage(context, const DownloadQueuePage()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.collections_bookmark_outlined,
                  selectedIcon: Icons.collections_bookmark,
                  label: 'Series',
                  isSelected: selectedItem == SelectedItem.series,
                  onTap: () => _navigateToPage(context, const SeriesScreen()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  label: 'Authors',
                  isSelected: selectedItem == SelectedItem.authors,
                  onTap: () => _navigateToPage(context, const AuthorsScreen()),
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.mic_outlined,
                  selectedIcon: Icons.mic,
                  label: 'Narrators',
                  isSelected: selectedItem == SelectedItem.narrators,
                  onTap: () =>
                      _navigateToPage(context, const NarratorsScreen()),
                ),
              ],
            ),
          ),
        ),

        // Footer
        if (serverSettings != null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh.withOpacity(0.5),
              border: Border(
                top: BorderSide(
                  color: colorScheme.outlineVariant.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: colorScheme.onSurfaceVariant,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Connected to server',
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildNavigationItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? colorScheme.primaryContainer.withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: isSelected
                  ? Border.all(
                      color: colorScheme.primary.withOpacity(0.3),
                      width: 1,
                    )
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  isSelected ? selectedIcon : icon,
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  size: 20,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? colorScheme.onPrimaryContainer
                          : colorScheme.onSurface,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    NavigationService.replace(context, page);
  }
}
