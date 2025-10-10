import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/widgets/player.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/provider/mini_player_state.dart';

/// Wrapper page for BookDetails with global mini player
/// This provides a clean full-screen experience without sidebar navigation
class BookDetailsWrapper extends ConsumerWidget {
  final LibraryItemEntity item;
  final String? heroTag;

  const BookDetailsWrapper({super.key, required this.item, this.heroTag});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the mini player visibility provider
    final miniPlayerVisible = ref.watch(miniPlayerVisibilityProvider);
    final audioPlayer = ref.watch(audioPlayerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'bookTitleDetails${item.id}',
          child: Text(
            item.media.metadata?.title ?? "Book Details",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Main book details content
          BookDetails(item: item, heroTag: heroTag),
          // Global mini player - positioned at bottom
          // Show mini player when visible
          if (miniPlayerVisible && audioPlayer.audioSource != null)
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
