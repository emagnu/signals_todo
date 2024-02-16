//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import 'screens/todo_screen.dart';
//  SIGNALS
//  //  //   ///

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singnals Todo App - Learning example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.system,
      home: const TodoScreen(),
    );
  }
}
