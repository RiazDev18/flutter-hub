import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task.dart';
import '../screens/homepage.dart';
import '../screens/task_details.dart';
import '../screens/completed_tasks.dart';
import '../screens/settings.dart';
import '../screens/statistics.dart';
import '../screens/categories.dart';
import '../screens/getStarted.dart';  // Import the new screen

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.yellow[700]),
          fontFamily: 'Lato',
        ),
        title: 'To Do List',
        initialRoute: '/get-started',
        routes: {
          '/get-started': (context) => GetStartedScreen(),  // Set initial route
          '/homepage': (context) => Homepage(),
          '/task-details': (context) => TaskDetailsScreen(taskId: ModalRoute.of(context)!.settings.arguments as String),
          '/completed-tasks': (context) => CompletedTasksScreen(),
          '/settings': (context) => SettingsScreen(),
          '/statistics': (context) => StatisticsScreen(),
          '/categories': (context) => CategoriesScreen(),
        },
      ),
    );
  }
}
