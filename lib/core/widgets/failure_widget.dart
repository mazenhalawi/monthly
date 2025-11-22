import 'package:flutter/material.dart';
import 'package:mobile_recruitment_test/core/errors/failure.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  final Function? onRetryPressed;

  const FailureWidget({required this.failure, this.onRetryPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SelectableText(
                  failure.message,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (onRetryPressed != null)
            ElevatedButton(
              onPressed: () => onRetryPressed?.call(),
              child: Text("Retry"),
            ),
        ],
      ),
    );
  }
}
