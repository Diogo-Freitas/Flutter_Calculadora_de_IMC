import 'package:flutter/material.dart';
import '../controllers/imc_controller.dart';
import '../validators/imc_form_validator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final IMCController _controller = IMCController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _controller.resetFields();
                _formKey = GlobalKey<FormState>();
              });
            },
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.person_outline, size: 120, color: Colors.green),
              const SizedBox(height: 16),
              TextFormField(
                controller: _controller.weightController,
                validator: IMCFormValidator.validateHeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _controller.heightController,
                validator: IMCFormValidator.validateHeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _controller.calculateIMC();
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 10)),
                child: const Text('Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
              const SizedBox(height: 16),
              Text(
                _controller.infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
