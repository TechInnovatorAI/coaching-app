import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class TaggingWalkthroughStep extends StatefulWidget {
  final PageController pageController;
  
  const TaggingWalkthroughStep({super.key, required this.pageController});

  @override
  State<TaggingWalkthroughStep> createState() => _TaggingWalkthroughStepState();
}

class _TaggingWalkthroughStepState extends State<TaggingWalkthroughStep> {
  List<String> selectedTags = [];

  final List<String> availableTags = [
    'Solo Death',
    'Late Rotation',
    'Nice Setup',
    'Teamfight',
    'Objective',
    'Laning Phase',
  ];

  void _toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Title
          Text(
            'Anong nangyari dito?',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 15),
          
          // Coach Kuya message
          const CoachKuyaCard(
            message: 'Piliin mo ang mga tags na applicable sa screenshot mo para mas accurate ang feedback ko! 🎯',
            showAvatar: true,
          ),
          
          const SizedBox(height: 20),
          
          // Tag selection
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Select applicable tags:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: availableTags.map((tag) {
                          final isSelected = selectedTags.contains(tag);
                          return SizedBox(
                            width: 110, // Slightly smaller width
                            child: GestureDetector(
                              onTap: () => _toggleTag(tag),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected 
                                    ? const Color(AppConstants.primaryColor)
                                    : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected 
                                      ? const Color(AppConstants.primaryColor)
                                      : Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  tag,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    if (selectedTags.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Selected: ${selectedTags.join(', ')}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(AppConstants.primaryColor),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 15),
          
          // Next button
          ElevatedButton(
            onPressed: selectedTags.isNotEmpty ? () {
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } : null,
            child: const Text('Next'),
          ),
          
          const SizedBox(height: 10),
          
          // Demo explanation - more compact
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.label,
                    size: 32,
                    color: Color(AppConstants.accentColor),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tagging helps Coach Kuya understand your gameplay better!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'The more accurate your tags, the better the coaching advice you\'ll receive!',
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