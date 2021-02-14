import 'package:rxdart/rxdart.dart';

class SubjectFactoryMixin {
  final _sinkList = <Sink>[];

  BehaviorSubject<T> seeded<T>(
    T value, {
    void Function()? onListen,
    void Function()? onCancel,
    bool sync = false,
  }) {
    final subject = BehaviorSubject.seeded(
      value,
      onListen: onListen,
      onCancel: onCancel,
      sync: sync,
    );

    _sinkList.add(subject);

    return subject;
  }

  BehaviorSubject<T> behavior<T>({
    void Function()? onListen,
    void Function()? onCancel,
    bool sync = false,
  }) {
    final subject = BehaviorSubject<T>(
      onListen: onListen,
      onCancel: onCancel,
      sync: sync,
    );

    _sinkList.add(subject);

    return subject;
  }

  void closeSinks() {
    for (final sink in _sinkList) {
      sink.close();
    }
  }
}
