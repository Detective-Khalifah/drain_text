import 'dart:io';

void main() {
  print('May I have your name, please?');

  String? name = stdin.readLineSync();
  print('Good day, $name');
}
