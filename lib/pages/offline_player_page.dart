import 'package:audiobookshelf_flutter/services/offline_player_service.dart';
import 'package:audiobookshelf_flutter/services/download_service.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class OfflinePlayerPage extends ConsumerStatefulWidget {
  final DownloadedItem item;

  const OfflinePlayerPage({super.key, required this.item});

  @override
  ConsumerState<OfflinePlayerPage> createState() => _OfflinePlayerPageState();
}

class _OfflinePlayerPageState extends ConsumerState<OfflinePlayerPage> {
  late AudioPlayer _audioPlayer;
  late OfflinePlayerService _offlinePlayerService;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _audioPlayer = ref.read(audioPlayerProvider);
    _offlinePlayerService = ref.read(offlinePlayerServiceProvider);
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await _offlinePlayerService.playOfflineItem(widget.item);
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showItemInfo(),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading offline content...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading offline content',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _initializePlayer,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data ?? PlayerState(false, ProcessingState.idle);
        
        return Column(
          children: [
            // Cover and basic info
            _buildCoverSection(),
            
            // Track info
            _buildTrackInfo(),
            
            // Progress bar
            _buildProgressSection(),
            
            // Controls
            _buildControlsSection(playerState),
            
            // Track list
            Expanded(
              child: _buildTrackList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCoverSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.library_music,
                  size: 80,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.item.title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'OFFLINE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackInfo() {
    return StreamBuilder<SequenceState?>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final sequenceState = snapshot.data;
        final currentIndex = sequenceState?.currentIndex ?? 0;
        final currentItem = sequenceState?.currentSource?.tag;
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                currentItem?.title ?? 'Unknown Track',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Track ${currentIndex + 1} of ${sequenceState?.sequence.length ?? 0}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          StreamBuilder<Duration?>(
            stream: _audioPlayer.durationStream,
            builder: (context, durationSnapshot) {
              return StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (context, positionSnapshot) {
                  final position = positionSnapshot.data ?? Duration.zero;
                  final duration = durationSnapshot.data ?? Duration.zero;
              
              return Column(
                children: [
                  Slider(
                    value: duration.inMilliseconds > 0 
                        ? position.inMilliseconds / duration.inMilliseconds 
                        : 0.0,
                    onChanged: (value) {
                      final newPosition = Duration(
                        milliseconds: (value * duration.inMilliseconds).round(),
                      );
                      _audioPlayer.seek(newPosition);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(position)),
                      Text(_formatDuration(duration)),
                    ],
                  ),
                ],
              );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildControlsSection(PlayerState playerState) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.skip_previous),
            iconSize: 32,
            onPressed: playerState.processingState == ProcessingState.ready
                ? () => _audioPlayer.seekToPrevious()
                : null,
          ),
          IconButton(
            icon: Icon(
              playerState.playing ? Icons.pause : Icons.play_arrow,
            ),
            iconSize: 48,
            onPressed: playerState.processingState == ProcessingState.ready
                ? () => playerState.playing 
                    ? _audioPlayer.pause() 
                    : _audioPlayer.play()
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.skip_next),
            iconSize: 32,
            onPressed: playerState.processingState == ProcessingState.ready
                ? () => _audioPlayer.seekToNext()
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildTrackList() {
    return StreamBuilder<SequenceState?>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final sequenceState = snapshot.data;
        final tracks = sequenceState?.sequence ?? [];
        
        return ListView.builder(
          itemCount: tracks.length,
          itemBuilder: (context, index) {
            final track = tracks[index];
            final isCurrentTrack = index == sequenceState?.currentIndex;
            final mediaItem = track.tag;
            
            return ListTile(
              leading: isCurrentTrack
                  ? Icon(
                      Icons.equalizer,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Text('${index + 1}'),
              title: Text(mediaItem.title ?? 'Unknown Track'),
              subtitle: Text('Offline'),
              selected: isCurrentTrack,
              onTap: () => _audioPlayer.seek(Duration.zero, index: index),
            );
          },
        );
      },
    );
  }

  void _showItemInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.item.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tracks: ${widget.item.tracks.length}'),
            Text('Path: ${widget.item.path}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
