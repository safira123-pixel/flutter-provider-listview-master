import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/service/tasklist.dart';

import 'page/addtask.dart';
import 'page/listpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // this initiates the provider
        ChangeNotifierProvider<Tasklist>(
          create: (context) => Tasklist(),
          //initiating it here make this provider data available everywhere in the application 
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const MyListPage(),
        "/addTask": (context) => AddTaskPage(),
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
