import 'package:audiobookshelf_flutter/model/narrator.dart';
import 'package:audiobookshelf_flutter/layouts/responsive_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Mock data for now - will be replaced with actual API calls
final mockNarrators = [
  Narrator(
    id: 'narrator1',
    name: 'Jim Dale',
    numBooks: 7,
  ),
  Narrator(
    id: 'narrator2',
    name: 'Roy Dotrice',
    numBooks: 5,
  ),
  Narrator(
    id: 'narrator3',
    name: 'Scott Brick',
    numBooks: 12,
  ),
  Narrator(
    id: 'narrator4',
    name: 'Kate Reading',
    numBooks: 8,
  ),
  Narrator(
    id: 'narrator5',
    name: 'Michael Kramer',
    numBooks: 10,
  ),
  Narrator(
    id: 'narrator6',
    name: 'Marc Thompson',
    numBooks: 15,
  ),
];

class NarratorsScreen extends ConsumerWidget {
  const NarratorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverSettings = ref.read(serverSettingsNotifierProvider);

    return ResponsiveLayout(
      body: _buildBody(context),
      title: 'Narrators',
      selectedDrawerItem: SelectedItem.narrators,
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
                final narrator = mockNarrators[index];
                return _buildNarratorCard(context, narrator);
              },
              childCount: mockNarrators.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarratorCard(BuildContext context, Narrator narrator) {
    return Hero(
      tag: 'narrator-${narrator.id}',
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to narrator detail screen
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Navigate to ${narrator.name}\'s books'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Narrator avatar/placeholder
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.secondaryContainer,
                    ],
                  ),
                ),
                child: Icon(
                  Icons.record_voice_over,
                  size: 48,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.7),
                ),
              ),
              // Narrator info
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        narrator.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${narrator.numBooks} book${narrator.numBooks != 1 ? 's' : ''}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
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
    );
  }
}
