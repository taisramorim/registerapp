import 'package:flutter/widgets.dart';

class Translations {
  final Locale locale;

  Translations(this.locale);

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations)!;
  }

  static final Map<String, Map<String, String>> _localizeValues = {
    'en': {
      'welcome': 'Welcome',
      'signIn': 'Sign In',
      'signUp': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'forgotPassword': 'Forgot Password',
      'noAccount': 'Don\'t have an account?',
      'haveAccount': 'Already have an account?',
    },
    'es': {
      'welcome': 'Bienvenido',
      'signIn': 'Iniciar Sesión',
      'signUp': 'Registrarse',
      'email': 'E-mail',
      'password': 'Contraseña',
      'forgotPassword': '¿Olvidaste tu contraseña?',
      'noAccount': '¿No tienes una cuenta?',
      'haveAccount': '¿Ya tienes una cuenta?',
    },
    'pt': {
      'welcome': 'Bem-vindo',
      'signIn': 'Entrar',
      'signUp': 'Inscrever-se',
      'email': 'E-mail',
      'password': 'Senha',
      'forgotPassword': 'Esqueceu a senha?',
      'noAccount': 'Não tem uma conta?',
      'haveAccount': 'Já tem uma conta?',
    }
  };

  String get welcome => _localizeValues[locale.languageCode]!['welcome']!;
  String get signIn => _localizeValues[locale.languageCode]!['signIn']!;
  String get signUp => _localizeValues[locale.languageCode]!['signUp']!;
  String get email => _localizeValues[locale.languageCode]!['email']!;
  String get password => _localizeValues[locale.languageCode]!['password']!;
  String get forgotPassword => _localizeValues[locale.languageCode]!['forgotPassword']!;
  String get noAccount => _localizeValues[locale.languageCode]!['noAccount']!;
  String get haveAccount => _localizeValues[locale.languageCode]!['haveAccount']!;

}