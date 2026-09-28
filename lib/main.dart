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

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),

      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Hello! You pressed the button.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 60,
            ),

            const SizedBox(height: 20),

            const Text(
              'Hello, Dark Theme!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Counter: $counter',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: increaseCounter,
              icon: const Icon(Icons.add),
              label: const Text('Increase'),
            ),

            const SizedBox(height: 10),

            // Reset button
            OutlinedButton.icon(
              onPressed: resetCounter,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Counter'),
            ),

            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: showMessage,
              child: const Text('Show Message'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: increaseCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
