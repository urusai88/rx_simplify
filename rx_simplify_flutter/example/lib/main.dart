import 'package:flutter/material.dart';
import 'package:rx_simplify_flutter/rx_simplify_flutter.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: close_sinks
  final BehaviorSubject stream = BehaviorSubject.seeded(1);

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {
      stream.add(2);
    });

    Future.delayed(Duration(seconds: 3), () async {
      stream.add(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilderValueProxy(stream).withBuilder(
      builder: (context, value) {
        print(value);

        return Container();
      },
    );
  }
}
