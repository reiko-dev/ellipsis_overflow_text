import 'package:ellipsis_overflow_text/ellipsis_overflow_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: size.width * .3,
          height: size.height * .25,
          color: Colors.white,
          child: const EllipsisOverflowText(
            'This string will automatically fit within the bounds of the container.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
