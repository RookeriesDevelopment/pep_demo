import 'package:rook_sdk_core/rook_sdk_core.dart';
import 'package:rook_sdk_samsung_health/rook_sdk_samsung_health.dart';

import 'rook_platform_interface.dart';

class Rook {
  Future<String?> getPlatformVersion() {
    return RookPlatform.instance.getPlatformVersion();
  }

  static Future<String?> getUserID() {
    return RookSamsung.getUserID();
  }

  static Future<void> initRook(String clientUUID, String secretKey) async {
    final configuration = RookConfiguration(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: RookEnvironment.sandbox,
      enableBackgroundSync: false,
    );

    await RookSamsung.enableNativeLogs();
    await RookSamsung.initRook(configuration);
  }

  static Future<void> updateUserID(String userID) {
    return RookSamsung.updateUserID(userID);
  }

  static Future<bool> checkSamsungHealthPermissions() {
    final permissions = [
      SamsungHealthPermission.activitySummary,
      SamsungHealthPermission.bloodGlucose,
      SamsungHealthPermission.bloodOxygen,
      SamsungHealthPermission.bloodPressure,
      SamsungHealthPermission.bodyComposition,
      SamsungHealthPermission.exercise,
      SamsungHealthPermission.exerciseLocation,
      SamsungHealthPermission.floorsClimbed,
      SamsungHealthPermission.heartRate,
      SamsungHealthPermission.nutrition,
      SamsungHealthPermission.sleep,
      SamsungHealthPermission.steps,
      SamsungHealthPermission.waterIntake,
    ];

    return RookSamsung.checkSamsungHealthPermissions(permissions);
  }

  static Future<RequestPermissionsStatus> requestSamsungHealthPermissions() {
    final permissions = [
      SamsungHealthPermission.activitySummary,
      SamsungHealthPermission.bloodGlucose,
      SamsungHealthPermission.bloodOxygen,
      SamsungHealthPermission.bloodPressure,
      SamsungHealthPermission.bodyComposition,
      SamsungHealthPermission.exercise,
      SamsungHealthPermission.exerciseLocation,
      SamsungHealthPermission.floorsClimbed,
      SamsungHealthPermission.heartRate,
      SamsungHealthPermission.nutrition,
      SamsungHealthPermission.sleep,
      SamsungHealthPermission.steps,
      SamsungHealthPermission.waterIntake,
    ];

    return RookSamsung.requestSamsungHealthPermissions(permissions);
  }

  static Future<bool> syncHistoricSummaries(bool enableLogs) {
    return RookSamsung.sync(enableLogs: enableLogs);
  }

  static Future<bool> syncSummariesByDate(DateTime date) {
    return RookSamsung.sync(date: date);
  }

  static Future<bool> syncSleepSummary(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.sleep);
  }

  static Future<bool> syncPhysicalSummary(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.physical);
  }

  static Future<bool> syncBodySummary(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.body);
  }

  static Future<bool> syncActivityEvents(DateTime date) {
    return RookSamsung.syncEvents(date, SHEventSyncType.activity);
  }
}
