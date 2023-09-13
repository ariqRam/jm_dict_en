library jm_dict_en;

import 'dart:io';

import 'package:jm_dict_en/dictionary.dart';

Future<void> main() async {
  final file = File("assets/JMdict_e.xml");
  final contents = await file.readAsString();
  Dictionary? dict = Dictionary.loadFromXml(contents);
  print(dict?.entries.word.elementAt(0));
}
