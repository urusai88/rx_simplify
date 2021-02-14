import 'dart:async';

import 'package:more/more.dart';
import 'package:rxdart/rxdart.dart';

class StreamCombinerProxy2<T1, T2> {
  final Stream<T1> s1;
  final Stream<T2> s2;

  StreamCombinerProxy2(this.s1, this.s2);

  Stream<T> withFunction<T>(T Function(T1 s1, T2 s2) fn) =>
      Rx.defer(() => Rx.combineLatest2(s1, s2, fn), reusable: true);

  Stream<Tuple2<T1, T2>> withTuple() =>
      withFunction((s1, s2) => Tuple2(s1, s2));
}

class StreamCombinerProxy3<T1, T2, T3> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;

  StreamCombinerProxy3(this.s1, this.s2, this.s3);

  Stream<T> withFunction<T>(T Function(T1 s1, T2 s2, T3 s3) fn) =>
      Rx.defer(() => Rx.combineLatest3(s1, s2, s3, fn), reusable: true);

  Stream<Tuple3<T1, T2, T3>> withTuple() =>
      withFunction((s1, s2, s3) => Tuple3(s1, s2, s3));
}

class StreamCombinerProxy4<T1, T2, T3, T4> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;

  StreamCombinerProxy4(this.s1, this.s2, this.s3, this.s4);

  Stream<T> withFunction<T>(T Function(T1 s1, T2 s2, T3 s3, T4 s4) fn) =>
      Rx.defer(() => Rx.combineLatest4(s1, s2, s3, s4, fn), reusable: true);

  Stream<Tuple4<T1, T2, T3, T4>> withTuple() =>
      withFunction((s1, s2, s3, s4) => Tuple4(s1, s2, s3, s4));
}

class StreamCombinerProxy5<T1, T2, T3, T4, T5> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;
  final Stream<T5> s5;

  StreamCombinerProxy5(this.s1, this.s2, this.s3, this.s4, this.s5);

  Stream<T> withFunction<T>(T Function(T1 s1, T2 s2, T3 s3, T4 s4, T5 s5) fn) =>
      Rx.defer(() => Rx.combineLatest5(s1, s2, s3, s4, s5, fn), reusable: true);

  Stream<Tuple5<T1, T2, T3, T4, T5>> withTuple() =>
      withFunction((s1, s2, s3, s4, s5) => Tuple5(s1, s2, s3, s4, s5));
}

class StreamCombinerProxy6<T1, T2, T3, T4, T5, T6> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;
  final Stream<T5> s5;
  final Stream<T6> s6;

  StreamCombinerProxy6(this.s1, this.s2, this.s3, this.s4, this.s5, this.s6);

  Stream<T> withFunction<T>(
          T Function(T1 s1, T2 s2, T3 s3, T4 s4, T5 s5, T6 s6) fn) =>
      Rx.defer(() => Rx.combineLatest6(s1, s2, s3, s4, s5, s6, fn),
          reusable: true);

  Stream<Tuple6<T1, T2, T3, T4, T5, T6>> withTuple() =>
      withFunction((s1, s2, s3, s4, s5, s6) => Tuple6(s1, s2, s3, s4, s5, s6));
}

class StreamCombinerProxy7<T1, T2, T3, T4, T5, T6, T7> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;
  final Stream<T5> s5;
  final Stream<T6> s6;
  final Stream<T7> s7;

  StreamCombinerProxy7(
      this.s1, this.s2, this.s3, this.s4, this.s5, this.s6, this.s7);

  Stream<T> withFunction<T>(
          T Function(T1 s1, T2 s2, T3 s3, T4 s4, T5 s5, T6 s6, T7 s7) fn) =>
      Rx.defer(() => Rx.combineLatest7(s1, s2, s3, s4, s5, s6, s7, fn),
          reusable: true);

  Stream<Tuple7<T1, T2, T3, T4, T5, T6, T7>> withTuple() => withFunction(
      (s1, s2, s3, s4, s5, s6, s7) => Tuple7(s1, s2, s3, s4, s5, s6, s7));
}

class StreamCombinerProxy8<T1, T2, T3, T4, T5, T6, T7, T8> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;
  final Stream<T5> s5;
  final Stream<T6> s6;
  final Stream<T7> s7;
  final Stream<T8> s8;

  StreamCombinerProxy8(
      this.s1, this.s2, this.s3, this.s4, this.s5, this.s6, this.s7, this.s8);

  Stream<T> withFunction<T>(
          T Function(T1 s1, T2 s2, T3 s3, T4 s4, T5 s5, T6 s6, T7 s7, T8 s8)
              fn) =>
      Rx.defer(() => Rx.combineLatest8(s1, s2, s3, s4, s5, s6, s7, s8, fn),
          reusable: true);

  Stream<Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>> withTuple() =>
      withFunction((s1, s2, s3, s4, s5, s6, s7, s8) =>
          Tuple8(s1, s2, s3, s4, s5, s6, s7, s8));
}

class StreamCombinerProxy9<T1, T2, T3, T4, T5, T6, T7, T8, T9> {
  final Stream<T1> s1;
  final Stream<T2> s2;
  final Stream<T3> s3;
  final Stream<T4> s4;
  final Stream<T5> s5;
  final Stream<T6> s6;
  final Stream<T7> s7;
  final Stream<T8> s8;
  final Stream<T9> s9;

  StreamCombinerProxy9(this.s1, this.s2, this.s3, this.s4, this.s5, this.s6,
      this.s7, this.s8, this.s9);

  Stream<T> withFunction<T>(
          T Function(
                  T1 s1, T2 s2, T3 s3, T4 s4, T5 s5, T6 s6, T7 s7, T8 s8, T9 s9)
              fn) =>
      Rx.defer(() => Rx.combineLatest9(s1, s2, s3, s4, s5, s6, s7, s8, s9, fn),
          reusable: true);

  Stream<Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>> withTuple() =>
      withFunction((s1, s2, s3, s4, s5, s6, s7, s8, s9) =>
          Tuple9(s1, s2, s3, s4, s5, s6, s7, s8, s9));
}
