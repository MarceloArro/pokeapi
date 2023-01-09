/// Capitalize the first letter of a string and verify null values [String?]
extension StringNullExtension on String? {
  String? get firstLetterToUpperCase {
    if (this == null) {
      return null;
    } else {
      return this![0].toUpperCase() + this!.substring(1).toLowerCase();
    }
  }
}

/// Capitalize the first letter of a string [String]
extension StringExtension on String {
  String get firstLetterToUpperCase {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
