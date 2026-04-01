class SplashViewModel {
  Future<void> carregarLogin(Function aoTerminar) async {
    await Future.delayed(const Duration(seconds: 3));
    aoTerminar();
  }
}
