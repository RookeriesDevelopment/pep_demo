import 'package:rook/rook.dart';

class RookFeature {
  static Future<void> initializeSamsung(
    String clientUUID,
    String secretKey,
    String userID,
  ) async {
    await Rook.initRookSamsung(clientUUID, secretKey);
    await Rook.updateUserIDSamsung(userID);
  }

  static Future<bool> checkPermissionsSamsung() {
    return Rook.checkPermissionsSamsung();
  }

  static Future<void> requestPermissionsSamsung() {
    return Rook.requestPermissionsSamsung();
  }

  static Future<bool> syncSleepSummarySamsung(DateTime date) {
    return Rook.syncSleepSummarySamsung(date);
  }

  static Future<bool> syncPhysicalSummarySamsung(DateTime date) {
    return Rook.syncPhysicalSummarySamsung(date);
  }

  static Future<bool> syncBodySummarySamsung(DateTime date) {
    return Rook.syncBodySummarySamsung(date);
  }

  static Future<bool> syncActivityEventsSamsung(DateTime date) {
    return Rook.syncActivityEventsSamsung(date);
  }

  static Future<void> initializeGoogle(
      String clientUUID,
      String secretKey,
      String userID,
      ) async {
    await Rook.initRookGoogle(clientUUID, secretKey);
    await Rook.updateUserIDGoogle(userID);
  }

  static Future<bool> checkPermissionsGoogle() {
    return Rook.checkPermissionsGoogle();
  }

  static Future<void> requestPermissionsGoogle() {
    return Rook.requestPermissionsGoogle();
  }

  static Future<bool> syncSleepSummaryGoogle(DateTime date) {
    return Rook.syncSleepSummaryGoogle(date);
  }

  static Future<bool> syncPhysicalSummaryGoogle(DateTime date) {
    return Rook.syncPhysicalSummaryGoogle(date);
  }

  static Future<bool> syncBodySummaryGoogle(DateTime date) {
    return Rook.syncBodySummaryGoogle(date);
  }

  static Future<bool> syncActivityEventsGoogle(DateTime date) {
    return Rook.syncActivityEventsGoogle(date);
  }
}
