import 'package:flutter/material.dart';
import 'package:pep_demo/console_output.dart';

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
                onPressed: samsungHealthDemo,
                child: Text("Samsung Health demo"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void samsungHealthDemo() async {
    try {} catch (error) {
      setState(() {
        samsungOutput.append("Samsung Health error: $error");
      });
    }
  }
}
