import 'dart:async';
import 'package:audiobookshelf_flutter/services/advanced_search_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for advanced search state
final advancedSearchStateProvider =
    StateNotifierProvider<AdvancedSearchStateNotifier, AdvancedSearchState>(
        (ref) {
  return AdvancedSearchStateNotifier(
      ref.watch(advancedSearchServiceProvider), ref);
});

/// Advanced search state
class AdvancedSearchState {
  final List<SearchResult> results;
  final SearchFilters filters;
  final bool isLoading;
  final String? error;
  final String? currentQuery;
  final int totalResults;
  final bool hasMore;
  final List<String> suggestions;

  const AdvancedSearchState({
    this.results = const [],
    required this.filters,
    this.isLoading = false,
    this.error,
    this.currentQuery,
    this.totalResults = 0,
    this.hasMore = false,
    this.suggestions = const [],
  });

  AdvancedSearchState copyWith({
    List<SearchResult>? results,
    SearchFilters? filters,
    bool? isLoading,
    String? error,
    String? currentQuery,
    int? totalResults,
    bool? hasMore,
    List<String>? suggestions,
  }) {
    return AdvancedSearchState(
      results: results ?? this.results,
      filters: filters ?? this.filters,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentQuery: currentQuery ?? this.currentQuery,
      totalResults: totalResults ?? this.totalResults,
      hasMore: hasMore ?? this.hasMore,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}

/// Advanced search state notifier
class AdvancedSearchStateNotifier extends StateNotifier<AdvancedSearchState> {
  final AdvancedSearchService _searchService;
  final Ref _ref;
  Timer? _debounceTimer;
  int _currentOffset = 0;
  static const int _pageSize = 20;

  AdvancedSearchStateNotifier(this._searchService, this._ref)
      : super(AdvancedSearchState(filters: SearchFilters.empty()));

  /// Search with debouncing
  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  /// Perform the actual search
  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      clearSearch();
      return;
    }

    state = state.copyWith(
      isLoading: true,
      error: null,
      currentQuery: query,
      results: [],
      totalResults: 0,
      hasMore: false,
    );

    _currentOffset = 0;

    try {
      final userModel = _ref.read(userModelNotifierProvider);
      if (userModel == null) {
        state = state.copyWith(
          isLoading: false,
          error: 'User not logged in',
        );
        return;
      }

      final searchResults = await _searchService.search(
        userModel: userModel,
        query: query,
        mediaTypes: state.filters.mediaTypes.isNotEmpty
            ? state.filters.mediaTypes
            : null,
        yearMin: state.filters.yearMin,
        yearMax: state.filters.yearMax,
        limit: _pageSize,
        offset: _currentOffset,
      );

      state = state.copyWith(
        isLoading: false,
        results: searchResults.results,
        totalResults: searchResults.total,
        hasMore: searchResults.hasMore,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Load more results
  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading || state.currentQuery == null) {
      return;
    }

    state = state.copyWith(isLoading: true);
    _currentOffset += _pageSize;

    try {
      final userModel = _ref.read(userModelNotifierProvider);
      if (userModel == null) {
        state = state.copyWith(isLoading: false);
        return;
      }

      final searchResults = await _searchService.search(
        userModel: userModel,
        query: state.currentQuery!,
        mediaTypes: state.filters.mediaTypes.isNotEmpty
            ? state.filters.mediaTypes
            : null,
        yearMin: state.filters.yearMin,
        yearMax: state.filters.yearMax,
        limit: _pageSize,
        offset: _currentOffset,
      );

      state = state.copyWith(
        isLoading: false,
        results: [...state.results, ...searchResults.results],
        hasMore: searchResults.hasMore,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Clear search results
  void clearSearch() {
    _debounceTimer?.cancel();
    state = state.copyWith(
      results: [],
      currentQuery: null,
      totalResults: 0,
      hasMore: false,
      error: null,
    );
    _currentOffset = 0;
  }

  /// Retry last search
  void retry() {
    if (state.currentQuery != null) {
      _performSearch(state.currentQuery!);
    }
  }

  /// Toggle media type filter
  void toggleMediaType(String mediaType, bool selected) {
    final mediaTypes = List<String>.from(state.filters.mediaTypes);
    if (selected) {
      mediaTypes.add(mediaType);
    } else {
      mediaTypes.remove(mediaType);
    }

    final newFilters = SearchFilters(
      mediaTypes: mediaTypes,
      authors: state.filters.authors,
      narrators: state.filters.narrators,
      series: state.filters.series,
      genres: state.filters.genres,
      yearMin: state.filters.yearMin,
      yearMax: state.filters.yearMax,
      ratingMin: state.filters.ratingMin,
      ratingMax: state.filters.ratingMax,
      durationMin: state.filters.durationMin,
      durationMax: state.filters.durationMax,
    );

    state = state.copyWith(filters: newFilters);

    // Re-search with new filters
    if (state.currentQuery != null) {
      _performSearch(state.currentQuery!);
    }
  }

  /// Set year range filter
  void setYearRange(int? yearMin, int? yearMax) {
    final newFilters = SearchFilters(
      mediaTypes: state.filters.mediaTypes,
      authors: state.filters.authors,
      narrators: state.filters.narrators,
      series: state.filters.series,
      genres: state.filters.genres,
      yearMin: yearMin,
      yearMax: yearMax,
      ratingMin: state.filters.ratingMin,
      ratingMax: state.filters.ratingMax,
      durationMin: state.filters.durationMin,
      durationMax: state.filters.durationMax,
    );

    state = state.copyWith(filters: newFilters);

    // Re-search with new filters
    if (state.currentQuery != null) {
      _performSearch(state.currentQuery!);
    }
  }

  /// Get search suggestions
  Future<void> getSuggestions(String query) async {
    if (query.length < 2) {
      state = state.copyWith(suggestions: []);
      return;
    }

    try {
      final userModel = _ref.read(userModelNotifierProvider);
      if (userModel == null) return;

      final suggestions = await _searchService.getSearchSuggestions(
        userModel: userModel,
        query: query,
        limit: 10,
      );

      state = state.copyWith(suggestions: suggestions);
    } catch (e) {
      // Ignore suggestion errors
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
