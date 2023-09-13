import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class Dictionary {
  Entries entries;

  Dictionary(this.entries);

  static Dictionary? loadFromXml(String xmlString) {
    final document = XmlDocument.parse(xmlString);
    final dict = Dictionary(
      Entries.generateFromXmlNodeList(document.children.toList()),
    );
    return dict;
  }
}
