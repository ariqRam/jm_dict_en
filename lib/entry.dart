class Entry {
  final String? keb;
  final String? reb;
  final List<String?> gloss;
  final int seq;

  Entry(this.keb, this.reb, this.gloss, this.seq);

  @override
  String toString() {
    return 'Entry ${this.seq}: ${this.keb} ${this.reb} : ${this.gloss}';
  }
}
