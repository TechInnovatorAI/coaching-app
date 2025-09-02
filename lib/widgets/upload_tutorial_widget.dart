import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class UploadTutorialStep extends StatefulWidget {
  const UploadTutorialStep({super.key});

  @override
  State<UploadTutorialStep> createState() => _UploadTutorialStepState();
}

class _UploadTutorialStepState extends State<UploadTutorialStep> {
  int currentTutorialStep = 0;
  String selectedTag = '';

  final List<Map<String, dynamic>> tutorialSteps = [
    {
      'title': 'Step 1: Take Screenshots',
      'description': 'Screenshot your gameplay moments - good or bad!',
      'icon': Icons.camera_alt,
      'color': Colors.blue,
    },
    {
      'title': 'Step 2: Add Tags',
      'description': 'Tag your uploads (solo death, teamfight, etc.)',
      'icon': Icons.label,
      'color': Colors.green,
    },
    {
      'title': 'Step 3: Get Feedback',
      'description': 'Coach Kuya will analyze and give you personalized advice!',
      'icon': Icons.psychology,
      'color': Colors.orange,
    },
  ];

  final List<String> availableTags = [
    'Solo Death',
    'Teamfight',
    'Objective',
    'Laning Phase',
    'Late Game',
    'Build Question',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            'How to Upload & Get Coaching',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Coach Kuya message
          const CoachKuyaCard(
            message: 'Tutulungan kitang mag-upload ng screenshots at clips para makakuha ka ng personalized coaching! 📸',
            showAvatar: true,
          ),
          
          const SizedBox(height: 30),
          
          // Tutorial steps
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentTutorialStep = index;
                });
              },
              itemCount: tutorialSteps.length,
              itemBuilder: (context, index) {
                final step = tutorialSteps[index];
                return _buildTutorialStep(step);
              },
            ),
          ),
          
          // Step indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tutorialSteps.length,
              (index) => Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentTutorialStep == index
                      ? const Color(AppConstants.primaryColor)
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Tag selection demo
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Try Tagging (Demo)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: availableTags.map((tag) {
                      final isSelected = selectedTag == tag;
                      return ChoiceChip(
                        label: Text(tag),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            selectedTag = selected ? tag : '';
                          });
                        },
                        selectedColor: const Color(AppConstants.primaryColor),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      );
                    }).toList(),
                  ),
                  if (selectedTag.isNotEmpty) ...[
                    const SizedBox(height: 15),
                    Text(
                      'Selected: $selectedTag',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(AppConstants.primaryColor),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Android recording guide
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.videocam,
                    size: 40,
                    color: Color(AppConstants.accentColor),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Recording Clips',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Use Android\'s built-in screen recorder to capture 30-60 second gameplay highlights!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialStep(Map<String, dynamic> step) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: step['color'],
              shape: BoxShape.circle,
            ),
            child: Icon(
              step['icon'],
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            step['title'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            step['description'],
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 