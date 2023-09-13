import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class Dictionary {
  Entries entries = [];

  void loadFromXml({String xmlString = "assets/JMdict_e.xml"}) {
    try {
      final document = XmlDocument.parse(xmlString);
      int i = 0;
      entries = Entries(document.children.toList());
    } catch (e) {
      print('Failed to parse XML: $e');
    }
  }
}
