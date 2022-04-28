import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tic tac toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _board = List.filled(9, '');
  String _turn = 'x';

  _nextTurn() {
    if (_turn == 'x') {
      _turn = 'o';
    } else {
      _turn = 'x';
    }
  }

  _tapped(int index) {
    setState(() {
      _board[index] = _turn;
      _nextTurn();
    });
  }

  Widget _buildBoard() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: index > 2
                        ? const BorderSide(color: Colors.black)
                        : BorderSide.none,
                    bottom: index < 6
                        ? const BorderSide(color: Colors.black)
                        : BorderSide.none,
                    right: (index + 1) % 3 != 0
                        ? const BorderSide(color: Colors.black)
                        : BorderSide.none,
                    left: index % 3 != 0
                        ? const BorderSide(color: Colors.black)
                        : BorderSide.none,
                  ),
                ),
                child: Center(
                  child: Text(_board[index]),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildBoard(),
          ],
        ),
      ),
    );
  }
}
