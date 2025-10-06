import 'dart:math' as math;
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class WavyProgressBar extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final PlayerService playerService;
  final double progress;
  final double height;

  const WavyProgressBar({
    super.key,
    required this.audioPlayer,
    required this.playerService,
    required this.progress,
    this.height = 6.0,
  });

  @override
  ConsumerState<WavyProgressBar> createState() => _WavyProgressBarState();
}

class _WavyProgressBarState extends ConsumerState<WavyProgressBar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDragging = false;
  double _dragValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTapDown: (details) {
        _handleTap(details.localPosition);
      },
      onPanStart: (details) {
        _isDragging = true;
        _handlePan(details.localPosition);
      },
      onPanUpdate: (details) {
        if (_isDragging) {
          _handlePan(details.localPosition);
        }
      },
      onPanEnd: (details) {
        if (_isDragging) {
          _isDragging = false;
          _commitSeek();
        }
      },
      child: Container(
        height: widget.height * 3, // Extra height for touch area
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(double.infinity, widget.height),
                painter: WavyProgressPainter(
                  progress: _isDragging ? _dragValue : widget.progress,
                  animationValue: _animation.value,
                  activeColor: colorScheme.primary,
                  inactiveColor: colorScheme.surfaceContainerHighest,
                  thumbColor: colorScheme.primary,
                  height: widget.height,
                  isDragging: _isDragging,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleTap(Offset localPosition) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final tapPosition = localPosition.dx / renderBox.size.width;
    _dragValue = tapPosition.clamp(0.0, 1.0);
    _commitSeek();
  }

  void _handlePan(Offset localPosition) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final panPosition = localPosition.dx / renderBox.size.width;
    setState(() {
      _dragValue = panPosition.clamp(0.0, 1.0);
    });
  }

  void _commitSeek() async {
    await widget.playerService.seekWithinCurrentTrack(_dragValue);
    widget.playerService.updateMediaProgress();
  }
}

class WavyProgressPainter extends CustomPainter {
  final double progress;
  final double animationValue;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double height;
  final bool isDragging;

  WavyProgressPainter({
    required this.progress,
    required this.animationValue,
    required this.activeColor,
    required this.inactiveColor,
    required this.thumbColor,
    required this.height,
    required this.isDragging,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = height;

    // Draw wavy inactive track
    final inactivePath = _createWavyPath(size, 1.0, animationValue);
    paint
      ..color = inactiveColor
      ..style = PaintingStyle.stroke;
    canvas.drawPath(inactivePath, paint);

    // Draw wavy active track
    if (progress > 0) {
      final activePath = _createWavyPath(size, progress, animationValue);
      paint
        ..color = activeColor
        ..style = PaintingStyle.stroke;
      canvas.drawPath(activePath, paint);
    }

    // Draw thumb at progress position
    final thumbX = size.width * progress;
    final thumbY = size.height / 2 +
        math.sin(animationValue + (thumbX / size.width) * 4 * math.pi) *
            (height * 0.3);

    final thumbPaint = Paint()
      ..color = thumbColor
      ..style = PaintingStyle.fill;

    final thumbRadius = isDragging ? height : height * 0.8;
    canvas.drawCircle(
      Offset(thumbX, thumbY),
      thumbRadius,
      thumbPaint,
    );

    // Draw thumb border if dragging
    if (isDragging) {
      final borderPaint = Paint()
        ..color = thumbColor.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
      canvas.drawCircle(
        Offset(thumbX, thumbY),
        thumbRadius + 4,
        borderPaint,
      );
    }
  }

  Path _createWavyPath(Size size, double progressEnd, double animationValue) {
    final path = Path();
    final waveHeight = height * 0.3;
    final waveCount = 4.0;
    final endX = size.width * progressEnd;

    if (endX <= 0) return path;

    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= endX; x += 2.0) {
      final normalizedX = x / size.width;
      final waveOffset =
          math.sin(animationValue + normalizedX * waveCount * 2 * math.pi);
      final y = size.height / 2 + waveOffset * waveHeight;
      path.lineTo(x, y);
    }

    return path;
  }

  @override
  bool shouldRepaint(WavyProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.animationValue != animationValue ||
        oldDelegate.isDragging != isDragging;
  }
}
