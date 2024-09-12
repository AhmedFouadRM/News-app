import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  const LoadingIndecator({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    return progress < 1
        ? SizedBox(
            height: 5,
            child: LinearProgressIndicator(
              value: progress,
              color: Colors.orange,
            ),
          )
        : const SizedBox();
  }
}
