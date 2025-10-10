import 'dart:async';
import 'dart:io';

import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class EbookReaderService {
  final UserModel userModel;
  final LibraryService libraryService;
  final Ref ref;

  EbookReaderService({
    required this.userModel,
    required this.libraryService,
    required this.ref,
  });

  /// Download ebook file to local storage
  Future<String> downloadEbook(EBookFile ebook, String itemId) async {
    try {
      // Get server address
      final serverAddress = ref.read(serverAddressProvider);

      // Construct download URL
      final url = '$serverAddress/api/items/$itemId/file/${ebook.ino}/download';

      if (kDebugMode) {
        print('[EBOOK_READER_SERVICE] Downloading ebook from: $url');
      }

      // Get local directory
      final directory = await getApplicationDocumentsDirectory();
      final ebookDir = Directory(path.join(directory.path, 'ebooks'));
      if (!await ebookDir.exists()) {
        await ebookDir.create(recursive: true);
      }

      // Download file with authentication
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${userModel.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to download ebook: ${response.statusCode}');
      }

      // Save to local file
      final filename = ebook.metadata?.filename ?? 'ebook';
      final filePath = path.join(ebookDir.path, filename);
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      if (kDebugMode) {
        print('[EBOOK_READER_SERVICE] Downloaded ebook to: $filePath');
      }

      return filePath;
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER_SERVICE] Error downloading ebook: $e');
      }
      rethrow;
    }
  }

  /// Parse EPUB location string to chapter ID
  String parseEpubLocation(String location) {
    // EPUB locations are typically in format: epubcfi(/6/14[chap01ref]!/4/2/1:0)
    // We'll extract the chapter reference
    try {
      final match = RegExp(r'\[([^\]]+)\]').firstMatch(location);
      if (match != null) {
        return match.group(1) ?? '';
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER_SERVICE] Error parsing EPUB location: $e');
      }
    }
    return '';
  }

  /// Parse PDF location string to page number
  int parsePdfLocation(String location) {
    // PDF locations are typically in format: page_50 or just a number
    try {
      if (location.startsWith('page_')) {
        return int.parse(location.substring(5));
      }
      return int.parse(location);
    } catch (e) {
      if (kDebugMode) {
        print('[EBOOK_READER_SERVICE] Error parsing PDF location: $e');
      }
    }
    return 1; // Default to first page
  }

  /// Get file extension from filename
  String getFileExtension(String filename) {
    return filename.toLowerCase().split('.').last;
  }

  /// Check if file is PDF
  bool isPdf(String filename) {
    return getFileExtension(filename) == 'pdf';
  }

  /// Check if file is EPUB
  bool isEpub(String filename) {
    return getFileExtension(filename) == 'epub';
  }
}

/// Provider for EbookReaderService
final ebookReaderServiceProvider = Provider<EbookReaderService>((ref) {
  return EbookReaderService(
    userModel: ref.watch(userModelProvider) ?? UserModel(),
    libraryService: ref.watch(libraryServiceProvider),
    ref: ref,
  );
});
