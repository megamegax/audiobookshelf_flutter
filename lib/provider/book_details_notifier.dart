import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/provider/book_details_state.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';

part 'book_details_notifier.g.dart';

@riverpod
Future<DetailedLibraryItem> bookDetailsData(Ref ref, String itemId) async {
  final libraryService = ref.read(libraryServiceProvider);
  final userModel = ref.read(userModelProvider);

  if (userModel == null) {
    throw Exception('User not logged in');
  }

  try {
    if (kDebugMode) {
      print(
        '[BookDetailsData] Fetching detailed information for item: $itemId',
      );
    }

    final detailedItem = await libraryService.fetchDetailedLibraryItem(
      userModel,
      itemId,
    );

    if (kDebugMode) {
      print('[BookDetailsData] Successfully fetched detailed information');
    }

    return detailedItem;
  } catch (e) {
    if (kDebugMode) {
      print('[BookDetailsData] Error fetching detailed information: $e');
    }
    rethrow;
  }
}

// Optimized provider for just the basic item info (no detailed data)
@riverpod
Future<LibraryItemEntity?> bookDetailsBasic(Ref ref, String itemId) async {
  // This could be optimized to fetch from local database first
  // For now, we'll use the existing data provider but select only basic info
  final detailedData = await ref.watch(bookDetailsDataProvider(itemId).future);
  // Convert DetailedLibraryItem to LibraryItemEntity
  // This is a simplified conversion - you might need to adjust based on your actual data structure
  return null; // TODO: Implement proper conversion
}

// Optimized provider for just the cover image
@riverpod
Future<Uint8List?> bookDetailsCover(Ref ref, String itemId) async {
  final detailedData = await ref.watch(bookDetailsDataProvider(itemId).future);
  // DetailedMedia doesn't have coverBytes - it's in the media.coverPath
  // This would need to be downloaded separately
  return null; // TODO: Implement cover image fetching
}

@riverpod
class BookDetailsUINotifier extends _$BookDetailsUINotifier {
  @override
  BookDetailsUI build(String itemId) => const BookDetailsUI();

  void toggleDescription() {
    state = state.copyWith(isDescriptionExpanded: !state.isDescriptionExpanded);
  }

  void toggleCoverModal() {
    state = state.copyWith(showCoverModal: !state.showCoverModal);
  }

  void toggleSection(String sectionName) {
    final newExpandedSections = Set<String>.from(state.expandedSections);
    if (newExpandedSections.contains(sectionName)) {
      newExpandedSections.remove(sectionName);
    } else {
      newExpandedSections.add(sectionName);
    }
    state = state.copyWith(expandedSections: newExpandedSections);
  }
}
