typedef CallFunc = String? Function(String? text);

class ValidationMixin {
    String? validators(List<CallFunc>? validatorsList, String value) {
      if(validatorsList == null) {
        return null;
      }
      for (final func in validatorsList) {
        final validation = func(value);
        if(validation != null) return validation;
      }
      return null;
    }
}

class Validators {
  static String? isNotEmpty(String? value) {
    if(value == null || value.isEmpty) return "Required field!";
    return null;
  }

  static String? leastFiveChars(String? value) {
    if(value == null || value.length < 5) return "Must have at least 5 characters";
    return null;
  }
}
