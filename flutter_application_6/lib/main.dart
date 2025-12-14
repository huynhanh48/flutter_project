import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  const CountdownPage({super.key});

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final TextEditingController secondCtrl = TextEditingController(text: "100");

  Timer? timer;
  int totalSeconds = 100;
  bool isRunning = false;

  // start countdown
  void startTimer() {
    if (isRunning) return;

    setState(() {
      totalSeconds = int.tryParse(secondCtrl.text) ?? 0;
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (totalSeconds > 0) {
        setState(() => totalSeconds--);
      } else {
        t.cancel();
        setState(() => isRunning = false);
      }
    });
  }

  // reset countdown
  void resetTimer() {
    timer?.cancel();
    setState(() {
      totalSeconds = int.tryParse(secondCtrl.text) ?? 0;
      isRunning = false;
    });
  }

  // format mm:ss
  String formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    secondCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bộ đếm thời gian"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Nhập số giây cần đếm:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            // input seconds
            SizedBox(
              width: 120,
              child: TextField(
                controller: secondCtrl,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),

            const SizedBox(height: 30),

            // timer text
            Text(
              formatTime(totalSeconds),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 30),

            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Bắt đầu"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
