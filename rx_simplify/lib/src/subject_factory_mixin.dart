import 'package:rxdart/rxdart.dart';

class SubjectFactoryMixin {
  final _sinkList = <Sink>[];

  BehaviorSubject<T> _create<T>(BehaviorSubject<T> subject) {
    _sinkList.add(subject);

    return subject;
  }

  BehaviorSubject<T> seeded<T>(
    T value, {
    void Function()? onListen,
    void Function()? onCancel,
    bool sync = false,
  }) {
    return _create(BehaviorSubject.seeded(
      value,
      onListen: onListen,
      onCancel: onCancel,
      sync: sync,
    ));
  }

  BehaviorSubject<T> behavior<T>({
    void Function()? onListen,
    void Function()? onCancel,
    bool sync = false,
  }) {
    return _create(BehaviorSubject<T>(
      onListen: onListen,
      onCancel: onCancel,
      sync: sync,
    ));
  }

  void closeSinks() {
    for (final sink in _sinkList) {
      sink.close();
    }
  }
}
