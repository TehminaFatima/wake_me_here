class AppConstants {
  /// Distance (in meters) to trigger notification
  static const double proximityThreshold = 300;

  /// Notification Channel ID (Android)
  static const String notificationChannelId = 'proximity_alert_channel';

  /// Channel name shown in Android settings
  static const String notificationChannelName = 'Proximity Alerts';

  /// Channel description
  static const String notificationChannelDescription =
      'Notifies user when they are near their selected destination.';
}
