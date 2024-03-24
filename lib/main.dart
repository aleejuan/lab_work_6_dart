import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    MyHomePage(title: 'Flutter Demo Home Page'),
    Calculator(),
    Syllabus(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: Scaffold(
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Syllabus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(data: 'Data from Home')));
            print(result);
          },
          child: const Text('Go to Detail Screen'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String data;

  const DetailScreen({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Data: $data'),
            Text(
              'Created by Alikhan Amirov / Laboratory Work 5 & 6',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Data from DetailScreen');
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syllabus'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
