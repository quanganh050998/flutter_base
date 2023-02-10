// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Total participants`
  String get totalParticipants {
    return Intl.message(
      'Total participants',
      name: 'totalParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Total earned`
  String get totalEarned {
    return Intl.message(
      'Total earned',
      name: 'totalEarned',
      desc: '',
      args: [],
    );
  }

  /// `Play to earn`
  String get playToEarn {
    return Intl.message(
      'Play to earn',
      name: 'playToEarn',
      desc: '',
      args: [],
    );
  }

  /// `Try our best games now to earn rewards!`
  String get tryOurBestGamesNowToEarnRewards {
    return Intl.message(
      'Try our best games now to earn rewards!',
      name: 'tryOurBestGamesNowToEarnRewards',
      desc: '',
      args: [],
    );
  }

  /// `Game News`
  String get gameNews {
    return Intl.message(
      'Game News',
      name: 'gameNews',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `All games`
  String get allGames {
    return Intl.message(
      'All games',
      name: 'allGames',
      desc: '',
      args: [],
    );
  }

  /// `Player profile`
  String get playerProfile {
    return Intl.message(
      'Player profile',
      name: 'playerProfile',
      desc: '',
      args: [],
    );
  }

  /// `You have not earned any rewards`
  String get notEarnedAnyRewards {
    return Intl.message(
      'You have not earned any rewards',
      name: 'notEarnedAnyRewards',
      desc: '',
      args: [],
    );
  }

  /// `Play Now`
  String get textPlayNow {
    return Intl.message(
      'Play Now',
      name: 'textPlayNow',
      desc: '',
      args: [],
    );
  }

  /// `to get high rewards!`
  String get toGetHighRewards {
    return Intl.message(
      'to get high rewards!',
      name: 'toGetHighRewards',
      desc: '',
      args: [],
    );
  }

  /// `Claim`
  String get claim {
    return Intl.message(
      'Claim',
      name: 'claim',
      desc: '',
      args: [],
    );
  }

  /// `“{nameGame}” new game has been released!`
  String titleCardNewGame(Object nameGame) {
    return Intl.message(
      '“$nameGame” new game has been released!',
      name: 'titleCardNewGame',
      desc: '',
      args: [nameGame],
    );
  }

  /// `All News`
  String get allNews {
    return Intl.message(
      'All News',
      name: 'allNews',
      desc: '',
      args: [],
    );
  }

  /// `Game Description`
  String get gameDescription {
    return Intl.message(
      'Game Description',
      name: 'gameDescription',
      desc: '',
      args: [],
    );
  }

  /// `PLAY NOW`
  String get playNow {
    return Intl.message(
      'PLAY NOW',
      name: 'playNow',
      desc: '',
      args: [],
    );
  }

  /// `Players`
  String get players {
    return Intl.message(
      'Players',
      name: 'players',
      desc: '',
      args: [],
    );
  }

  /// `Players Earned`
  String get playersEarned {
    return Intl.message(
      'Players Earned',
      name: 'playersEarned',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
