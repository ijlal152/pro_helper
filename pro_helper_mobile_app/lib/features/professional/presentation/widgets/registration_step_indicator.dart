import 'package:flutter/material.dart';

/// Step indicator widget for registration process
class RegistrationStepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;

  const RegistrationStepIndicator({
    super.key,
    required this.currentStep,
    required this.stepTitles,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          // Step indicators
          Row(
            children: List.generate(
              stepTitles.length,
              (index) => Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: index <= currentStep
                              ? theme.colorScheme.primary
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    if (index < stepTitles.length - 1)
                      const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Current step title
          Text(
            stepTitles[currentStep],
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Step ${currentStep + 1} of ${stepTitles.length}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
