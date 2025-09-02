import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class ProOfferStep extends StatelessWidget {
  const ProOfferStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            'Ready to Level Up? 🚀',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Coach Kuya motivational message
          const CoachKuyaCard(
            message: 'Kung gusto mong mag-rank up talaga, kailangan mo ng Pro features! Hindi ka mag-i-improve sa free version lang! 💪',
            showAvatar: true,
          ),
          
          const SizedBox(height: 30),
          
          // Pro features card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(AppConstants.primaryColor),
                          Color(AppConstants.secondaryColor),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pro Features',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFeatureItem('📸 Unlimited screenshots'),
                  _buildFeatureItem('🎬 3 clip uploads/week'),
                  _buildFeatureItem('🤖 Full AI feedback'),
                  _buildFeatureItem('📊 Personalized coaching plan'),
                  _buildFeatureItem('🏆 30-day hero tracker'),
                  _buildFeatureItem('🎯 Adaptive build suggestions'),
                  _buildFeatureItem('📝 Micro quizzes'),
                  _buildFeatureItem('💬 Coach chat Q&A'),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Pricing card
          Card(
            color: const Color(AppConstants.accentColor),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    '₱199/month',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Less than ₱7 per day!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Implement Pro subscription
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pro subscription coming soon!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(AppConstants.accentColor),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    ),
                    child: const Text(
                      'Get Pro Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Free tier reminder
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.info,
                    size: 40,
                    color: Color(AppConstants.primaryColor),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Free Version Available',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You can still use the app for free with 2 screenshots/week and basic features!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      // Navigate to main app
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: const Text(
                      'Continue with Free',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Final Coach Kuya message
          const CoachKuyaCard(
            message: 'Kahit free version, tutulungan pa rin kita! Pero kung seryoso ka sa pag-rank up, Pro talaga ang kailangan mo! 😉',
            showAvatar: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
} 