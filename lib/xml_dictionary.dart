import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class XmlDictionary {
  final XmlDocument xmlString;

  XmlDictionary(this.xmlString);

  Entry search(String word) {
    try {
      return xmlString
          .findAllElements('entry')
          .map((entryElement) => Entry.fromXmlElement(entryElement))
          .firstWhere(
            (entry) =>
                entry.reb == word ||
                entry.keb == word ||
                entry.gloss.contains(word),
            orElse: () => Entry("Not found", "Not found", [], -1, []),
          );
    } catch (e) {
      print('Error reading/parsing the XML file: $e');
      return Entry("Error", "Error", [], -1, []);
    }
  }
}
