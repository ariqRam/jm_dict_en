import 'package:jm_dict_en/xml_parsing_utils.dart';
import 'package:xml/xml.dart';

class Entry {
  final String? keb;
  final String? reb;
  final List<String?> gloss;
  final List<String?> example;
  final int seq;

  Entry(this.keb, this.reb, this.gloss, this.seq, this.example);

  static fromXmlElement(XmlElement entry) {
    return XmlParsingUtils.parseToEntry(entry);
  }

  @override
  String toString() {
    return 'Entry ${this.seq}: ${this.keb} ${this.reb} : ${this.gloss}';
  }
}
