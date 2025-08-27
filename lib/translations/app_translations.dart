import 'dart:ui';

import 'package:get/get.dart';

class AppTranslations extends Translations {
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      // language selection screen
      'choose_language': 'CHOOSE YOUR LANGUAGE',
      'select_language':
          'Select your preferred language\nfor audio and interface',
      'english': 'English',
      'default_language': 'Default Language',
      'spanish': 'Spanish',
      'spanish_language': 'Spanish Language',
      'change_later':
          'You can change your preferred language later from settings',
      'continue': 'Continue',

      // home screen
      'good_morning': 'Good morning!',
      'good_afternoon': 'Good afternoon!',
      'good_evening': 'Good evening!',
      'choose_prayer': 'Choose Prayer',
      'devotional': 'Devotional',
      'petitions': 'Petitions',
       'request': 'Request',
      // 'request_prayer': 'Request Prayer',
      'animonks': 'Animonks',
      'ask_cathy': 'Ask Cathy',
       'ai_faith_coach': 'AI Faith Coach',
    },
    'es_ES': {
      // language selection screen
      'choose_language': 'ELIJA SU IDIOMA',
      'select_language':
          'Seleccione su idioma preferido\npara audio e interfaz',
      'english': 'Inglés',
      'default_language': 'Idioma predeterminado',
      'spanish': 'Español',
      'spanish_language': 'Idioma español',
      'change_later':
          'Puede cambiar su idioma preferido más tarde en la configuración',
      'continue': 'Continuar',

      // home screen
      'good_morning': '¡Buenos días!',
      'good_afternoon': '¡Buenas tardes!',
      'good_evening': '¡Buenas noches!',
      'choose_prayer': 'Elegir Oración', 
      'devotional': 'Devocional',
      'petitions': 'Peticiones',
      'request': 'Solicitud',
      // 'request_prayer': 'Solicitar Oración',
      'animonks': 'Animonjes',
      'ask_cathy': 'Pregunta a Cathy',
      'ai_faith_coach': 'Coach de Fe IA',
    },
  };
}
