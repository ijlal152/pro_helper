import 'package:flutter/material.dart';

import '../../../domain/entities/profession.dart';

/// Step 2: Professional details (Profession, Experience)
class ProfessionalDetailsStep extends StatefulWidget {
  final Map<String, dynamic> formData;
  final Function(Map<String, dynamic>) onNext;
  final VoidCallback onBack;

  const ProfessionalDetailsStep({
    super.key,
    required this.formData,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<ProfessionalDetailsStep> createState() =>
      _ProfessionalDetailsStepState();
}

class _ProfessionalDetailsStepState extends State<ProfessionalDetailsStep> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedProfession;
  int _experienceYears = 0;

  @override
  void initState() {
    super.initState();
    _selectedProfession = widget.formData['profession'] as String?;
    _experienceYears = widget.formData['experienceYears'] as int? ?? 0;
  }

  void _handleNext() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedProfession == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a profession')),
        );
        return;
      }
      if (_experienceYears < 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select years of experience')),
        );
        return;
      }

      widget.onNext({
        'profession': _selectedProfession!,
        'experienceYears': _experienceYears,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tell us about your profession',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Text(
              'Select Your Profession',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ProfessionCategories.categories.map((profession) {
                final isSelected = _selectedProfession == profession;
                return FilterChip(
                  label: Text(profession),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedProfession = selected ? profession : null;
                    });
                  },
                  selectedColor: theme.colorScheme.primary.withOpacity(0.2),
                  checkmarkColor: theme.colorScheme.primary,
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            Text(
              'Years of Experience',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _experienceYears.toDouble(),
                    min: 0,
                    max: 30,
                    divisions: 30,
                    label: _experienceYears == 0
                        ? 'Select experience'
                        : '$_experienceYears ${_experienceYears == 1 ? 'year' : 'years'}',
                    onChanged: (value) {
                      setState(() {
                        _experienceYears = value.toInt();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _experienceYears == 0
                        ? '0'
                        : '$_experienceYears ${_experienceYears == 1 ? 'yr' : 'yrs'}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onBack,
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: _handleNext,
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
