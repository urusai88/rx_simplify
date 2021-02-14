import 'dart:io';
import 'package:path/path.dart' as path;

List<String> _genericList(int c) => List.generate(c, (i) => 'T${i + 1}');

List<String> _propertyList(int c) => List.generate(c, (i) => 's${i + 1}');

String _buildCombineFn(int c) {
  final genericList = _genericList(c);
  final propertyList = _propertyList(c);
  final generics = genericList.join(', ');
  final arguments =
      List.generate(c, (i) => 'Stream<${genericList[i]}> ${propertyList[i]}')
          .join(', ');

  return '''
  static StreamCombinerProxy$c<$generics> combine$c<$generics>
    ($arguments) => StreamCombinerProxy$c(${propertyList.join(', ')});
  ''';
}

String _buildRxs(int c) {
  final combineFnDeclarations =
      List.generate(c - 1, (i) => _buildCombineFn(i + 2));

  return '''
import 'stream_combiner_proxy.g.dart';

abstract class Rxs {
  Rxs._();

  ${combineFnDeclarations.join('\n')}
}
  ''';
}

String _buildStreamCombiner(int c) {
  final generics = List.generate(c, (i) => 'T${i + 1}').join(', ');
  final genericList = List.generate(c, (i) => 'T${i + 1}');
  final propertyNameList = List.generate(c, (i) => 's${i + 1}');

  final classDeclaration = 'StreamCombinerProxy$c<$generics>';
  final propertyList =
      List.generate(c, (i) => 'final Stream<T${i + 1}> s${i + 1};');
  final constructorArguments =
      List.generate(c, (i) => 'this.s${i + 1}').join(', ');
  final constructor = 'StreamCombinerProxy$c($constructorArguments);';

  final mapFnArgs =
      List.generate(c, (i) => '${genericList[i]} ${propertyNameList[i]}')
          .join(', ');

  final withFunction = '''
  Stream<T> withFunction<T>(T Function($mapFnArgs) fn) => 
    Rx.defer(() => Rx.combineLatest$c(${propertyNameList.join(', ')}, fn), reusable: true);
  ''';
  final withTuple = '''
  Stream<Tuple$c<${genericList.join(', ')}>> withTuple() => 
    withFunction((${propertyNameList.join(', ')}) => Tuple$c(${propertyNameList.join(', ')}));
  ''';

  return '''
    class $classDeclaration {
      ${propertyList.join('\n')}
            
      $constructor
      
      $withFunction
      
      $withTuple
    }
  ''';
}

String _buildCombinerProxy(int c) {
  final declarations = List.generate(c - 1, (i) => _buildStreamCombiner(i + 2));

  return '''
import 'dart:async';

import 'package:more/more.dart';
import 'package:rxdart/rxdart.dart';

${declarations.join('\n')}
  ''';
}

Future<void> main() async {
  const c = 9;
  final srcPath = path.join('lib', 'src');
  final combinerProxyPath = path.join(srcPath, 'stream_combiner_proxy.g.dart');
  final rxsPath = path.join(srcPath, 'rxs.g.dart');

  final streamCombinerFile = File(combinerProxyPath);
  final rxsFile = File(rxsPath);

  final combinerProxyString = _buildCombinerProxy(c);
  final rxsString = _buildRxs(c);

  await streamCombinerFile.writeAsString(combinerProxyString);
  await rxsFile.writeAsString(rxsString);

  final files = [combinerProxyPath, rxsPath];

  for (final fp in files) {
    await Process.run(
      'dartfmt',
      [fp, '--fix', '-w'],
      runInShell: true,
    );
  }
}
