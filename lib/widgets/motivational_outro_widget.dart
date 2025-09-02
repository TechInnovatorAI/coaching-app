import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class MotivationalOutroStep extends StatelessWidget {
  final PageController pageController;
  
  const MotivationalOutroStep({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Motivational message
          Text(
            'Laban lang. Hindi ka stuck forever 💪',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Coach Kuya message
          const CoachKuyaCard(
            message: 'Nakita ko na ang potential mo! Kaya mo yan, future legend! 🏆',
            showAvatar: true,
          ),
          
          const SizedBox(height: 20),
          
          // Pro upgrade section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color(AppConstants.primaryColor),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.star,
                  size: 32,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Upgrade to Pro',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Get full AI feedback and video coaching',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pro features coming soon!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(AppConstants.secondaryColor),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Try Pro for Free',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Auth buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.go('/auth/register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(AppConstants.accentColor),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.go('/auth/login'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(
                      color: Color(AppConstants.primaryColor),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(AppConstants.primaryColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          TextButton(
            onPressed: () => context.go('/home'),
            child: const Text(
              'Continue with Free',
              style: TextStyle(
                color: Color(AppConstants.primaryColor),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Pro features preview - more compact
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.video_library,
                    size: 28,
                    color: Color(AppConstants.secondaryColor),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pro Features',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Video analysis, detailed reports, and personalized coaching plans!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 