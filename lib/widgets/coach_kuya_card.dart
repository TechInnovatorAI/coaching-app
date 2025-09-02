import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CoachKuyaCard extends StatelessWidget {
  final String message;
  final bool showAvatar;
  final String? tone; // 'motivational', 'roast', 'serious'

  const CoachKuyaCard({
    super.key,
    required this.message,
    this.showAvatar = false,
    this.tone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showAvatar) ...[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(AppConstants.primaryColor),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.sports_esports,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showAvatar)
                    const Text(
                      AppConstants.coachName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(AppConstants.primaryColor),
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                    ),
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