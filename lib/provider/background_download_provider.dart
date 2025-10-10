import 'dart:async';
import 'package:audiobookshelf_flutter/services/background_download_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'background_download_provider.g.dart';

/// Provider for background download state
@riverpod
class BackgroundDownloadStateNotifier
    extends _$BackgroundDownloadStateNotifier {
  @override
  BackgroundDownloadState build() {
    return const BackgroundDownloadState();
  }

  // TODO: Implement background download functionality

  void pauseItemDownload(String itemId) {
    // TODO: Implement pause download
  }

  void cancelAllDownloads() {
    // TODO: Implement cancel all downloads
  }

  void resumeItemDownload(String itemId) {
    // TODO: Implement resume download
  }

  void cancelItemDownload(String itemId) {
    // TODO: Implement cancel download
  }
}

/// Background download state
class BackgroundDownloadState {
  final Map<String, dynamic> activeDownloads;
  final int totalDownloads;
  final int completedDownloads;
  final int failedDownloads;
  final bool isDownloading;

  const BackgroundDownloadState({
    this.activeDownloads = const {},
    this.totalDownloads = 0,
    this.completedDownloads = 0,
    this.failedDownloads = 0,
    this.isDownloading = false,
  });

  BackgroundDownloadState copyWith({
    Map<String, dynamic>? activeDownloads,
    int? totalDownloads,
    int? completedDownloads,
    int? failedDownloads,
    bool? isDownloading,
  }) {
    return BackgroundDownloadState(
      activeDownloads: activeDownloads ?? this.activeDownloads,
      totalDownloads: totalDownloads ?? this.totalDownloads,
      completedDownloads: completedDownloads ?? this.completedDownloads,
      failedDownloads: failedDownloads ?? this.failedDownloads,
      isDownloading: isDownloading ?? this.isDownloading,
    );
  }
}
