import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class _StreamBuilderValueProxyWidget<T> extends StatefulWidget {
  final ValueStream<T> stream;
  final Widget Function(BuildContext context, T value) builder;

  _StreamBuilderValueProxyWidget({required this.stream, required this.builder});

  @override
  State createState() => _StreamBuilderValueProxyWidgetState<T>();
}

class _StreamBuilderValueProxyWidgetState<T>
    extends State<_StreamBuilderValueProxyWidget<T>> {
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = widget.stream.skip(1).listen(_streamListener);
  }

  @override
  void dispose() {
    super.dispose();

    _subscription.cancel();
  }

  void _streamListener(T v) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.stream.requireValue);
  }
}

class StreamBuilderValueProxy<T> {
  final ValueStream<T> stream;

  StreamBuilderValueProxy(this.stream) : assert(stream.hasValue);

  Widget withBuilder({
    Key? key,
    required Widget Function(BuildContext context, T value) builder,
  }) {
    return _StreamBuilderValueProxyWidget(stream: stream, builder: builder);
  }
}

class StreamBuilderProxy<T> {
  final Stream<T> stream;

  StreamBuilderProxy(this.stream);

  StreamBuilder<T> withBuilder({
    Key? key,
    T? initialData,
    required AsyncWidgetBuilder<T> builder,
  }) {
    return StreamBuilder(
      key: key,
      initialData: initialData,
      stream: stream,
      builder: builder,
    );
  }
}
