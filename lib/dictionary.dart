import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class Dictionary {
  List<Entry> entries = [];

  void loadFromXml({String xmlString = "assets/JMdict_e.xml"}) {
    try {
      final document = XmlDocument.parse(xmlString);
      int i = 0;
      for (XmlNode node in document.children) {
        if (i >= 10) break;
        for (XmlNode nodeChild in node.children) {
          if (nodeChild is XmlElement) {
            print(nodeChild.name);
            i++;
          }
        }
      }
    } catch (e) {
      print('Failed to parse XML: $e');
    }
  }
}
