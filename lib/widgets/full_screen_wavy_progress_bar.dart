import 'package:flutter/material.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'dart:math' as math;

class FullScreenWavyProgressBar extends StatefulWidget {
  final PlayerService playerService;
  final double progress;
  final Duration currentPosition;
  final Duration totalDuration;
  final bool isChapterMode;
  final VoidCallback onToggleMode;
  final Function(double) onSeek;

  const FullScreenWavyProgressBar({
    Key? key,
    required this.playerService,
    required this.progress,
    required this.currentPosition,
    required this.totalDuration,
    required this.isChapterMode,
    required this.onToggleMode,
    required this.onSeek,
  }) : super(key: key);

  @override
  State<FullScreenWavyProgressBar> createState() =>
      _FullScreenWavyProgressBarState();
}

class _FullScreenWavyProgressBarState extends State<FullScreenWavyProgressBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details, Size size) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);
    final progressWidth = size.width - 32; // Account for padding
    final tapX = localPosition.dx - 16; // Account for left padding

    if (tapX >= 0 && tapX <= progressWidth) {
      final newProgress = (tapX / progressWidth).clamp(0.0, 1.0);
      widget.onSeek(newProgress);
    }
  }

  void _handlePanStart(DragStartDetails details, Size size) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);
    final progressWidth = size.width - 32; // Account for padding
    final tapX = localPosition.dx - 16; // Account for left padding

    if (tapX >= 0 && tapX <= progressWidth) {
      final newProgress = (tapX / progressWidth).clamp(0.0, 1.0);
      widget.onSeek(newProgress);
    }
  }

  void _handlePanUpdate(DragUpdateDetails details, Size size) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(details.globalPosition);
    final progressWidth = size.width - 32; // Account for padding
    final tapX = localPosition.dx - 16; // Account for left padding

    if (tapX >= 0 && tapX <= progressWidth) {
      final newProgress = (tapX / progressWidth).clamp(0.0, 1.0);
      widget.onSeek(newProgress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress mode toggle button
        GestureDetector(
          onTap: widget.onToggleMode,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.isChapterMode ? Icons.bookmark : Icons.library_books,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  widget.isChapterMode ? 'Chapter' : 'Full Book',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.swap_horiz,
                  size: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Enhanced wavy progress bar
        Container(
          height: 60,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTapDown: (details) =>
                    _handleTapDown(details, constraints.biggest),
                onPanStart: (details) =>
                    _handlePanStart(details, constraints.biggest),
                onPanUpdate: (details) =>
                    _handlePanUpdate(details, constraints.biggest),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AnimatedBuilder(
                    animation: _waveAnimation,
                    builder: (context, child) {
                      return CustomPaint(
                        size: Size(constraints.maxWidth - 32, 60),
                        painter: FullScreenWavyProgressPainter(
                          progress: widget.progress,
                          waveOffset: _waveAnimation.value,
                          primaryColor: Theme.of(context).colorScheme.primary,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          trackHeight: 8.0,
                          waveAmplitude: 4.0,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FullScreenWavyProgressPainter extends CustomPainter {
  final double progress;
  final double waveOffset;
  final Color primaryColor;
  final Color backgroundColor;
  final double trackHeight;
  final double waveAmplitude;

  FullScreenWavyProgressPainter({
    required this.progress,
    required this.waveOffset,
    required this.primaryColor,
    required this.backgroundColor,
    required this.trackHeight,
    required this.waveAmplitude,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final center = size.height / 2;
    final progressWidth = size.width * progress;
    final radius = trackHeight / 2;

    // Draw background track
    paint.color = backgroundColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, center - radius, size.width, trackHeight),
        Radius.circular(radius),
      ),
      paint,
    );

    if (progress > 0) {
      // Create wavy path for elapsed portion only
      final path = Path();

      // Start from the left edge
      path.moveTo(0, center - radius);

      // Create the top wavy edge for elapsed portion
      for (double x = 0; x <= progressWidth; x += 2) {
        final normalizedX = x / progressWidth;
        final wave =
            math.sin((normalizedX * 4 * math.pi) + waveOffset) * waveAmplitude;
        final y = center - radius + wave;
        path.lineTo(
            x,
            y.clamp(center - radius - waveAmplitude,
                center - radius + waveAmplitude));
      }

      // Complete the right edge of elapsed portion
      path.lineTo(progressWidth, center + radius);

      // Create the bottom wavy edge for elapsed portion (in reverse)
      for (double x = progressWidth; x >= 0; x -= 2) {
        final normalizedX = x / progressWidth;
        final wave =
            math.sin((normalizedX * 4 * math.pi) + waveOffset) * waveAmplitude;
        final y = center + radius - wave;
        path.lineTo(
            x,
            y.clamp(center + radius - waveAmplitude,
                center + radius + waveAmplitude));
      }

      path.close();

      // Fill the wavy elapsed portion
      paint.color = primaryColor;
      canvas.drawPath(path, paint);

      // Add a subtle glow effect
      paint.color = primaryColor.withOpacity(0.3);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawPath(path, paint);
    }

    // Draw progress thumb
    if (progress > 0) {
      paint.maskFilter = null;
      paint.color = primaryColor;
      canvas.drawCircle(
        Offset(progressWidth, center),
        trackHeight * 0.8,
        paint,
      );

      // Inner thumb circle
      paint.color = primaryColor.withOpacity(0.8);
      canvas.drawCircle(
        Offset(progressWidth, center),
        trackHeight * 0.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is! FullScreenWavyProgressPainter ||
        oldDelegate.progress != progress ||
        oldDelegate.waveOffset != waveOffset;
  }
}
