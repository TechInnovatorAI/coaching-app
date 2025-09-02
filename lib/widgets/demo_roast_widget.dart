import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class DemoRoastStep extends StatefulWidget {
  final PageController pageController;
  
  const DemoRoastStep({super.key, required this.pageController});

  @override
  State<DemoRoastStep> createState() => _DemoRoastStepState();
}

class _DemoRoastStepState extends State<DemoRoastStep> {
  String currentRoast = '';
  bool isRoasting = false;

  final List<String> demoRoasts = [
    'Hoy! Bakit ka nag-solo dive sa 5 enemies? Hindi ka si Superman! 😤',
    'Wag ka na mag-rage quit! Hindi ka mag-i-improve kung lagi kang sumusuko! 💪',
    'Tama na ang pagiging feeder! Mag-focus ka sa positioning mo! 🎯',
    'Hindi ka mag-rank up kung puro ka lang farm! Help your team! 🤝',
    'Wag ka na mag-blame sa teammates! Focus on your own gameplay! 🎮',
  ];

  void _uploadScreenshot() {
    setState(() {
      isRoasting = true;
    });

    // Simulate AI processing
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        currentRoast = demoRoasts[DateTime.now().millisecond % demoRoasts.length];
        isRoasting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            'Try uploading a screenshot and see how Coach Kuya roasts you 😈',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 30),
          
          // Upload button
          ElevatedButton.icon(
            onPressed: isRoasting ? null : _uploadScreenshot,
            icon: isRoasting 
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Icon(Icons.upload),
            label: Text(isRoasting ? 'Analyzing...' : 'Upload Screenshot'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppConstants.secondaryColor),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Roast result
          if (currentRoast.isNotEmpty)
            CoachKuyaCard(
              message: currentRoast,
              showAvatar: true,
              tone: 'roast',
            ),
          
          const SizedBox(height: 30),
          
          // Demo explanation
          if (currentRoast.isNotEmpty)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lightbulb,
                      size: 40,
                      color: Color(AppConstants.secondaryColor),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'This is just a demo!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'In the real app, Coach Kuya will analyze your actual gameplay screenshots and give you personalized feedback to help you rank up!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          
          const SizedBox(height: 30),
          
          // Next button
          if (currentRoast.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Next'),
            ),
        ],
      ),
    );
  }
} 