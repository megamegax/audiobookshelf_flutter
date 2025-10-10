import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'library_selector_provider.g.dart';

/// Provider for the currently selected library
@riverpod
class SelectedLibraryNotifier extends _$SelectedLibraryNotifier {
  @override
  Library? build() => null;

  void selectLibrary(Library? library) {
    state = library;
  }
}

/// Provider for all available libraries
@riverpod
Future<List<Library>> availableLibraries(Ref ref) async {
  final libraryService = ref.watch(libraryServiceProvider);
  final userModel = ref.watch(userModelProvider);

  if (userModel == null) {
    return [];
  }

  try {
    final libraries = await libraryService.fetchLibraries(userModel);

    // Auto-select first library if none is selected
    final selectedLibrary = ref.read(selectedLibraryProvider);
    if (selectedLibrary == null && libraries.isNotEmpty) {
      ref.read(selectedLibraryProvider.notifier).selectLibrary(libraries.first);
    }

    return libraries;
  } catch (e) {
    return [];
  }
}

/// Provider for library selector notifier
@riverpod
SelectedLibraryNotifier librarySelector(Ref ref) {
  return ref.read(selectedLibraryProvider.notifier);
}

class LibrarySelector {
  final Ref ref;

  LibrarySelector(this.ref);

  /// Get currently selected library
  Library? get selectedLibrary => ref.read(selectedLibraryProvider);

  /// Get all available libraries
  List<Library> get availableLibraries {
    final librariesAsync = ref.read(availableLibrariesProvider);
    return librariesAsync.when(
      data: (libraries) => libraries,
      loading: () => [],
      error: (_, __) => [],
    );
  }

  /// Select a library
  void selectLibrary(Library library) {
    ref.read(selectedLibraryProvider.notifier).selectLibrary(library);
  }

  /// Check if multiple libraries are available
  bool get hasMultipleLibraries => availableLibraries.length > 1;

  /// Get library by ID
  Library? getLibraryById(String id) {
    return availableLibraries.firstWhere(
      (library) => library.id == id,
      orElse: () => throw StateError('Library not found'),
    );
  }
}
