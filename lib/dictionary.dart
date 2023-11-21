import 'dart:io';

import 'xml_parsing_utils.dart';
import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class Dictionary {
  List<Entry> wordEntries;

  Dictionary(this.wordEntries);

  static Dictionary fromXmlPath(String filepath) {
    final file = File(filepath);
    final contents = file.readAsStringSync();
    return fromXmlString(contents);
  }

  static Dictionary fromXmlString(String xmlString) {
    final XmlDocument dictionaryDocument = XmlDocument.parse(xmlString);
    final childrenOfRoot =
        dictionaryDocument.rootElement.findElements('*').toList();

    final List<Entry> entries = [];

    for (var entryElement in childrenOfRoot) {
      final entry = XmlParsingUtils.parseToEntry(entryElement);
      entries.add(entry);
    }

    final dict = Dictionary(entries);
    return dict;
  }

  Entry search(String word) {
    return wordEntries.firstWhere(
        (element) =>
            element.reb == word ||
            element.keb == word ||
            element.gloss.contains(word),
        orElse: () => Entry("Not found", "Not found", [], -1, []));
  }
}
