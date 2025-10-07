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
                onPressed: clearSamsungOutput,
                child: Text("Clear"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearSamsungOutput() {
    setState(() {
      samsungOutput.clear();
    });
  }

  void initializeSamsungHealth() async {
    try {
      setState(() {
        samsungOutput.append("initializing...");
      });

      await RookFeature.initialize(clientUUID, secretKey, userID);

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

      await RookFeature.requestPermissions();

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

      await RookFeature.syncSleepSummary(today);

      setState(() {
        samsungOutput.append("Sleep Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync physical summary");
      });

      await RookFeature.syncPhysicalSummary(yesterday);

      setState(() {
        samsungOutput.append("Physical Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync body summary");
      });

      await RookFeature.syncBodySummary(yesterday);

      setState(() {
        samsungOutput.append("Body Summary synced");
      });

      setState(() {
        samsungOutput.append("Sync Activity events");
      });

      await RookFeature.syncActivityEvents(today);

      setState(() {
        samsungOutput.append("Activity events synced");
      });
    } catch (error) {
      setState(() {
        samsungOutput.append("Samsung Health error: $error");
      });
    }
  }
}
