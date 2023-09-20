// ignore_for_file: avoid_print

library jm_dict_en;

import 'dart:io';

import 'package:jm_dict_en/dictionary.dart';

Future<void> main() async {
  final file = File("assets/JMdict_e.xml");
  final contents = await file.readAsString();
  Dictionary? dict = Dictionary.loadFromXml(contents);
  print(dict?.wordEntries.elementAt(100).gloss);
  print(dict?.wordEntries.elementAt(100).seq);
  print(dict?.wordEntries.elementAt(100).reb);
  print(dict?.search("言葉").gloss);
}
