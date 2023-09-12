library jm_dict_en;

import 'dart:io';

import 'package:jm_dict_en/dictionary.dart';

Future<void> main() async {
  Dictionary dict = Dictionary();
  final file = File("assets/JMdict_e.xml");
  final contents = await file.readAsString();
  dict.loadFromXml(xmlString: contents);
}
