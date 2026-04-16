import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Step 3: Bio and Profile Image
class BioProfileStep extends StatefulWidget {
  final Map<String, dynamic> formData;
  final Function(Map<String, dynamic>) onNext;
  final VoidCallback onBack;

  const BioProfileStep({
    super.key,
    required this.formData,
    required this.onNext,
    required this.onBack,
  });

  @override
  State<BioProfileStep> createState() => _BioProfileStepState();
}

class _BioProfileStepState extends State<BioProfileStep> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _bioController;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController(
      text: widget.formData['bio'] as String?,
    );
    _profileImage = widget.formData['profileImage'] as File?;
  }

  @override
  void dispose() {
    _bioController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onNext({
        'bio': _bioController.text.trim().isEmpty
            ? null
            : _bioController.text.trim(),
        'profileImage': _profileImage,
      });
    }
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
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
              'Add a profile picture and bio',
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: _profileImage != null
                      ? ClipOval(
                          child: Image.file(
                            _profileImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.add_a_photo_outlined,
                          size: 48,
                          color: theme.colorScheme.primary,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap to add profile photo (optional)',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(
                labelText: 'Bio (Optional)',
                hintText:
                    'Tell customers about yourself and your services...',
                alignLabelWithHint: true,
              ),
              maxLines: 5,
              maxLength: 500,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 32),
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
