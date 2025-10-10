import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/services/local_search_service.dart';

part 'local_search_service_provider.g.dart';

@riverpod
LocalSearchService localSearchService(Ref ref) {
  return LocalSearchService();
}
