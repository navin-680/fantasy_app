import 'dart:async';

import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';

import 'text_widgets.dart';

class DifferenceOfTimerWidget extends StatefulWidget {
  const DifferenceOfTimerWidget({super.key});

  @override
  State<DifferenceOfTimerWidget> createState() =>
      _DifferenceOfTimerWidgetState();
}

class _DifferenceOfTimerWidgetState extends State<DifferenceOfTimerWidget> {
  final DateTime startDate = DateTime.now();
  final DateTime endDate = DateTime.now().add(const Duration(
      hours: 22, minutes: 0, seconds: 12)); // Adjust the time as needed
  Timer? _timer;
  String _countdownText = '';

  @override
  void initState() {
    super.initState();
    updateDifferenceText();
  }

  void updateDifferenceText() {
    final difference = endDate.difference(startDate);

    if (difference.inHours >= 24) {
      setState(() {
        _countdownText = 'Tomorrow';
        //_startCountdownTimer(difference);
      });
    } else if (difference.inHours >= 12) {
      setState(() {
        _countdownText = 'Today';
      });
    } else {
      _startCountdownTimer(difference);
    }
  }

  void _startCountdownTimer(Duration difference) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (difference.inSeconds <= 0) {
        _timer?.cancel();
        setState(() {
          _countdownText = '';
        });
      } else if (difference.inMinutes <= 59) {
        setState(() {
          _countdownText =
              '${difference.inMinutes.remainder(60)}m ${difference.inSeconds.remainder(60)}s';
        });
        difference -= const Duration(seconds: 1);
      } else if (difference.inSeconds <= 59) {
        setState(() {
          _countdownText = '${difference.inSeconds.remainder(60)}s';
        });
        difference -= const Duration(seconds: 1);
      } else {
        setState(() {
          _countdownText =
              '${difference.inHours}h ${difference.inMinutes.remainder(60)}m ${difference.inSeconds.remainder(60)}s';
        });
        difference -= const Duration(seconds: 1);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          if (_countdownText.isNotEmpty)
            TextWidgets.customText(
                text: _countdownText,
                color: MyColors.mainRed,
                fontSize: 12.0,
                fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}
