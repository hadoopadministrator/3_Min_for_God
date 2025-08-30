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
      'animonks': 'Animonks',
      'ask_cathy': 'Ask Cathy',
      'ai_faith_coach': 'AI Faith Coach',

      // settings screen
      'settings': 'Settings',
      'theme': 'Theme',
      'language': 'Language',
      'set_notification_timing': 'Set Notification Timing',
      'about_us': 'About Us',
      'contact_us': 'Contact Us',

      // request prayer screen
      'request_prayer': 'Request Prayer',
      'health': 'Health',
      'birthday_or_anniversary': 'Birthday or Anniversary',
      'other': 'Other',

      // week days
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'sunday': 'Sunday',

      // animonks screen
      'back_to_homepage': 'Back to Homepage',

      // choose your language screen
      'choose_your_language': 'Choose your Language',

      // set notification timing screen
      'weekly_reflection': 'Weekly Reflection',
      'three_mins_for_god': 'Do you have 3 mins for God?',

      // splash screen
      'splash_label': '3 MIN FOR GOD',
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
      'animonks': 'Animonjes',
      'ask_cathy': 'Pregunta a Cathy',
      'ai_faith_coach': 'Coach de Fe IA',

      // settings screen
      'settings': 'Configuración',
      'theme': 'Tema',
      'language': 'Idioma',
      'set_notification_timing': 'Configurar hora de notificación',
      'about_us': 'Sobre Nosotros',
      'contact_us': 'Contáctenos',

      // request prayer screen
      'request_prayer': 'Solicitar Oración',
      'health': 'Salud',
      'birthday_or_anniversary': 'Cumpleaños o Aniversario',
      'other': 'Otro',

      // week days
      'monday': 'Lunes',
      'tuesday': 'Martes',
      'wednesday': 'Miércoles',
      'thursday': 'Jueves',
      'friday': 'Viernes',
      'saturday': 'Sábado',
      'sunday': 'Domingo',

      // animonks screen
      'back_to_homepage': 'Volver a la página principal',

      // choose your language screen
      'choose_your_language': 'Elija su idioma',

      // set notification timing screen
      'weekly_reflection': 'Reflexión Semanal',
      'three_mins_for_god': '¿Tienes 3 minutos para Dios?',

      // splash screen
      'splash_label': '3 MIN PARA DIOS',
    },
  };
}
