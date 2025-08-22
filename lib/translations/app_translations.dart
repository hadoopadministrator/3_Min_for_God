import 'dart:ui';

import 'package:get/get.dart';

class AppTranslations extends Translations {
  static final fallbackLocale = Locale('en', 'US');
  
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'choose_language': 'CHOOSE YOUR LANGUAGE',
          'select_language': 'Select your preferred language\nfor audio and interface',
          'default_language': 'Default Language',
          'spanish_language': 'Spanish Language',
          'change_later': 'You can change your preferred language later from settings',
          'continue': 'Continue',
        },
        'es_ES': {
          'choose_language': 'ELIJA SU IDIOMA',
          'select_language': 'Seleccione su idioma preferido\npara audio e interfaz',
          'default_language': 'Idioma predeterminado',
          'spanish_language': 'Idioma español',
          'change_later': 'Puede cambiar su idioma preferido más tarde en la configuración',
          'continue': 'Continuar',
        }
      };
}
