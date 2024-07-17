import 'package:flutter/material.dart';
import 'package:parallax_view/parallax_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Parallax'),
        ),
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 400,
                width: double.infinity,
              ),
              ParallaxView(
                controller: controller,
              ),
              Container(
                color: Colors.amber,
                height: 600,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
