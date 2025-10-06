import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final advancedSearchServiceProvider = Provider<AdvancedSearchService>((ref) {
  return AdvancedSearchService(
    ref.watch(httpClientProvider),
    ref.watch(serverAddressProvider),
    ref.watch(loginStateProvider.notifier),
  );
});

class AdvancedSearchService {
  final http.Client httpClient;
  final String serverAddress;
  final LoginStateNotifier loginStateNotifier;

  AdvancedSearchService(
      this.httpClient, this.serverAddress, this.loginStateNotifier);

  /// Search with advanced filters
  Future<SearchResults> search({
    required UserModel userModel,
    required String query,
    String? libraryId,
    List<String>? mediaTypes,
    List<String>? authors,
    List<String>? narrators,
    List<String>? series,
    List<String>? genres,
    int? yearMin,
    int? yearMax,
    double? ratingMin,
    double? ratingMax,
    int? durationMin,
    int? durationMax,
    bool? isFinished,
    bool? isInProgress,
    bool? isNotStarted,
    String? sortBy,
    String? sortOrder,
    int? limit,
    int? offset,
  }) async {
    try {
      final requestBody = <String, dynamic>{
        'query': query,
        if (libraryId != null) 'libraryId': libraryId,
        if (mediaTypes != null && mediaTypes.isNotEmpty)
          'mediaTypes': mediaTypes,
        if (authors != null && authors.isNotEmpty) 'authors': authors,
        if (narrators != null && narrators.isNotEmpty) 'narrators': narrators,
        if (series != null && series.isNotEmpty) 'series': series,
        if (genres != null && genres.isNotEmpty) 'genres': genres,
        if (yearMin != null) 'yearMin': yearMin,
        if (yearMax != null) 'yearMax': yearMax,
        if (ratingMin != null) 'ratingMin': ratingMin,
        if (ratingMax != null) 'ratingMax': ratingMax,
        if (durationMin != null) 'durationMin': durationMin,
        if (durationMax != null) 'durationMax': durationMax,
        if (isFinished != null) 'isFinished': isFinished,
        if (isInProgress != null) 'isInProgress': isInProgress,
        if (isNotStarted != null) 'isNotStarted': isNotStarted,
        if (sortBy != null) 'sortBy': sortBy,
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      };

      final response = await _makeAuthenticatedRequest(
        'POST',
        '/api/search/advanced',
        userModel: userModel,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return SearchResults.fromJson(responseData);
      } else {
        throw Exception('Search failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Advanced search error: $e');
      rethrow;
    }
  }

  /// Get search suggestions
  Future<List<String>> getSearchSuggestions({
    required UserModel userModel,
    required String query,
    String? libraryId,
    int? limit,
  }) async {
    try {
      final response = await _makeAuthenticatedRequest(
        'GET',
        '/api/search/suggestions?query=${Uri.encodeComponent(query)}${libraryId != null ? '&libraryId=$libraryId' : ''}${limit != null ? '&limit=$limit' : ''}',
        userModel: userModel,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return List<String>.from(responseData['suggestions'] ?? []);
      } else {
        throw Exception(
            'Suggestions failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Search suggestions error: $e');
      return [];
    }
  }

  /// Get search filters
  Future<SearchFilters> getSearchFilters({
    required UserModel userModel,
    String? libraryId,
  }) async {
    try {
      final response = await _makeAuthenticatedRequest(
        'GET',
        '/api/search/filters${libraryId != null ? '?libraryId=$libraryId' : ''}',
        userModel: userModel,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return SearchFilters.fromJson(responseData);
      } else {
        throw Exception('Filters failed with status: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Search filters error: $e');
      return SearchFilters.empty();
    }
  }

  /// Make authenticated request with automatic token refresh
  Future<http.Response> _makeAuthenticatedRequest(
    String method,
    String endpoint, {
    Map<String, String>? headers,
    String? body,
    UserModel? userModel,
  }) async {
    final requestHeaders = <String, String>{
      'Content-Type': 'application/json',
      ...?headers,
    };

    if (userModel != null) {
      requestHeaders['Authorization'] = 'Bearer ${userModel.token}';
    }

    final uri = Uri.parse('$serverAddress$endpoint');
    http.Response response;

    if (method.toUpperCase() == 'GET') {
      response = await httpClient.get(uri, headers: requestHeaders);
    } else if (method.toUpperCase() == 'POST') {
      response =
          await httpClient.post(uri, headers: requestHeaders, body: body);
    } else {
      throw UnsupportedError('HTTP method $method not supported');
    }

    // Handle 401 Unauthorized - try to refresh token
    if (response.statusCode == 401 && userModel != null) {
      final newToken = await loginStateNotifier.refreshToken();
      if (newToken != null) {
        // Retry the request with the new token
        requestHeaders['Authorization'] = 'Bearer $newToken';

        if (method.toUpperCase() == 'GET') {
          response = await httpClient.get(uri, headers: requestHeaders);
        } else if (method.toUpperCase() == 'POST') {
          response =
              await httpClient.post(uri, headers: requestHeaders, body: body);
        }
      }
    }

    return response;
  }
}

/// Search results model
class SearchResults {
  final List<SearchResult> results;
  final int total;
  final int limit;
  final int offset;
  final bool hasMore;

  const SearchResults({
    required this.results,
    required this.total,
    required this.limit,
    required this.offset,
    required this.hasMore,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => SearchResult.fromJson(item))
              .toList() ??
          [],
      total: json['total'] ?? 0,
      limit: json['limit'] ?? 20,
      offset: json['offset'] ?? 0,
      hasMore: json['hasMore'] ?? false,
    );
  }
}

/// Search result model
class SearchResult {
  final String id;
  final String title;
  final String? author;
  final String? narrator;
  final String? series;
  final String? description;
  final String? coverUrl;
  final String? mediaType;
  final int? year;
  final double? rating;
  final int? duration;
  final bool? isFinished;
  final double? progress;

  const SearchResult({
    required this.id,
    required this.title,
    this.author,
    this.narrator,
    this.series,
    this.description,
    this.coverUrl,
    this.mediaType,
    this.year,
    this.rating,
    this.duration,
    this.isFinished,
    this.progress,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'],
      narrator: json['narrator'],
      series: json['series'],
      description: json['description'],
      coverUrl: json['coverUrl'],
      mediaType: json['mediaType'],
      year: json['year'],
      rating: json['rating']?.toDouble(),
      duration: json['duration'],
      isFinished: json['isFinished'],
      progress: json['progress']?.toDouble(),
    );
  }
}

/// Search filters model
class SearchFilters {
  final List<String> mediaTypes;
  final List<String> authors;
  final List<String> narrators;
  final List<String> series;
  final List<String> genres;
  final int? yearMin;
  final int? yearMax;
  final double? ratingMin;
  final double? ratingMax;
  final int? durationMin;
  final int? durationMax;

  const SearchFilters({
    required this.mediaTypes,
    required this.authors,
    required this.narrators,
    required this.series,
    required this.genres,
    this.yearMin,
    this.yearMax,
    this.ratingMin,
    this.ratingMax,
    this.durationMin,
    this.durationMax,
  });

  factory SearchFilters.fromJson(Map<String, dynamic> json) {
    return SearchFilters(
      mediaTypes: List<String>.from(json['mediaTypes'] ?? []),
      authors: List<String>.from(json['authors'] ?? []),
      narrators: List<String>.from(json['narrators'] ?? []),
      series: List<String>.from(json['series'] ?? []),
      genres: List<String>.from(json['genres'] ?? []),
      yearMin: json['yearMin'],
      yearMax: json['yearMax'],
      ratingMin: json['ratingMin']?.toDouble(),
      ratingMax: json['ratingMax']?.toDouble(),
      durationMin: json['durationMin'],
      durationMax: json['durationMax'],
    );
  }

  factory SearchFilters.empty() {
    return const SearchFilters(
      mediaTypes: [],
      authors: [],
      narrators: [],
      series: [],
      genres: [],
    );
  }
}
