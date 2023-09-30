import 'dart:io';

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
    final childrenOfRoot = dictionaryDocument.rootElement.findElements('*').toList();

    final List<Entry> entries = [];

    for (var entryElement in childrenOfRoot) {
      final keb = _parseStringFromElement(entryElement.getElement('k_ele'), 'keb');
      final reb = _parseStringFromElement(entryElement.getElement('r_ele'), 'reb');
      final gloss =
          _parseMultipleStringFromElements(entryElement.findAllElements('sense'), 'gloss');
      final seq = _parseSeq(entryElement.getElement('ent_seq'));

      entries.add(
        Entry(keb, reb, gloss, seq),
      );
    }

    final dict = Dictionary(entries);
    return dict;
  }

  static int _parseSeq(XmlElement? seqElement) {
    if (seqElement == null) {
      return -1;
    }
    return int.parse(seqElement.innerText);
  }

  static List<String> _parseMultipleStringFromElements(
    Iterable<XmlElement?> elements,
    String targetName,
  ) {
    return elements.map((element) => _parseStringFromElement(element, targetName)).toList();
  }

  static String _parseStringFromElement(XmlElement? parentOfTarget, String targetName) {
    if (parentOfTarget == null) {
      return "$targetName Not Found";
    } else if (parentOfTarget.name.local == targetName) {
      return parentOfTarget.innerText;
    }

    XmlElement? targetElement = parentOfTarget.getElement(targetName);

    return _parseStringFromElement(targetElement, targetName);
  }

  Entry search(String word) {
    return wordEntries.firstWhere((element) => element.reb == word || element.keb == word,
        orElse: () => Entry("Not found", "Not found", [], -1));
  }
}
