import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/professional_registration_bloc.dart';
import '../widgets/registration_step_indicator.dart';
import 'steps/basic_info_step.dart';
import 'steps/bio_profile_step.dart';
import 'steps/professional_details_step.dart';
import 'steps/work_images_step.dart';

/// Multi-step professional registration screen
class ProfessionalRegistrationScreen extends StatefulWidget {
  final String userId;

  const ProfessionalRegistrationScreen({
    super.key,
    required this.userId,
  });

  @override
  State<ProfessionalRegistrationScreen> createState() =>
      _ProfessionalRegistrationScreenState();
}

class _ProfessionalRegistrationScreenState
    extends State<ProfessionalRegistrationScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  final Map<String, dynamic> _formData = {};

  final List<String> _stepTitles = [
    'Basic Info',
    'Professional Details',
    'Bio & Profile',
    'Work Portfolio',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() => _currentStep++);
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateFormData(Map<String, dynamic> data) {
    setState(() {
      _formData.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Registration'),
        elevation: 0,
      ),
      body: BlocListener<ProfessionalRegistrationBloc,
          ProfessionalRegistrationState>(
        listener: (context, state) {
          if (state is ProfessionalRegistrationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registration successful!'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          } else if (state is ProfessionalRegistrationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Column(
          children: [
            RegistrationStepIndicator(
              currentStep: _currentStep,
              stepTitles: _stepTitles,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BasicInfoStep(
                    formData: _formData,
                    onNext: (data) {
                      _updateFormData(data);
                      _nextStep();
                    },
                  ),
                  ProfessionalDetailsStep(
                    formData: _formData,
                    onNext: (data) {
                      _updateFormData(data);
                      _nextStep();
                    },
                    onBack: _previousStep,
                  ),
                  BioProfileStep(
                    formData: _formData,
                    onNext: (data) {
                      _updateFormData(data);
                      _nextStep();
                    },
                    onBack: _previousStep,
                  ),
                  WorkImagesStep(
                    userId: widget.userId,
                    formData: _formData,
                    onComplete: (data) {
                      _updateFormData(data);
                      // Submit registration
                      context.read<ProfessionalRegistrationBloc>().add(
                            RegisterProfessionalEvent(
                              userId: widget.userId,
                              fullName: _formData['fullName'] as String,
                              email: _formData['email'] as String,
                              phoneNumber: _formData['phoneNumber'] as String,
                              profession: _formData['profession'] as String,
                              experienceYears:
                                  _formData['experienceYears'] as int,
                              bio: _formData['bio'] as String?,
                              profileImage: _formData['profileImage'],
                            ),
                          );
                    },
                    onBack: _previousStep,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
