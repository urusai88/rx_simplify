import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class StreamBuilderValueProxy<T> {
  final ValueStream<T> stream;

  StreamBuilderValueProxy(this.stream) : assert(stream.hasValue);

  StreamBuilder<T> withBuilder({
    Key? key,
    T? initialData,
    required Widget Function(BuildContext context, T value) builder,
  }) {
    return StreamBuilder(
      key: key,
      initialData: initialData,
      stream: stream,
      builder: (context, snapshot) => builder(context, snapshot.requireData),
    );
  }
}

class StreamBuilderProxy<T> {
  final Stream<T> stream;

  StreamBuilderProxy(this.stream);

  StreamBuilder<T> withBuilder(
      {Key? key, T? initialData, required AsyncWidgetBuilder<T> builder}) {
    return StreamBuilder(
      key: key,
      initialData: initialData,
      stream: stream,
      builder: builder,
    );
  }
}
