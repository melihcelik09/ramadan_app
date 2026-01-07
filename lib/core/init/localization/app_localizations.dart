import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Ramadan App'**
  String get appTitle;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @nextTime.
  ///
  /// In en, this message translates to:
  /// **'Next Time'**
  String get nextTime;

  /// No description provided for @remainingTime.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remainingTime;

  /// No description provided for @timeAlert.
  ///
  /// In en, this message translates to:
  /// **'Time Alert'**
  String get timeAlert;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert '**
  String get alert;

  /// No description provided for @dailyDua.
  ///
  /// In en, this message translates to:
  /// **'Daily Dua'**
  String get dailyDua;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @qiableFinder.
  ///
  /// In en, this message translates to:
  /// **'Qiable Finder'**
  String get qiableFinder;

  /// No description provided for @qiableOffset.
  ///
  /// In en, this message translates to:
  /// **'Qiblah Offset'**
  String get qiableOffset;

  /// No description provided for @ramadanCountdown.
  ///
  /// In en, this message translates to:
  /// **'Ramadan \nCountdown'**
  String get ramadanCountdown;

  /// No description provided for @ramadanCountdownV2.
  ///
  /// In en, this message translates to:
  /// **'Ramadan Countdown'**
  String get ramadanCountdownV2;

  /// No description provided for @asmaAlHusna.
  ///
  /// In en, this message translates to:
  /// **'Asma Al-Husna'**
  String get asmaAlHusna;

  /// No description provided for @fajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get fajr;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get sun;

  /// No description provided for @dhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get dhuhr;

  /// No description provided for @asr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get asr;

  /// No description provided for @maghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get maghrib;

  /// No description provided for @isha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get isha;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @selectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get selectCountry;

  /// No description provided for @selectState.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get selectState;

  /// No description provided for @selectCity.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get selectCity;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **' Days'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **' Hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **' Minutes'**
  String get minutes;

  /// No description provided for @temp.
  ///
  /// In en, this message translates to:
  /// **'Temp'**
  String get temp;

  /// No description provided for @dailyName.
  ///
  /// In en, this message translates to:
  /// **'Daily Name'**
  String get dailyName;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @welcomeToRamadanApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Ramadan App!'**
  String get welcomeToRamadanApp;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'This app is designed to make worship easier for you.'**
  String get welcomeDescription;

  /// No description provided for @prayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Prayer Times'**
  String get prayerTimes;

  /// No description provided for @prayerTimesDescription.
  ///
  /// In en, this message translates to:
  /// **'This app provides you with prayer times based on your location.'**
  String get prayerTimesDescription;

  /// No description provided for @dailyDuaDescription.
  ///
  /// In en, this message translates to:
  /// **'We present you with verses from the Quran every day.'**
  String get dailyDuaDescription;

  /// No description provided for @locationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Location'**
  String get locationPermissionTitle;

  /// No description provided for @locationPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'You can get access to location based features'**
  String get locationPermissionDescription;

  /// No description provided for @locationPermissionButtonText.
  ///
  /// In en, this message translates to:
  /// **'Allow Location'**
  String get locationPermissionButtonText;

  /// No description provided for @notificationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get notificationPermissionTitle;

  /// No description provided for @notificationPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'You can get notifications about upcoming prayer time'**
  String get notificationPermissionDescription;

  /// No description provided for @notificationPermissionButtonText.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get notificationPermissionButtonText;

  /// No description provided for @locationSelectTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get locationSelectTitle;

  /// No description provided for @locationSelectDescription.
  ///
  /// In en, this message translates to:
  /// **'You must select a location to use the location based features of the application.'**
  String get locationSelectDescription;

  /// No description provided for @locationSelectCountryText.
  ///
  /// In en, this message translates to:
  /// **'Select Country'**
  String get locationSelectCountryText;

  /// No description provided for @locationSelectStateText.
  ///
  /// In en, this message translates to:
  /// **'Select State'**
  String get locationSelectStateText;

  /// No description provided for @locationSelectCityText.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get locationSelectCityText;

  /// No description provided for @locationNavigateHomeButtonText.
  ///
  /// In en, this message translates to:
  /// **'Go to Home Page'**
  String get locationNavigateHomeButtonText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
