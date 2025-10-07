import 'package:rook/rook.dart';

class RookFeature {
  static Future<void> initialize(
    String clientUUID,
    String secretKey,
    String userID,
  ) async {
    await Rook.initRook(clientUUID, secretKey);
    await Rook.updateUserID(userID);
  }

  static Future<bool> checkPermissions() {
    return Rook.checkSamsungHealthPermissions();
  }

  static Future<void> requestPermissions() {
    return Rook.requestSamsungHealthPermissions();
  }

  static Future<bool> syncSleepSummary(DateTime date) {
    return Rook.syncSleepSummary(date);
  }

  static Future<bool> syncPhysicalSummary(DateTime date) {
    return Rook.syncPhysicalSummary(date);
  }

  static Future<bool> syncBodySummary(DateTime date) {
    return Rook.syncBodySummary(date);
  }

  static Future<bool> syncActivityEvents(DateTime date) {
    return Rook.syncActivityEvents(date);
  }
}
