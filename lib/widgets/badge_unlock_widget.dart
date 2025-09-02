import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'coach_kuya_card.dart';

class BadgeUnlockStep extends StatefulWidget {
  final PageController pageController;
  
  const BadgeUnlockStep({super.key, required this.pageController});

  @override
  State<BadgeUnlockStep> createState() => _BadgeUnlockStepState();
}

class _BadgeUnlockStepState extends State<BadgeUnlockStep>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  bool badgeUnlocked = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 360.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _unlockBadge() {
    setState(() {
      badgeUnlocked = true;
    });
    _animationController.forward();
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
            'Nakuha mo ang unang badge mo! 🔥',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 30),
          
          // Badge unlock area
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!badgeUnlocked)
                  ElevatedButton.icon(
                    onPressed: _unlockBadge,
                    icon: const Icon(Icons.emoji_events),
                    label: const Text('Unlock Badge'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(AppConstants.accentColor),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                
                const SizedBox(height: 30),
                
                // Badge display
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Transform.rotate(
                        angle: _rotationAnimation.value * 3.14159 / 180,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(AppConstants.primaryColor),
                                Color(AppConstants.secondaryColor),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.emoji_events,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                
                if (badgeUnlocked) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'First Steps Badge',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(AppConstants.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'You\'ve completed the onboarding!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
          
          // Continue button
          if (badgeUnlocked)
            ElevatedButton(
              onPressed: () {
                widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Continue'),
            ),
        ],
      ),
    );
  }
} 