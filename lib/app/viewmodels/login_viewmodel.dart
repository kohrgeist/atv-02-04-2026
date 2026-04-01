import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:atv/app/data/usuario_mock_store.dart';
import 'package:atv/app/views/home_page.dart';

class LoginViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController =
      TextEditingController(); //EditingController é o que faz o usuario poder inserir texto
  final passwordController = TextEditingController();

  bool obscurePassword = true; // para a senha não aparecer
  bool isLoading =
      false; // indica carregamento caso o sistema esteja fazendo algo com um icone automatico

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  } //valida o e-mail como um if else, se tudo estiver ok ele passa e é retornado o valor inserido

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatória'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  } //valida a senha insedira, caso esteja tudo conforme os requerimentos exibe a senha com obscure no quadrado de texto e segue

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  } // botao de liga e desliga obscure

  void validarLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final encontrou = UsuarioMockStore.usuarios
          .where(
            (usuarios) =>
                usuarios.email == emailController.text &&
                usuarios.senha == passwordController.text,
          )
          .firstOrNull;
      if (encontrou != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login ou senha inválidos!"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
