import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:atv/app/data/usuario_mock_store.dart';
import 'package:atv/app/models/usuario_model.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  String? nameValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Nome é obrigatório'),
    ])(value);
  }

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  String? confirmPasswordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Confirmação da senha é obrigatória'),
      Validatorless.compare(passwordController, 'As senhas não coincidem!'),
    ])(value);
  }

  void validarCadastro(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final novoUsuario = UsuarioModel(
        nome: nameController.text,
        email: emailController.text,
        senha: passwordController.text,
      );

      UsuarioMockStore.adicionarUsuario(novoUsuario);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cadastro realizado!"),
          backgroundColor: Colors.red,
        ),
      );

      Navigator.pop(context);
    }
  }
}
