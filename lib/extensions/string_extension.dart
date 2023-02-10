extension StringExt on String {
  String shorten(int firstLength, int endLength) {
    if (isEmpty) {
      return this;
    }

    return replaceRange(
      firstLength,
      length - endLength,
      '…',
    );
  }
}