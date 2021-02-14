import 'stream_combiner_proxy.g.dart';

abstract class Rxs {
  Rxs._();

  static StreamCombinerProxy2<T1, T2> combine2<T1, T2>(
          Stream<T1> s1, Stream<T2> s2) =>
      StreamCombinerProxy2(s1, s2);

  static StreamCombinerProxy3<T1, T2, T3> combine3<T1, T2, T3>(
          Stream<T1> s1, Stream<T2> s2, Stream<T3> s3) =>
      StreamCombinerProxy3(s1, s2, s3);

  static StreamCombinerProxy4<T1, T2, T3, T4> combine4<T1, T2, T3, T4>(
          Stream<T1> s1, Stream<T2> s2, Stream<T3> s3, Stream<T4> s4) =>
      StreamCombinerProxy4(s1, s2, s3, s4);

  static StreamCombinerProxy5<T1, T2, T3, T4, T5> combine5<T1, T2, T3, T4, T5>(
          Stream<T1> s1,
          Stream<T2> s2,
          Stream<T3> s3,
          Stream<T4> s4,
          Stream<T5> s5) =>
      StreamCombinerProxy5(s1, s2, s3, s4, s5);

  static StreamCombinerProxy6<T1, T2, T3, T4, T5, T6>
      combine6<T1, T2, T3, T4, T5, T6>(Stream<T1> s1, Stream<T2> s2,
              Stream<T3> s3, Stream<T4> s4, Stream<T5> s5, Stream<T6> s6) =>
          StreamCombinerProxy6(s1, s2, s3, s4, s5, s6);

  static StreamCombinerProxy7<T1, T2, T3, T4, T5, T6, T7>
      combine7<T1, T2, T3, T4, T5, T6, T7>(
              Stream<T1> s1,
              Stream<T2> s2,
              Stream<T3> s3,
              Stream<T4> s4,
              Stream<T5> s5,
              Stream<T6> s6,
              Stream<T7> s7) =>
          StreamCombinerProxy7(s1, s2, s3, s4, s5, s6, s7);

  static StreamCombinerProxy8<T1, T2, T3, T4, T5, T6, T7, T8>
      combine8<T1, T2, T3, T4, T5, T6, T7, T8>(
              Stream<T1> s1,
              Stream<T2> s2,
              Stream<T3> s3,
              Stream<T4> s4,
              Stream<T5> s5,
              Stream<T6> s6,
              Stream<T7> s7,
              Stream<T8> s8) =>
          StreamCombinerProxy8(s1, s2, s3, s4, s5, s6, s7, s8);

  static StreamCombinerProxy9<T1, T2, T3, T4, T5, T6, T7, T8, T9>
      combine9<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
              Stream<T1> s1,
              Stream<T2> s2,
              Stream<T3> s3,
              Stream<T4> s4,
              Stream<T5> s5,
              Stream<T6> s6,
              Stream<T7> s7,
              Stream<T8> s8,
              Stream<T9> s9) =>
          StreamCombinerProxy9(s1, s2, s3, s4, s5, s6, s7, s8, s9);
}
