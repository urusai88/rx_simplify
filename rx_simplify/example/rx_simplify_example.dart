import 'package:rxdart/rxdart.dart';

// ignore: avoid_relative_lib_imports
import './../lib/rx_simplify.dart';

void main() {
  final s1 = BehaviorSubject<int>.seeded(1);
  final s2 = BehaviorSubject<String>.seeded('string');

  final combined = Rxs.combine2(s1, s2).withTuple();

  combined.listen((event) {
    print('${event.first} ${event.second}');
  });
}
