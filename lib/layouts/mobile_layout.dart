import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';

/// Mobile layout with traditional drawer overlay
class MobileLayout extends ConsumerWidget {
  final Widget body;
  final String title;
  final PreferredSizeWidget? appBar;
  final SelectedItem selectedDrawerItem;
  final ServerSettings? serverSettings;
  final List<Widget>? appBarActions;

  const MobileLayout({
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
    final audioPlayer = ref.watch(audioPlayerProvider);

    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(title),
            actions: appBarActions,
          ),
      drawer: MorphingNavigationDrawer(
        selectedItem: selectedDrawerItem,
        serverSettings: serverSettings,
      ),
      body: Stack(
        children: [
          body,
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
