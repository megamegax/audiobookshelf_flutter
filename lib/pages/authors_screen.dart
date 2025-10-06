import 'package:audiobookshelf_flutter/model/author.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mock data for now - will be replaced with actual API calls
final mockAuthors = [
  Author(
    id: '1',
    name: 'J.K. Rowling',
    description:
        'British author, best known for the Harry Potter fantasy series.',
    addedAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    numBooks: 7,
  ),
  Author(
    id: '2',
    name: 'Stephen King',
    description:
        'American author of horror, supernatural fiction, and suspense.',
    addedAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    numBooks: 12,
  ),
  Author(
    id: '3',
    name: 'George R.R. Martin',
    description:
        'American novelist and short story writer, known for A Song of Ice and Fire.',
    addedAt: DateTime.now().millisecondsSinceEpoch,
    updatedAt: DateTime.now().millisecondsSinceEpoch,
    numBooks: 5,
  ),
];

class AuthorsScreen extends ConsumerWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      body: _buildBody(context),
      title: 'Authors',
      selectedDrawerItem: SelectedItem.authors,
      serverSettings: serverSettings,
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final author = mockAuthors[index];
                return _buildAuthorCard(context, author);
              },
              childCount: mockAuthors.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAuthorCard(BuildContext context, Author author) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // TODO: Navigate to author details page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Author: ${author.name}')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author avatar/icon
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primaryContainer,
                ),
                child: Hero(
                  tag: 'author-avatar-${author.id}',
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Author name
              Text(
                author.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              // Number of books
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${author.numBooks} ${author.numBooks == 1 ? 'book' : 'books'}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),

              // Description (if available)
              if (author.description.isNotEmpty)
                Text(
                  author.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Provider for authors (will be implemented with real API later)
final authorsProvider = FutureProvider<List<Author>>((ref) async {
  // TODO: Replace with actual API call
  await Future.delayed(const Duration(milliseconds: 500));
  return mockAuthors;
});
