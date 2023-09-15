// ignore_for_file: avoid_print

import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class Dictionary {
  List<Entry> wordEntries;

  Dictionary(this.wordEntries);

  static Dictionary? loadFromXml(String xmlString) {
    final XmlDocument dictionaryDocument = XmlDocument.parse(xmlString);
    final rootElements = dictionaryDocument.rootElement.findElements('*').toList();
    final List<Entry> entries = [];
    for (var entryElement in rootElements) {
      final keb = entryElement.getElement('keb')?.localName;
      final reb = parseStringFromElement(entryElement.getElement('r_ele'), 'reb');
      final gloss = parseStringFromElement(entryElement.getElement('sense'), 'gloss');
      final seq = parseSeq(entryElement.getElement('ent_seq'));
      entries.add(
        Entry(keb, reb, gloss, seq),
      );
    }
    print(dictionaryDocument.rootElement.name.qualified);
    final dict = Dictionary(
      entries,
    );
    return dict;
  }

  static int parseSeq(XmlElement? seqElement) {
    if (seqElement == null) {
      return -1;
    }
    return int.parse(seqElement.innerText);
  }

  static String parseStringFromElement(XmlElement? parentOfTarget, String targetName) {
    if (parentOfTarget == null) {
      return "$targetName Not Found";
    } else if (parentOfTarget.name.local == targetName) {
      return parentOfTarget.innerText;
    }

    XmlElement? targetElement = parentOfTarget.getElement(targetName);

    return parseStringFromElement(targetElement, targetName);
  }
}
