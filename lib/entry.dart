import 'package:xml/xml.dart';

class Entries {
  final List<Entry> entries;
  Entries(this.entries);
}

class Entry extends XmlNode {
  final XmlElement element;
  final String word;
  final String definition;
  final String partOfSpeech;

  Entry(this.word, this.definition, this.partOfSpeech)
      : element = XmlElement(XmlName('entry')),
        super();

  @override
  XmlNode copy() {
    return Entry(word, definition, partOfSpeech);
  }

  @override
  void accept(XmlVisitor visitor) {
    visitor.visitElement(element);
  }

  @override
  XmlNodeType get nodeType => XmlNodeType.ELEMENT;
}
