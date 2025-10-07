import 'package:flutter/material.dart';
import 'package:pep_demo/console_output.dart';
import 'package:pep_demo/secrets.dart';
import 'package:rook_feature/rook_feature.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConsoleOutput samsungOutput = ConsoleOutput();
  ConsoleOutput googleOutput = ConsoleOutput();

  @override
  Widget build(BuildContext context) {
    final systemPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
        padding: systemPadding + EdgeInsets.fromLTRB(16, 16, 16, 0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Samsung Health"),
              Text(samsungOutput.current),
              FilledButton(
                onPressed: initializeSamsungHealth,
                child: Text("initializeSamsungHealth"),
              ),
              FilledButton(
                onPressed: permissionsSamsungHealth,
                child: Text("permissionsSamsungHealth"),
              ),
              FilledButton(
                onPressed: syncSamsungHealth,
                child: Text("syncSamsungHealth"),
              ),
              FilledButton(
                onPressed: clearSamsungHealthOutput,
                child: Text("clearSamsungHealthOutput"),
              ),
              Divider(),
              Text("Health Connect"),
              Text(googleOutput.current),
              FilledButton(
                onPressed: initializeHealthConnect,
                child: Text("initializeHealthConnect"),
              ),
              FilledButton(
                onPressed: permissionsHealthConnect,
                child: Text("permissionsHealthConnect"),
              ),
              FilledButton(
                onPressed: syncHealthConnect,
                child: Text("syncHealthConnect"),
              ),
              FilledButton(
                onPressed: clearHealthConnectOutput,
                child: Text("clearHealthConnectOutput"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearSamsungHealthOutput() {
    setState(() {
      samsungOutput.clear();
    });
  }

  void initializeSamsungHealth() async {
    try {
      setState(() {
        samsungOutput.append("initializing...");
      });

      await RookFeature.initializeSamsung(clientUUID, secretKey, userID);

      setState(() {
        samsungOutput.append("initialized");
      });
    } catch (error) {
      setState(() {
        samsungOutput.append("Samsung Health error: $error");
      });
    }
  }

  void permissionsSamsungHealth() async {
    try {
      setState(() {
        samsungOutput.append("Requesting permissions...");
      });

      await RookFeature.requestPermissionsSamsung();

      setState(() {
        samsungOutput.append("Permissions requested");
      });
    } catch (error) {
      setState(() {
        samsungOutput.append("Samsung Health error: $error");
      });
    }
  }

  void syncSamsungHealth() async {
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(Duration(days: 1));

    try {
      setState(() {
        samsungOutput.append("Sync sleep summary");
      });

      await RookFeature.syncSleepSummarySamsung(today);

      setState(() {
        samsungOutput.append("Sleep Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync physical summary");
      });

      await RookFeature.syncPhysicalSummarySamsung(yesterday);

      setState(() {
        samsungOutput.append("Physical Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync body summary");
      });

      await RookFeature.syncBodySummarySamsung(yesterday);

      setState(() {
        samsungOutput.append("Body Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync Activity events");
      });

      await RookFeature.syncActivityEventsSamsung(today);

      setState(() {
        samsungOutput.append("Activity events synced");
      });
    } catch (error) {
      setState(() {
        samsungOutput.append("Samsung Health error: $error");
      });
    }
  }

  void clearHealthConnectOutput() {
    setState(() {
      googleOutput.clear();
    });
  }

  void initializeHealthConnect() async {
    try {
      setState(() {
        googleOutput.append("initializing...");
      });

      await RookFeature.initializeGoogle(clientUUID, secretKey, userID);

      setState(() {
        googleOutput.append("initialized");
      });
    } catch (error) {
      setState(() {
        googleOutput.append("Samsung Health error: $error");
      });
    }
  }

  void permissionsHealthConnect() async {
    try {
      setState(() {
        googleOutput.append("Requesting permissions...");
      });

      await RookFeature.requestPermissionsGoogle();

      setState(() {
        googleOutput.append("Permissions requested");
      });
    } catch (error) {
      setState(() {
        googleOutput.append("Samsung Health error: $error");
      });
    }
  }

  void syncHealthConnect() async {
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(Duration(days: 1));

    try {
      setState(() {
        googleOutput.append("Sync sleep summary");
      });

      await RookFeature.syncSleepSummaryGoogle(today);

      setState(() {
        googleOutput.append("Sleep Summary synced");
      });

      setState(() {
        googleOutput.append("Sync physical summary");
      });

      await RookFeature.syncPhysicalSummaryGoogle(yesterday);

      setState(() {
        googleOutput.append("Physical Summary synced");
      });

      setState(() {
        googleOutput.append("Sync body summary");
      });

      await RookFeature.syncBodySummaryGoogle(yesterday);

      setState(() {
        googleOutput.append("Body Summary synced");
      });

      setState(() {
        googleOutput.append("Sync Activity events");
      });

      await RookFeature.syncActivityEventsGoogle(today);

      setState(() {
        googleOutput.append("Activity events synced");
      });
    } catch (error) {
      setState(() {
        googleOutput.append("Samsung Health error: $error");
      });
    }
  }
}
