class IMCFormValidator {
  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira o seu Peso.";
    }
    if (double.tryParse(value) == null) {
      return "O Peso deve ser um número válido em (kg).";
    }
    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira a sua Altura.";
    }
    if (double.tryParse(value) == null) {
      return "A Altura deve ser um número válido em (cm).";
    }
    return null;
  }
}
