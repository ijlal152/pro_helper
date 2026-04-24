import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/widgets.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../cubit/edit_profile_cubit.dart';

class EditProfilePage extends StatelessWidget {
  static const String id = '/EditProfilePage';
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get user data from AuthCubit
    final authState = getIt<AuthCubit>().state;
    String fullName = 'Andrew Ainsley';
    String email = 'andrew_ainsley@yourdomain.com';

    if (authState is AuthAuthenticated) {
      fullName = authState.user.name;
      email = authState.user.email;
    }

    return BlocProvider(
      create: (_) => EditProfileCubit(
        fullName: fullName,
        firstName: fullName.split(' ').first,
        dateOfBirth: '12/27/1995',
        email: email,
        country: 'United States',
        phone: '+1 111 467 378 399',
        gender: 'Male',
        address: '267 New Avenue Park, New York',
      ),
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  late TextEditingController fullNameController;
  late TextEditingController firstNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController emailController;
  late TextEditingController countryController;
  late TextEditingController phoneController;
  late TextEditingController genderController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    final state = context.read<EditProfileCubit>().state;
    fullNameController = TextEditingController(text: state.fullName);
    firstNameController = TextEditingController(text: state.firstName);
    dateOfBirthController = TextEditingController(text: state.dateOfBirth);
    emailController = TextEditingController(text: state.email);
    countryController = TextEditingController(text: state.country);
    phoneController = TextEditingController(text: state.phone);
    genderController = TextEditingController(text: state.gender);
    addressController = TextEditingController(text: state.address);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    firstNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    countryController.dispose();
    phoneController.dispose();
    genderController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7FC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1A1A)),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTextField(
                controller: fullNameController,
                labelText: 'Full Name',
                onChanged: (value) {
                  context.read<EditProfileCubit>().updateFullName(value);
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: firstNameController,
                labelText: 'First Name',
                onChanged: (value) {
                  context.read<EditProfileCubit>().updateFirstName(value);
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: dateOfBirthController,
                labelText: 'Date of Birth',
                suffixIcon: Icons.calendar_today,
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1995, 12, 27),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xFF6C47FF),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    final formattedDate =
                        '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
                    dateOfBirthController.text = formattedDate;
                    if (context.mounted) {
                      context.read<EditProfileCubit>().updateDateOfBirth(
                        formattedDate,
                      );
                    }
                  }
                },
                readOnly: true,
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: emailController,
                labelText: 'Email',
                suffixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  context.read<EditProfileCubit>().updateEmail(value);
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: countryController,
                labelText: 'Country',
                suffixIcon: Icons.arrow_drop_down,
                readOnly: true,
                onTap: () {
                  _showCountryPicker(context);
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              _buildPhoneField(),
              const SizedBox(height: 16),
              _buildTextField(
                controller: genderController,
                labelText: 'Gender',
                suffixIcon: Icons.arrow_drop_down,
                readOnly: true,
                onTap: () {
                  _showGenderPicker(context);
                },
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: addressController,
                labelText: 'Address',
                maxLines: 2,
                onChanged: (value) {
                  context.read<EditProfileCubit>().updateAddress(value);
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<EditProfileCubit, EditProfileState>(
                builder: (context, state) {
                  return CustomButton(
                    text: 'Update',
                    onPressed: () async {
                      await context.read<EditProfileCubit>().saveProfile();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile updated successfully!'),
                            backgroundColor: Color(0xFF6C47FF),
                          ),
                        );
                        context.pop();
                      }
                    },
                    isLoading: state.isLoading,
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? suffixIcon,
    TextInputType? keyboardType,
    bool readOnly = false,
    int maxLines = 1,
    VoidCallback? onTap,
    required Function(String) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        maxLines: maxLines,
        onTap: onTap,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1A1A1A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey[600], size: 20)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6C47FF), width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        onChanged: (value) {
          context.read<EditProfileCubit>().updatePhone(value);
        },
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1A1A1A),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Phone Number',
          labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Text('🇺🇸', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_drop_down, color: Colors.grey[600], size: 20),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6C47FF), width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context) {
    final countries = [
      'United States',
      'United Kingdom',
      'Canada',
      'Australia',
      'Germany',
      'France',
      'Pakistan',
      'India',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Country',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 20),
              ...countries.map((country) {
                return Flexible(
                  child: ListTile(
                    title: Text(country),
                    onTap: () {
                      countryController.text = country;
                      context.read<EditProfileCubit>().updateCountry(country);
                      Navigator.pop(context);
                    },
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _showGenderPicker(BuildContext context) {
    final genders = ['Male', 'Female', 'Other'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 20),
              ...genders.map((gender) {
                return ListTile(
                  title: Text(gender),
                  onTap: () {
                    genderController.text = gender;
                    context.read<EditProfileCubit>().updateGender(gender);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
