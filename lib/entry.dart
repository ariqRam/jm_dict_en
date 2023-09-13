import 'package:xml/xml.dart';

class Entries {
  final List<Entry> wordlist;
  Entries(this.wordlist);

  static Entries generateFromXmlNodeList(List<XmlNode> nodes) {
    final List<Entry> entries = [];
    for (var node in nodes) {
      final keb = node.getElement('keb')?.localName;
      final reb = node.getElement('r_ele')?.getElement('reb')?.innerText;
      final gloss = node.getElement('gloss')?.innerText;
      final seq = int.parse(node.getElement('ent_seq')?.innerText ?? "-1");
      entries.add(
        Entry(keb, reb, gloss, seq),
      );
    }
    return Entries(entries);
  }
}

class Entry {
  final String? keb;
  final String? reb;
  final String? gloss;
  final int seq;

  Entry(this.keb, this.reb, this.gloss, this.seq);
}
