import 'package:flutter/material.dart';
import 'package:messenger_ui/top_appbar.dart';
import 'package:messenger_ui/searchbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for Material 13',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: TopAppbar(),
        // 使用SafeArea在外层来适配不同屏幕, 主要用于适配异形屏或屏幕四周带圆角的屏幕，使其字体避开圆角区域
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      child: ListView(
        children: [TopAppbar(), SearchBarWidget()],
      ),
    )));
  }
}
