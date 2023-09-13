import 'package:xml/xml.dart';

class Entries {
  final List<Entry> word;
  Entries(this.word);

  static Entries generateFromXmlNodeList(List<XmlNode> nodes) {
    final List<Entry> entries = [];
    for (var node in nodes) {
      entries.add(Entry(node.innerText, node.innerText, node.innerText));
    }
    return Entries(entries);
  }
}

class Entry {
  final String word;
  final String definition;
  final String partOfSpeech;

  Entry(this.word, this.definition, this.partOfSpeech);
}
