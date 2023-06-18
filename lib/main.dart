import 'package:flutter/material.dart';
import 'package:hack/home_3d.dart';
import 'package:hack/home_comfort.dart';
import 'package:hack/login.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City BI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'City BI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: const Color(0xffB0BFFF),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const Login();
                    });
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [Home(), Home3D(), HomeComfort()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff8098FE),
          currentIndex: _currentIndex,
          onTap: (index) async {
            await _pageController?.animateToPage(index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn);
            setState(() => _currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Прогноз', icon: Icon(Icons.access_time)),
            BottomNavigationBarItem(
                label: '3D Прогноз', icon: Icon(Icons.home_work_outlined)),
            BottomNavigationBarItem(
                label: 'Индекс комфорта', icon: Icon(Icons.chair_outlined)),
          ]),
    );
  }
}
