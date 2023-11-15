class BlackJackExceptions implements Exception {
  final String msg;
  BlackJackExceptions(this.msg);
  @override
  String toString() {
    return super.toString();
  }
}

class ExcessaoNumeroDeJogadoresInvalidos extends BlackJackExceptions {
  ExcessaoNumeroDeJogadoresInvalidos(super.msg);
}
