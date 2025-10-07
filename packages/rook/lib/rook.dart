import 'package:rook_sdk_core/rook_sdk_core.dart';
import 'package:rook_sdk_health_connect/rook_sdk_health_connect.dart';
import 'package:rook_sdk_samsung_health/rook_sdk_samsung_health.dart';

import 'rook_platform_interface.dart';

class Rook {
  Future<String?> getPlatformVersion() {
    return RookPlatform.instance.getPlatformVersion();
  }

  static Future<String?> getUserIDSamsung() {
    return RookSamsung.getUserID();
  }

  static Future<void> initRookSamsung(
    String clientUUID,
    String secretKey,
  ) async {
    final configuration = RookConfiguration(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: RookEnvironment.sandbox,
      enableBackgroundSync: false,
    );

    await RookSamsung.enableNativeLogs();
    await RookSamsung.initRook(configuration);
  }

  static Future<void> updateUserIDSamsung(String userID) {
    return RookSamsung.updateUserID(userID);
  }

  static Future<bool> checkPermissionsSamsung() {
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

  static Future<RequestPermissionsStatus> requestPermissionsSamsung() {
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

  static Future<bool> syncHistoricSummariesSamsung(bool enableLogs) {
    return RookSamsung.sync(enableLogs: enableLogs);
  }

  static Future<bool> syncSummariesByDateSamsung(DateTime date) {
    return RookSamsung.sync(date: date);
  }

  static Future<bool> syncSleepSummarySamsung(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.sleep);
  }

  static Future<bool> syncPhysicalSummarySamsung(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.physical);
  }

  static Future<bool> syncBodySummarySamsung(DateTime date) {
    return RookSamsung.sync(date: date, summary: SHSummarySyncType.body);
  }

  static Future<bool> syncActivityEventsSamsung(DateTime date) {
    return RookSamsung.syncEvents(date, SHEventSyncType.activity);
  }

  static Future<String?> getUserIDGoogle() {
    return HCRookConfigurationManager.getUserID();
  }

  static Future<void> initRookGoogle(
      String clientUUID,
      String secretKey,
      ) async {
    final configuration = RookConfiguration(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: RookEnvironment.sandbox,
      enableBackgroundSync: false,
    );

    await HCRookConfigurationManager.enableNativeLogs();
    await HCRookConfigurationManager.setConfiguration(configuration);
    await HCRookConfigurationManager.initRook();
  }

  static Future<void> updateUserIDGoogle(String userID) {
    return HCRookConfigurationManager.updateUserID(userID);
  }

  static Future<bool> checkPermissionsGoogle() {
    return HCRookHealthPermissionsManager.checkHealthConnectPermissions();
  }

  static Future<RequestPermissionsStatus> requestPermissionsGoogle() {
    return HCRookHealthPermissionsManager.requestHealthConnectPermissions();
  }

  static Future<bool> syncHistoricSummariesGoogle(bool enableLogs) {
    return HCRookSyncManager.sync(enableLogs: enableLogs);
  }

  static Future<bool> syncSummariesByDateGoogle(DateTime date) {
    return HCRookSyncManager.sync(date: date);
  }

  static Future<bool> syncSleepSummaryGoogle(DateTime date) {
    return HCRookSyncManager.sync(date: date, summary: HCSummarySyncType.sleep);
  }

  static Future<bool> syncPhysicalSummaryGoogle(DateTime date) {
    return HCRookSyncManager.sync(date: date, summary: HCSummarySyncType.physical);
  }

  static Future<bool> syncBodySummaryGoogle(DateTime date) {
    return HCRookSyncManager.sync(date: date, summary: HCSummarySyncType.body);
  }

  static Future<bool> syncActivityEventsGoogle(DateTime date) {
    return HCRookSyncManager.syncEvents(date, HCEventSyncType.activity);
  }
}
