import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibrarySelector extends ConsumerWidget {
  const LibrarySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final librariesAsync = ref.watch(availableLibrariesProvider);
    final selectedLibrary = ref.watch(selectedLibraryProvider);
    final librarySelector = ref.watch(librarySelectorProvider);

    return librariesAsync.when(
      data: (libraries) {
        // Don't show dropdown if only one library or no libraries
        if (libraries.length <= 1) {
          return const SizedBox.shrink();
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Library>(
              value: selectedLibrary,
              isExpanded: true,
              hint: const Text('Select Library'),
              items: libraries.map((Library library) {
                return DropdownMenuItem<Library>(
                  value: library,
                  child: Row(
                    children: [
                      Icon(
                        _getLibraryIcon(library.mediaType),
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          library.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (Library? newLibrary) {
                if (newLibrary != null) {
                  librarySelector.selectLibrary(newLibrary);
                }
              },
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  IconData _getLibraryIcon(String? libraryType) {
    switch (libraryType?.toLowerCase()) {
      case 'audiobook':
        return Icons.headphones;
      case 'podcast':
        return Icons.radio;
      case 'ebook':
        return Icons.menu_book;
      default:
        return Icons.library_books;
    }
  }
}

/// Compact library selector for app bar
class CompactLibrarySelector extends ConsumerWidget {
  const CompactLibrarySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final librariesAsync = ref.watch(availableLibrariesProvider);
    final selectedLibrary = ref.watch(selectedLibraryProvider);
    final librarySelector = ref.watch(librarySelectorProvider);

    return librariesAsync.when(
      data: (libraries) {
        // Don't show if only one library or no libraries
        if (libraries.length <= 1) {
          return const SizedBox.shrink();
        }

        return PopupMenuButton<Library>(
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getLibraryIcon(selectedLibrary?.mediaType),
                size: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 4),
              Text(
                selectedLibrary?.name ?? 'Library',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          itemBuilder: (BuildContext context) {
            return libraries.map((Library library) {
              return PopupMenuItem<Library>(
                value: library,
                child: Row(
                  children: [
                    Icon(
                      _getLibraryIcon(library.mediaType),
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        library.name,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    if (library.id == selectedLibrary?.id)
                      Icon(
                        Icons.check,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  ],
                ),
              );
            }).toList();
          },
          onSelected: (Library library) {
            librarySelector.selectLibrary(library);
          },
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  IconData _getLibraryIcon(String? libraryType) {
    switch (libraryType?.toLowerCase()) {
      case 'audiobook':
        return Icons.headphones;
      case 'podcast':
        return Icons.radio;
      case 'ebook':
        return Icons.menu_book;
      default:
        return Icons.library_books;
    }
  }
}
