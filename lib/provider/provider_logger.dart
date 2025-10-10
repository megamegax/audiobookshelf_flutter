import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider observer for debugging state changes
final class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (kDebugMode) {
      final providerName =
          context.provider.name ?? context.provider.runtimeType.toString();
      
      // Don't log byte arrays or large objects
      String previousStr = _safeToString(previousValue);
      String newStr = _safeToString(newValue);
      
      print('[PROVIDER] $providerName: $previousStr → $newStr');
    }
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    if (kDebugMode) {
      final providerName =
          context.provider.name ?? context.provider.runtimeType.toString();
      print('[PROVIDER] Disposed: $providerName');
    }
  }

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (kDebugMode) {
      final providerName =
          context.provider.name ?? context.provider.runtimeType.toString();
      print('[PROVIDER] Added: $providerName');
    }
  }

  /// Safely convert objects to string, avoiding byte arrays and large objects
  String _safeToString(Object? value) {
    if (value == null) return 'null';
    
    // Handle byte arrays specially
    if (value is Uint8List) {
      return 'Uint8List(${value.length} bytes)';
    }
    
    // Handle other typed data
    if (value is TypedData) {
      return '${value.runtimeType}(${value.lengthInBytes} bytes)';
    }
    
    // Handle lists that might contain large objects
    if (value is List) {
      if (value.isEmpty) return 'List(empty)';
      if (value.length > 10) return 'List(${value.length} items)';
      return 'List(${value.length} items)';
    }
    
    // Handle maps that might contain large objects
    if (value is Map) {
      if (value.isEmpty) return 'Map(empty)';
      if (value.length > 10) return 'Map(${value.length} entries)';
      return 'Map(${value.length} entries)';
    }
    
    // For other objects, use toString but limit length
    final str = value.toString();
    if (str.length > 200) {
      return '${str.substring(0, 200)}...';
    }
    
    return str;
  }
}

/// Provider for the logger instance
final providerLoggerProvider = Provider<ProviderLogger>((ref) {
  return ProviderLogger();
});
