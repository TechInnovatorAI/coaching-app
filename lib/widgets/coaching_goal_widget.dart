import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class CoachingGoalStep extends StatelessWidget {
  final PageController pageController;
  
  const CoachingGoalStep({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Title
          Text(
            'Free Coaching Goal Assigned',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 15),
          
          // Coach Kuya message
          const CoachKuyaCard(
            message: 'Binigyan kita ng first coaching goal para mag-improve ka! Focus on this one goal this week! 🎯',
            showAvatar: true,
          ),
          
          const SizedBox(height: 20),
          
          // Goal card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(AppConstants.accentColor),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.flag,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'This week\'s goal:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Survive longer in teamfights',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(AppConstants.primaryColor),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Focus on positioning and timing. Don\'t engage too early or too late!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Track Goal button
          ElevatedButton.icon(
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.track_changes),
            label: const Text('Track Goal'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppConstants.accentColor),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Goal explanation - more compact
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.assignment,
                    size: 28,
                    color: Color(AppConstants.primaryColor),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Weekly Goals',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Coach Kuya will give you personalized goals based on your gameplay. Complete them to earn XP and badges!',
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