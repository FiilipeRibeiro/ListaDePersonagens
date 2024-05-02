class FormsPageModel {
  bool valueValidator(String? value) {
    return value == null || value.isEmpty;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      final intValue = int.tryParse(value);
      return intValue == null || intValue < 1 || intValue > 5;
    }
    return true;
  }
}