import 'package:jm_dict_en/entry.dart';
import 'package:xml/xml.dart';

class XmlParsingUtils {
  static Entry parseToEntry(XmlElement entry) {
    final keb = XmlParsingUtils.parseStringFromElement(
        entry.getElement('k_ele'), 'keb');
    final reb = XmlParsingUtils.parseStringFromElement(
        entry.getElement('r_ele'), 'reb');
    final gloss = XmlParsingUtils.parseMultipleStringFromElements(
        entry.findAllElements('sense'), 'gloss');
    final seq = XmlParsingUtils.parseSeq(entry.getElement('ent_seq'));
    final example = XmlParsingUtils.parseExample(entry.getElement('example'));

    final result = Entry(keb, reb, gloss, seq, example);
    return result;
  }

  static int parseSeq(XmlElement? seqElement) {
    if (seqElement == null) {
      return -1;
    }
    return int.parse(seqElement.innerText);
  }

  static List<String?> parseMultipleStringFromElements(
    Iterable<XmlElement?> elements,
    String targetName,
  ) {
    return elements
        .map((element) => parseStringFromElement(element, targetName))
        .toList();
  }

  static String? parseStringFromElement(
      XmlElement? parentOfTarget, String targetName) {
    if (parentOfTarget == null) {
      return null;
    } else if (parentOfTarget.name.local == targetName) {
      return parentOfTarget.innerText;
    }

    XmlElement? targetElement = parentOfTarget.getElement(targetName);

    return parseStringFromElement(targetElement, targetName);
  }

  static List<String?> parseExample(XmlElement? exampleElement) {
    if (exampleElement == null) {
      return [];
    }

    List<String> example = [];
    for (XmlElement child in exampleElement.childElements) {
      example.add(child.innerText);
    }
    return example;
  }
}
