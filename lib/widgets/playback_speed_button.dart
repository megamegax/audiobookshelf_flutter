import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaybackSpeedButton extends ConsumerStatefulWidget {
  const PlaybackSpeedButton({super.key});

  @override
  ConsumerState<PlaybackSpeedButton> createState() =>
      _PlaybackSpeedButtonState();
}

class _PlaybackSpeedButtonState extends ConsumerState<PlaybackSpeedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // Preset speeds in order
  static const List<double> _speeds = [1.0, 1.25, 1.5, 1.75, 2.0, 0.75, 0.5];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() async {
    // Animate button press
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    final playerService = ref.read(playerServiceProvider);
    final currentSpeed = playerService.playbackSpeed;

    // Find current speed index and get next speed
    final currentIndex = _speeds.indexOf(currentSpeed);
    final nextIndex = (currentIndex + 1) % _speeds.length;
    final nextSpeed = _speeds[nextIndex];

    await playerService.setPlaybackSpeed(nextSpeed);
  }

  @override
  Widget build(BuildContext context) {
    final playerState = ref.watch(playerServiceProvider);
    final currentSpeed = playerState.playbackSpeed;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _onTap,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.speed,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${currentSpeed.toStringAsFixed(currentSpeed == currentSpeed.toInt() ? 0 : 2)}x',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
