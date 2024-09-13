class NumberToWords {
  static const List<String> _units = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine'
  ];
  static const List<String> _teens = [
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ];
  static const List<String> _tens = [
    '',
    '',
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ];

  static String convert(int number) {
    // print('Inside Convert');
    if (number == 0) {
      return 'Zero';
    }
    return _convertRecursive(number);
  }

  static String _convertRecursive(int number) {
    if (number < 10) {
      return _units[number];
    } else if (number < 20) {
      return _teens[number - 10];
    } else if (number < 100) {
      return '${_tens[number ~/ 10]} ${_convertRecursive(number % 10)}';
    } else if (number < 1000) {
      return '${_units[number ~/ 100]} Hundred ${_convertRecursive(number % 100)}';
    } else if (number < 100000) {
      return '${_convertRecursive(number ~/ 1000)} Thousand ${_convertRecursive(number % 1000)}';
    } else if (number < 10000000) {
      return '${_convertRecursive(number ~/ 100000)} Lakh ${_convertRecursive(number % 100000)}';
    } else {
      return '${_convertRecursive(number ~/ 10000000)} Crore ${_convertRecursive(number % 10000000)}';
    }
  }
}

// void main() {
//   int number = 1234567;
//   String words = NumberToWords.convert(number);
//   print('Number: $number');
//   print('Words: $words');
// }
