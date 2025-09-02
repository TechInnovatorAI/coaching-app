class AppConstants {
  static const String appName = 'Rank Up Na!';
  static const String coachName = 'Coach Kuya';
  
  // API Configuration
  static const String apiBaseUrl = 'http://10.0.2.2:8000'; // Android emulator special IP for localhost
  static const String apiVersion = 'v1';
  
  // API Endpoints
  static const String signupEndpoint = '/api/v1/auth/signup';
  static const String loginEndpoint = '/api/v1/auth/login';
  static const String userProfileEndpoint = '/api/v1/auth/me';
  
  // Authentication
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  
  // Onboarding messages
  static const String welcomeMessage = 'Kumusta, future legend! 👋';
  static const String introMessage = 'Ako si Coach Kuya, at tutulungan kitang mag-rank up!';
  static const String demoRoastTitle = 'Demo Roast Mode';
  static const String demoRoastMessage = 'Tingnan natin kung kaya mo ang mga roast ko! 😏';
  
  // Coach Kuya phrases - more inclusive for all ranks
  static const List<String> coachPhrases = [
    'G na para sa Rank!',
    'Masakit, pero totoo – wag ka na mag solo dive!',
    'Hanggang kailan ka stuck diyan?',
    'Kung ganyan pa rin rotation mo… hanggang Legend ka na lang forever!',
    'Uy parang pang Mythic to ah — pwede!',
    'Wag ka na mag-rage quit, mag-focus ka sa game!',
  ];
  
  // User Tiers
  static const String freeTier = 'free';
  static const String proTier = 'pro';
  static const String eliteTier = 'elite';
  
  // Upload Limits
  static const Map<String, int> uploadLimits = {
    freeTier: 2, // 2 screenshots per week
    proTier: 10, // 10 screenshots + 3 videos per week
    eliteTier: -1, // Unlimited
  };
  
  // Colors
  static const int primaryColor = 0xFF1E3A8A; // Blue
  static const int secondaryColor = 0xFFF59E0B; // Orange
  static const int accentColor = 0xFF10B981; // Green
  static const int backgroundColor = 0xFFF8FAFC;
  static const int surfaceColor = 0xFFFFFFFF;
}