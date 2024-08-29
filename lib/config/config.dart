
class Config {
  /// *** Main settings *** ///
  static String apiUrl = "";
  static String appUid = "";
  static String oneSignalPushId = "";

  /// *** Splashscreen settings *** ///
  // Background color (any HEX color)
  static String splashBackgroundColor = "#0e74e9";
  // Text color (any HEX color)
  static String splashTextColor = "#ffffff";
  // Is image background
  static bool splashIsBackgroundImage = true;
  // Background image name
  static String splashBackgroundImage = "splash_screen.png";
  // Tagline
  static String splashTagline = "Top digital assets and services";
  // Delay display (seconds)
  static int splashDelay = 1;
  // Logo image name
  static String splashLogoImage = "splash_logo.png";
  // Display logo
  static bool splashIsDisplayLogo = true;

  /// *** Offline localization settings *** ///
  static String offlineErrorMessage = "No internet connection";
  static String offlineImage = "dino.png";

  /// *** Subscribe need settings *** ///
  static String subscribeErrorTitle = "App not available";
  static String subscribeErrorMessage = "You need to renew your subscription plan in the app settings";
}