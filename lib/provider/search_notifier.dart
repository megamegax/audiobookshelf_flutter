import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audiobookshelf_flutter/model/search_state.dart';
import 'package:audiobookshelf_flutter/services/local_search_service.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/library_selector_provider.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  Timer? _debounceTimer;

  @override
  SearchState build() {
    return const SearchState();
  }

  void updateQuery(String query) {
    // Cancel previous timer
    _debounceTimer?.cancel();

    // Update state immediately with new query
    state = state.copyWith(
      query: query,
      isSearching: query.isNotEmpty,
      results: query.isEmpty ? [] : state.results,
    );

    // If query is empty, clear results
    if (query.isEmpty) {
      state = state.copyWith(
        isSearching: false,
        results: [],
        hasError: false,
        errorMessage: null,
      );
      return;
    }

    // Debounce the search
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    try {
      state = state.copyWith(
        isSearching: true,
        hasError: false,
        errorMessage: null,
      );

      // Get the required dependencies
      final searchService = ref.read(localSearchServiceProvider);
      final repositoryAsync = ref.read(libraryItemsRepositoryProvider);
      final userModel = ref.read(userModelProvider);

      if (repositoryAsync is! AsyncData<LibraryItemsRepository>) {
        throw Exception('Repository not available');
      }
      final repository = repositoryAsync.value;

      if (userModel == null) {
        throw Exception('User not logged in');
      }

      // Get the selected library
      final selectedLibrary = ref.read(selectedLibraryProvider);
      if (selectedLibrary == null) {
        throw Exception('No library selected');
      }

      // Perform the search
      final results = await searchService.searchBooks(
        repository,
        selectedLibrary.id,
        query,
      );

      state = state.copyWith(
        isSearching: false,
        results: results,
        hasError: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isSearching: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  void clearSearch() {
    _debounceTimer?.cancel();
    state = const SearchState();
  }

  void dispose() {
    _debounceTimer?.cancel();
  }
}

// Optimized search query provider with autoDispose
@riverpod
String searchQuery(Ref ref) {
  return ref.watch(searchProvider).query;
}

// Optimized search results provider with autoDispose
@riverpod
List<dynamic> searchResults(Ref ref) {
  return ref.watch(searchProvider).results;
}

// Optimized search loading state provider
@riverpod
bool isSearching(Ref ref) {
  return ref.watch(searchProvider).isSearching;
}
