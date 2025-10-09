import 'package:audiobookshelf_flutter/database/narrator_entity.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/repositories/narrators_repository.dart';
import 'package:audiobookshelf_flutter/widgets/narrator_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for real narrators data
final narratorsProvider = FutureProvider<List<NarratorEntity>>((ref) async {
  final narratorsRepository =
      await ref.read(narratorsRepositoryProvider.future);
  return await narratorsRepository.getAllNarrators();
});

class NarratorsScreen extends ConsumerWidget {
  const NarratorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      body: _buildBody(context, ref),
      title: 'Narrators',
      selectedDrawerItem: SelectedItem.narrators,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final narratorsAsync = ref.watch(narratorsProvider);

    return narratorsAsync.when(
      data: (narrators) {
        if (narrators.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mic_outlined, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No narrators found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Narrators will appear here once books are loaded',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      1.5, // Increased to make cards even shorter (max 80px height)
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final narrator = narrators[index];
                    return NarratorCard(
                      narrator: narrator,
                      isCompact: true,
                      onTap: () {
                        // TODO: Navigate to narrator details page
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Narrator: ${narrator.name}')),
                        );
                      },
                    );
                  },
                  childCount: narrators.length,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading narrators',
              style: TextStyle(fontSize: 18, color: Colors.red[700]),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
