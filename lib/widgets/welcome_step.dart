import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class WelcomeStep extends StatelessWidget {
  final PageController pageController;
  
  const WelcomeStep({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Coach Kuya Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(AppConstants.primaryColor),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.sports_esports,
              size: 60,
              color: Colors.white,
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Welcome message
          Text(
            'G na para sa Rank!',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Coach Kuya intro card
          const CoachKuyaCard(
            message: 'Ako si Coach Kuya, at tutulungan kitang mag-rank up sa kahit anong rank mo!',
            showAvatar: true,
          ),
          
          const SizedBox(height: 30),
          
          // Let's Go button
          ElevatedButton(
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Text('Let\'s Go!'),
          ),
        ],
      ),
    );
  }
} 