A Dart package that parses and prepares a dictionary object from [JMdict](https://www.edrdg.org/wiki/index.php/Main_Page).

## Features

Exposes JMdict project to Dart.

## Usage

```
final file = File("assets/JMdict_e.xml");
final contents = await file.readAsString();

Dictionary? dict = Dictionary.fromXmlString(contents);

print(dict?.wordEntries.elementAt(100).gloss);
print(dict?.wordEntries.elementAt(100).seq);
print(dict?.wordEntries.elementAt(100).reb);
print(dict?.search("言葉").gloss);
```

## Additional information

The JMdict project compiles Japanese-English dictionary in roughly the following format:
```
JMdict
|
|-- entry [1..*]
|   |
|   |-- ent_seq (unique sequence number)
|   |
|   |-- k_ele [0..*] (Kanji element)
|   |   |-- keb (Kanji element body)
|   |   |-- ke_inf [0..*] (Kanji element information)
|   |   |-- ke_pri [0..*] (Kanji element priority)
|   |
|   |-- r_ele [1..*] (Reading element)
|   |   |-- reb (Reading element body)
|   |   |-- re_nokanji [0..1] (No true kanji reading)
|   |   |-- re_restr [0..*] (Reading restriction)
|   |   |-- re_inf [0..*] (Reading information)
|   |   |-- re_pri [0..*] (Reading priority)
|   |
|   |-- sense [1..*] (Sense element)
|       |-- stagk [0..*] (Kanji restriction)
|       |-- stagr [0..*] (Reading restriction)
|       |-- pos [0..*] (Part of speech)
|       |-- xref [0..*] (Cross-reference)
|       |-- ant [0..*] (Antonym)
|       |-- field [0..*] (Field of application)
|       |-- misc [0..*] (Miscellaneous info)
|       |-- s_inf [0..*] (Sense information)
|       |-- lsource [0..*] (Loan source)
|       |   |-- @xml:lang (default is "eng")
|       |   |-- @ls_type (source type: "full" or "part")
|       |   |-- @ls_wasei (constructed word: "waseieigo")
|       |-- dial [0..*] (Dialect)
|       |-- gloss [1..*] (Gloss)
|       |   |-- @xml:lang (default is "eng")
|       |   |-- @g_gend (gender)
|       |   |-- @g_type (gloss type: "lit", "fig", "expl")
|       |-- example [0..*] (Example sentence)
|           |-- ex_srce (Example source)
|           |-- ex_text (Example term)
|           |-- ex_sent (Example sentence)
|               |-- @xml:lang (default is "eng")
```
For more information, visit [JMdict documentation](https://www.edrdg.org/wiki/index.php/Main_Page).