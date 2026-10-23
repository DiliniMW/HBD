import 'dart:io';

void main(List<String> arguments) {
  File('${arguments[0]}/.nojekyll').writeAsStringSync('');
}
