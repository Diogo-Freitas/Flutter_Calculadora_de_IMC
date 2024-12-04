import 'package:flutter/material.dart';

class IMCController {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String infoText = 'Informe seus dados';

  void resetFields() {
    weightController.text = '';
    heightController.text = '';
    infoText = 'Informe seus dados';
  }

  void calculateIMC() {
    try {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    } catch (e) {
      infoText = "Digite valores válidos";
    }
  }
}
