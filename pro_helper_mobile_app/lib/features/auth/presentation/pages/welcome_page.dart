import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // App logo/icon
              Icon(
                Icons.handyman_rounded,
                size: 120,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),

              // App name
              Text(
                'ProHelper',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Tagline
              Text(
                'Connect with skilled professionals\nwhenever you need them',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Test mode indicator
              if (AppConfig.useTestData)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.science, color: Colors.orange, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'TEST MODE - Using Mock Data',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              // Login button
              ElevatedButton(
                onPressed: () {
                  context.push('/login');
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),

              // Register button
              OutlinedButton(
                onPressed: () {
                  context.push('/register');
                },
                child: const Text('Create Account'),
              ),

              // Test Professional Registration button (only in test mode)
              if (AppConfig.useTestData) ...[
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // Use a test user ID for demonstration
                    context.push('/professional-registration/test-user-123');
                  },
                  icon: const Icon(Icons.science),
                  label: const Text('Test Professional Registration'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    side: const BorderSide(color: Colors.orange),
                  ),
                ),
              ],

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
