import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
  }) =>
      [enText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'kmtxfw8n': {
      'en': 'Ada',
      'de': '',
    },
    'g1c1njeh': {
      'en': 'pacemaker Data Repository',
      'de': '',
    },
    'z33syfmw': {
      'en': 'Hypatia',
      'de': '',
    },
    'wu0zrts5': {
      'en': 'Event Hub',
      'de': '',
    },
    'ts92epfq': {
      'en': 'Home',
      'de': '',
    },
  },
  // Dashboard
  {
    'sz1x8ixi': {
      'en': 'admin@pacemaker.ai',
      'de': '',
    },
    'hf3ioiuz': {
      'en': 'Home',
      'de': '',
    },
  },
  // Category
  {
    'y7rw6tn4': {
      'en': 'admin@pacemaker.ai',
      'de': '',
    },
    'gw7tj0s4': {
      'en': 'Home',
      'de': '',
    },
  },
  // subCategory
  {
    'tefcrq5d': {
      'en': 'admin@pacemaker.ai',
      'de': '',
    },
    'axq6dpnj': {
      'en': 'Home',
      'de': '',
    },
  },
  // singleSub
  {
    'f62hqwqs': {
      'en': 'admin@pacemaker.ai',
      'de': '',
    },
    'bnvb06wn': {
      'en': 'Product Name',
      'de': '',
    },
    'pv0r6ci9': {
      'en': 'Data Type',
      'de': '',
    },
    'jw8be9ba': {
      'en': 'Source/Origin',
      'de': '',
    },
    'zq233egm': {
      'en': 'Number of Entries',
      'de': '',
    },
    '91e0ikwr': {
      'en': 'Last Update',
      'de': '',
    },
    'eawe34wj': {
      'en': 'Status',
      'de': '',
    },
    'yu2x6eyf': {
      'en': 'WTI Oil',
      'de': '',
    },
    'q2p6to9y': {
      'en': 'Finance',
      'de': '',
    },
    'qp848f9z': {
      'en': 'alphavantage',
      'de': '',
    },
    'd69zmqx7': {
      'en': '42',
      'de': '',
    },
    'zyaxgcwi': {
      'en': '17.08.2023',
      'de': '',
    },
    'u7hfg3wq': {
      'en': 'Updated',
      'de': '',
    },
    'mxuoi1is': {
      'en': 'Brent Oil',
      'de': '',
    },
    'iazhftxa': {
      'en': 'Finance',
      'de': '',
    },
    '88q0jodk': {
      'en': 'alphavantage',
      'de': '',
    },
    'vxrkaj0p': {
      'en': '39',
      'de': '',
    },
    'kgcnfq9r': {
      'en': '17.08.2023',
      'de': '',
    },
    'set7sa7e': {
      'en': 'Updated',
      'de': '',
    },
    'n69smgq4': {
      'en': 'WTI Oil',
      'de': '',
    },
    '5jx2y51j': {
      'en': 'Finance',
      'de': '',
    },
    'k2wh633l': {
      'en': 'alphavantage',
      'de': '',
    },
    'ga5xi6is': {
      'en': '42',
      'de': '',
    },
    'wwr0vqtm': {
      'en': '17.08.2023',
      'de': '',
    },
    '47xt083g': {
      'en': 'Updated',
      'de': '',
    },
    'l00fnsgv': {
      'en': 'WTI Oil',
      'de': '',
    },
    'cchf5cw8': {
      'en': 'Finance',
      'de': '',
    },
    'rfauslh7': {
      'en': 'alphavantage',
      'de': '',
    },
    'dz4d4gxb': {
      'en': '42',
      'de': '',
    },
    'du9jh0hg': {
      'en': '17.08.2023',
      'de': '',
    },
    'uh9f6hd5': {
      'en': 'Updated',
      'de': '',
    },
    '6msp9c6n': {
      'en': 'WTI Oil',
      'de': '',
    },
    'fhfottja': {
      'en': 'Finance',
      'de': '',
    },
    'logleoew': {
      'en': 'alphavantage',
      'de': '',
    },
    'us6dw4qd': {
      'en': '42',
      'de': '',
    },
    'an02z02t': {
      'en': '17.08.2023',
      'de': '',
    },
    'ou3hj173': {
      'en': 'Updated',
      'de': '',
    },
    '0h9i9t7d': {
      'en': 'WTI Oil',
      'de': '',
    },
    '24ds0t1k': {
      'en': 'Finance',
      'de': '',
    },
    'pp7xtzhn': {
      'en': 'alphavantage',
      'de': '',
    },
    'q0nwn91v': {
      'en': '42',
      'de': '',
    },
    '815gvw5j': {
      'en': '17.08.2023',
      'de': '',
    },
    'qqjx5epd': {
      'en': 'Updated',
      'de': '',
    },
    '0plfg5sq': {
      'en': 'WTI Oil',
      'de': '',
    },
    'du3gi9hp': {
      'en': 'Finance',
      'de': '',
    },
    'x2snfe1r': {
      'en': 'alphavantage',
      'de': '',
    },
    'l8ciwqxd': {
      'en': '42',
      'de': '',
    },
    '00y7i2ne': {
      'en': '17.08.2023',
      'de': '',
    },
    'w9edrnl1': {
      'en': 'Updated',
      'de': '',
    },
    'zuy0fxes': {
      'en': 'Home',
      'de': '',
    },
  },
  // singleItem
  {
    'ejygfrmk': {
      'en': 'admin@pacemaker.ai',
      'de': '',
    },
    'mqxr4vsj': {
      'en': 'WTI Oil',
      'de': '',
    },
    'hz7yuyto': {
      'en': 'DB Table:',
      'de': '',
    },
    'koug62m3': {
      'en': ' finance_commodities_wtioil',
      'de': '',
    },
    'r2b2cx77': {
      'en': 'Account Name:',
      'de': '',
    },
    'qvp3j716': {
      'en': ' adastorageaccount',
      'de': '',
    },
    '7zy85926': {
      'en': 'ENDPOINT:',
      'de': '',
    },
    'y0pxcv58': {
      'en': ' https//pacemakerdataplatform.table.cosmis.azure:443/',
      'de': '',
    },
    'k2pa6utc': {
      'en': 'PRIMARY KEY:',
      'de': '',
    },
    'jrbk309k': {
      'en': ' 8J388JJ1949DJKDL91019A1KFJ828NF8J9==',
      'de': '',
    },
    'hl1p5r9m': {
      'en': 'SECONDARY KEY:',
      'de': '',
    },
    'k0eikjxr': {
      'en': '  1NYMMTJ8AJJF74JDJ72NNC82LA91AKF0A ==',
      'de': '',
    },
    'ttqo4cxp': {
      'en': 'PRIMARY CONNECTION STRING:',
      'de': '',
    },
    'ekzb2b8z': {
      'en':
          ' DefaultEndpointsProtocoll=https;AccountName=adastorageaccount;AccountKey=8J388JJ1949DJKDL91019A1KFJ828NF8J9==',
      'de': '',
    },
    'q4xigyp6': {
      'en': 'SECONDARY CONNECTION STRING:',
      'de': '',
    },
    '3s7noixt': {
      'en':
          ' DefaultEndpointsProtocoll=https;AccountName=adastorageaccount;AccountKey=1NYMMTJ8AJJF74JDJ72NNC82LA91AKF0A==',
      'de': '',
    },
    'puja4ek2': {
      'en': 'Home',
      'de': '',
    },
  },
  // AuthenticateSolo1
  {
    'vymklxe7': {
      'en': 'Login',
      'de': '',
    },
    'xzjihr7v': {
      'en': 'Email Address',
      'de': '',
    },
    'cfco8cq6': {
      'en': 'Password',
      'de': '',
    },
    'tstxq2u0': {
      'en': 'Password',
      'de': '',
    },
    'j3zrsklq': {
      'en': 'Save Credentials ',
      'de': '',
    },
    'pdnqp7u9': {
      'en': 'Login',
      'de': '',
    },
    'bi1xolfq': {
      'en': 'Forgot Password?',
      'de': '',
    },
  },
  // forgotPassword
  {
    'qzopzqgt': {
      'en': 'Forgot Password',
      'de': '',
    },
    'r4radlgi': {
      'en': 'Enter your email address to reset your password.',
      'de': '',
    },
    'ukvo0oc3': {
      'en': 'Email Address',
      'de': '',
    },
    'g71bp7tt': {
      'en': 'Reset Password',
      'de': '',
    },
    'lj4bhj7y': {
      'en': 'Remember your password? ',
      'de': '',
    },
    'djnu8kp5': {
      'en': 'Sign In',
      'de': '',
    },
  },
  // Miscellaneous
  {
    '92bz9mis': {
      'en': '',
      'de': '',
    },
    'tbmph6cc': {
      'en': '',
      'de': '',
    },
    '67hl714l': {
      'en': '',
      'de': '',
    },
    'yg80e8ly': {
      'en': '',
      'de': '',
    },
    'kyhpznof': {
      'en': '',
      'de': '',
    },
    'hsu7xnzf': {
      'en': '',
      'de': '',
    },
    'ikwirmog': {
      'en': '',
      'de': '',
    },
    '2fqk46o9': {
      'en': '',
      'de': '',
    },
    'wouypgzq': {
      'en': '',
      'de': '',
    },
    'ayuzuyyt': {
      'en': '',
      'de': '',
    },
    'lljv2jci': {
      'en': '',
      'de': '',
    },
    'y7qopndj': {
      'en': '',
      'de': '',
    },
    '6i552bqj': {
      'en': '',
      'de': '',
    },
    '2wy3huc0': {
      'en': '',
      'de': '',
    },
    'qx51hulm': {
      'en': '',
      'de': '',
    },
    'mg8sqrzx': {
      'en': '',
      'de': '',
    },
    'elc5dx66': {
      'en': '',
      'de': '',
    },
    '0yppfgju': {
      'en': '',
      'de': '',
    },
    'pp59ln9o': {
      'en': '',
      'de': '',
    },
    'mac2wzvu': {
      'en': '',
      'de': '',
    },
    'a0t5q0ou': {
      'en': '',
      'de': '',
    },
    'n1gmzu3y': {
      'en': '',
      'de': '',
    },
    'nb61ezp6': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
