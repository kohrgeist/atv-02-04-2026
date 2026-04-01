import 'package:atv/app/models/usuario_model.dart';

class UsuarioMockStore {
  // Lista estática com usuario ja cadastrado para teste.
  static List<UsuarioModel> usuarios = [
    UsuarioModel(nome: 'Jonas', email: 'jonas@gmail.com', senha: "123456"),
  ];
  // Método estático para adicionar um novo item
  static void adicionarUsuario(UsuarioModel novoUsuario) {
    usuarios.add(novoUsuario);
  }
}
