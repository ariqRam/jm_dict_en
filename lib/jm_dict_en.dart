library jm_dict_en;

import 'package:xml/xml.dart';

void loadDictionaryFromXml({String xmlString = "assets/JMdict_e.xml"}) {
  final document = XmlDocument.parse(xmlString);
}
