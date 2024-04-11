class CreditCardValidator {
  static bool isValid(String numeroCartao) {
    // Remover espaços em branco e hifens
    String numeroLimpo = numeroCartao.replaceAll(RegExp(r'\s+|-'), '');

    // Verificar se o número do cartão é composto apenas de dígitos
    if (!RegExp(r'^[0-9]+$').hasMatch(numeroLimpo)) {
      return false;
    }

    // Verificar se o número do cartão tem pelo menos 13 dígitos e no máximo 19 dígitos
    if (numeroLimpo.length < 13 || numeroLimpo.length > 19) {
      return false;
    }

    // Verificar usando o algoritmo de Luhn
    int soma = 0;
    bool dobrar = false;
    for (int i = numeroLimpo.length - 1; i >= 0; i--) {
      int digito = int.parse(numeroLimpo[i]);

      if (dobrar) {
        digito *= 2;
        if (digito > 9) {
          digito -= 9;
        }
      }

      soma += digito;
      dobrar = !dobrar;
    }

    return soma % 10 == 0;
  }
}
