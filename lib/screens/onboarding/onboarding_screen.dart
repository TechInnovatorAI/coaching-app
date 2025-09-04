import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/welcome_step.dart';
import '../../widgets/demo_roast_widget.dart';
import '../../widgets/tagging_walkthrough_widget.dart';
import '../../widgets/badge_unlock_widget.dart';
import '../../widgets/coaching_goal_widget.dart';
import '../../widgets/motivational_outro_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _skipButtonController;
  late Animation<double> _skipButtonAnimation;

  @override
  void initState() {
    super.initState();
    _skipButtonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _skipButtonAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _skipButtonController,
      curve: Curves.elasticOut,
    ));
    
    // Start the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _skipButtonController.forward();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _skipButtonController.dispose();
    super.dispose();
  }

  void _goToFinalStep() {
    _pageController.animateToPage(
      5, // Final step (Motivational Outro)
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Original Progress indicator
            LinearProgressIndicator(
              value: (_currentPage + 1) / 6, // 6 total steps
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(AppConstants.primaryColor),
              ),
            ),
            
            // Main content
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      WelcomeStep(pageController: _pageController),
                      DemoRoastStep(pageController: _pageController),
                      TaggingWalkthroughStep(pageController: _pageController),
                      BadgeUnlockStep(pageController: _pageController),
                      CoachingGoalStep(pageController: _pageController),
                      MotivationalOutroStep(pageController: _pageController),
                    ],
                  ),
                  
                  // Skip to App CTA Button
                  Positioned(
                    top: 10,
                    right: 20,
                    child: AnimatedBuilder(
                      animation: _skipButtonAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _skipButtonAnimation.value,
                          child: Opacity(
                            opacity: _skipButtonAnimation.value.clamp(0.0, 1.0),

                            // opacity: _skipButtonAnimation.value,
                                                          child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(AppConstants.primaryColor).withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: _goToFinalStep,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.rocket_launch,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Skip to App',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
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