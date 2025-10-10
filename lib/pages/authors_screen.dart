import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/repositories/authors_repository.dart';
import 'package:audiobookshelf_flutter/widgets/author_card.dart';
import 'package:audiobookshelf_flutter/pages/author_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for real authors data
final authorsProvider = FutureProvider<List<AuthorEntity>>((ref) async {
  final authorsRepository = await ref.read(authorsRepositoryProvider.future);
  return await authorsRepository.getAllAuthors();
});

class AuthorsScreen extends ConsumerWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsProvider);

    return ResponsiveLayout(
      body: _buildBody(context, ref),
      title: 'Authors',
      selectedDrawerItem: SelectedItem.authors,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final authorsAsync = ref.watch(authorsProvider);

    return authorsAsync.when(
      data: (authors) {
        if (authors.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_outline, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No authors found',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Authors will appear here once books are loaded',
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
                delegate: SliverChildBuilderDelegate((context, index) {
                  final author = authors[index];
                  return AuthorCard(
                    author: author,
                    isCompact: true,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              AuthorDetailsPage(author: author),
                        ),
                      );
                    },
                  );
                }, childCount: authors.length),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error loading authors',
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
