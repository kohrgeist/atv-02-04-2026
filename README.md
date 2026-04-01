# YouBug - App Flutter (Atividade Avaliativa)

Este projeto é um pequeno aplicativo em Flutter desenvolvido em grupo para demonstrar conceitos de navegação entre rotas, uso de formulários, validação e manipulação de dados mockados em memória.

## Arquitetura Adotada

Para manter o código limpo e organizado, adotamos uma arquitetura focada na separação de responsabilidades, dividindo o projeto da seguinte forma:

* **`models/`**: Onde definimos a estrutura dos dados. Criamos a classe `UsuarioModel` para representar os usuários cadastrados.
* **`views/`**: Responsável unicamente pela interface gráfica (`SplashPage`, `LoginPage`, `RegisterPage` e `HomePage`). A UI reage às mudanças de estado e repassa as ações do usuário.
* **`viewmodels/`**: O "cérebro" das telas. Utilizando `ChangeNotifier`, centralizamos aqui a lógica de negócio, como a validação dos formulários (usando a biblioteca `validatorless`) e o controle de estado (como exibir/ocultar senha e gerenciar o carregamento).
* **`data/`**: Onde fica o nosso armazenamento temporário. Criamos a classe `UsuarioMockStore` com uma `List<UsuarioModel>` estática, permitindo que os dados salvos na tela de Cadastro sejam acessados e validados na tela de Login.

## Funcionalidades Implementadas

1.  **Splash Screen**: Tela inicial com temporizador via `Future.delayed` que redireciona automaticamente para o Login.
2.  **Login**: Autenticação que verifica se o e-mail e a senha constam na nossa lista em memória. Conta com feedback visual de erro via `SnackBar`.
3.  **Cadastro**: Formulário completo com validação de campos (incluindo checagem de "Confirmar Senha"). Salva o usuário no Model e retorna para a tela de Login.
4.  **Home**: Tela de boas-vindas centralizada, acessada apenas após o login bem-sucedido.

## Equipe de Desenvolvimento
* Marcos Pereira (Kohrgeist)
* Isaque Jeronico (sisaque2)
* Giovanna Garcia (BiriGica)