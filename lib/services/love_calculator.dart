class LoveCalculator {
  static String loveCalculator(String firstPersonName, String secondPersonName) {
    String shortString = countChars(firstPersonName, secondPersonName);

    String output = shortString;

    do {
      shortString = shortenNumber(shortString);
      if (shortString.length == 2) {}
      output = output + shortString;
    } while (shortString.length > 2);
    output = "$output%";
	output = output.substring(output.length - 3, output.length - 1);

    return output;
  }
}

String shortenNumber(String str) {
  String shortenString = "";

  if (str.length >= 2) {
    var splittedStr = str.split('');
    int int1 = int.parse(splittedStr[0]);
    int int2 = int.parse(splittedStr[str.length - 1]);
    shortenString = (int1 + int2).toString() +
        shortenNumber(str.substring(1, str.length - 1));
  } else {
    return str;
  }

  return shortenString;
}

String countChars(String str1, String str2) {
  String combinedString = "${str1.toLowerCase()}loves${str2.toLowerCase()}";

  String strAllChars = "";
  String strCount = "";

  for (var rune in combinedString.runes) {
    var c1 = String.fromCharCode(rune);
    if (!strAllChars.contains(c1)) {
      int count = 0;

      for (var rune in combinedString.runes) {
        var c2 = String.fromCharCode(rune);
        if (c1 == c2) {
          count = count + 1;
        }
      }
      strAllChars = strAllChars + c1;
      strCount = strCount + count.toString();
    }
  }
  return strCount;
}
