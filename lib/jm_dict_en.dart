library jm_dict_en;

import 'dart:io';

import 'package:jm_dict_en/dictionary.dart';

Future<void> main() async {
  final file = File("assets/JMdict_e.xml");
  final contents = await file.readAsString();
  Dictionary? dict = Dictionary.loadFromXml(contents);
  print(dict?.entries.wordlist.elementAt(10).gloss);
  print(dict?.entries.wordlist.elementAt(10).seq);
  print(dict?.entries.wordlist.elementAt(10).reb);
}
