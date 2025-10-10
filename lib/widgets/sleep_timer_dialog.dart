import 'package:audiobookshelf_flutter/provider/sleep_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SleepTimerDialog extends ConsumerStatefulWidget {
  const SleepTimerDialog({super.key});

  @override
  ConsumerState<SleepTimerDialog> createState() => _SleepTimerDialogState();
}

class _SleepTimerDialogState extends ConsumerState<SleepTimerDialog> {
  bool _fadeOutEnabled = false;
  bool _waitForChapterEnd = false;
  Duration? _customDuration;
  bool _showCustomPicker = false;

  // Preset durations
  static const List<Duration> _presetDurations = [
    Duration(minutes: 5),
    Duration(minutes: 10),
    Duration(minutes: 15),
    Duration(minutes: 30),
    Duration(minutes: 45),
    Duration(minutes: 60),
  ];

  @override
  Widget build(BuildContext context) {
    final sleepTimerState = ref.watch(sleepTimerProvider);
    final sleepTimerNotifier = ref.read(sleepTimerProvider.notifier);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(
                  Icons.bedtime,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Sleep Timer',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (sleepTimerState.isActive)
                  IconButton(
                    onPressed: () {
                      sleepTimerNotifier.cancelTimer();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
              ],
            ),
            const SizedBox(height: 24),

            // Active timer display
            if (sleepTimerState.isActive) ...[
              _buildActiveTimer(sleepTimerState),
              const SizedBox(height: 24),
            ],

            // Preset buttons
            if (!sleepTimerState.isActive) ...[
              Text(
                'Select Duration',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ..._presetDurations.map((duration) => _buildPresetButton(
                    duration,
                    sleepTimerNotifier,
                  )),
                  _buildChapterEndButton(sleepTimerNotifier),
                ],
              ),
              const SizedBox(height: 16),

              // Custom time picker toggle
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _showCustomPicker = !_showCustomPicker;
                  });
                },
                icon: Icon(_showCustomPicker ? Icons.expand_less : Icons.expand_more),
                label: const Text('Custom Time'),
              ),

              // Custom time picker
              if (_showCustomPicker) ...[
                const SizedBox(height: 16),
                _buildCustomTimePicker(),
                const SizedBox(height: 16),
              ],

              // Options
              const SizedBox(height: 24),
              Text(
                'Options',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _buildOptions(),
            ],

            // Action buttons
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!sleepTimerState.isActive) ...[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _canStartTimer() ? () => _startTimer(sleepTimerNotifier) : null,
                    child: const Text('Start Timer'),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: () {
                      sleepTimerNotifier.cancelTimer();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                    child: const Text('Cancel Timer'),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveTimer(sleepTimerState) {
    final remaining = sleepTimerState.remainingTime;
    if (remaining == null) return const SizedBox.shrink();

    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Timer Active',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 8),
          if (sleepTimerState.fadeOutEnabled || sleepTimerState.waitForChapterEnd) ...[
            Text(
              [
                if (sleepTimerState.fadeOutEnabled) 'Fade out',
                if (sleepTimerState.waitForChapterEnd) 'Wait for chapter end',
              ].join(' • '),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPresetButton(Duration duration, sleepTimerNotifier) {
    return ElevatedButton(
      onPressed: () => _startTimerWithDuration(sleepTimerNotifier, duration),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(_formatDuration(duration)),
    );
  }

  Widget _buildChapterEndButton(sleepTimerNotifier) {
    return ElevatedButton(
      onPressed: () => _startTimerWithDuration(sleepTimerNotifier, null),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: const Text('End of Chapter'),
    );
  }

  Widget _buildCustomTimePicker() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            'Custom Duration',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Hours',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<int>(
                      value: _customDuration?.inHours ?? 0,
                      isExpanded: true,
                      items: List.generate(24, (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString()),
                      )),
                      onChanged: (value) {
                        setState(() {
                          final currentMinutes = _customDuration?.inMinutes.remainder(60) ?? 0;
                          _customDuration = Duration(hours: value ?? 0, minutes: currentMinutes);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Minutes',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    DropdownButton<int>(
                      value: _customDuration?.inMinutes.remainder(60) ?? 0,
                      isExpanded: true,
                      items: List.generate(60, (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString()),
                      )),
                      onChanged: (value) {
                        setState(() {
                          final currentHours = _customDuration?.inHours ?? 0;
                          _customDuration = Duration(hours: currentHours, minutes: value ?? 0);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text('Fade out volume'),
          subtitle: const Text('Gradually reduce volume before stopping'),
          value: _fadeOutEnabled,
          onChanged: (value) {
            setState(() {
              _fadeOutEnabled = value ?? false;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
        CheckboxListTile(
          title: const Text('Wait for chapter end'),
          subtitle: const Text('Stop at the end of current chapter'),
          value: _waitForChapterEnd,
          onChanged: (value) {
            setState(() {
              _waitForChapterEnd = value ?? false;
            });
          },
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }

  bool _canStartTimer() {
    return _customDuration != null && _customDuration!.inSeconds > 0;
  }

  void _startTimer(sleepTimerNotifier) {
    if (_customDuration != null) {
      _startTimerWithDuration(sleepTimerNotifier, _customDuration!);
    }
  }

  void _startTimerWithDuration(sleepTimerNotifier, Duration? duration) {
    if (duration != null) {
      sleepTimerNotifier.startTimer(
        duration,
        fadeOut: _fadeOutEnabled,
        waitForChapterEnd: _waitForChapterEnd,
      );
    } else {
      // End of chapter
      sleepTimerNotifier.startTimer(
        const Duration(seconds: 1), // Minimal duration
        fadeOut: _fadeOutEnabled,
        waitForChapterEnd: true,
      );
    }
    Navigator.of(context).pop();
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    } else {
      return '${duration.inMinutes}m';
    }
  }
}
