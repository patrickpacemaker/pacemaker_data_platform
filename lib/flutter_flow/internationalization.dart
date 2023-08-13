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
    'bg5sr5sb': {
      'en': 'Product Name',
      'de': '',
    },
    'rz83drjp': {
      'en': 'Data Type',
      'de': '',
    },
    '58jruaei': {
      'en': 'Source/Origin',
      'de': '',
    },
    'lf2gig2y': {
      'en': 'Number of Entries',
      'de': '',
    },
    'xfg0eahp': {
      'en': 'Last Update',
      'de': '',
    },
    'd3zx9dg1': {
      'en': 'Status',
      'de': '',
    },
    'bohoe7ly': {
      'en': 'WTI Oil',
      'de': '',
    },
    'jykg2gso': {
      'en': 'Finance',
      'de': '',
    },
    'xaxjegf5': {
      'en': 'alphavantage',
      'de': '',
    },
    'v12enzbh': {
      'en': '42',
      'de': '',
    },
    '8uj00bna': {
      'en': '17.08.2023',
      'de': '',
    },
    'bl4meg09': {
      'en': 'Updated',
      'de': '',
    },
    '62a46d51': {
      'en': 'Brent Oil',
      'de': '',
    },
    'sy20xs8t': {
      'en': 'Finance',
      'de': '',
    },
    'a5ptwr4k': {
      'en': 'alphavantage',
      'de': '',
    },
    '2td9azft': {
      'en': '39',
      'de': '',
    },
    'hoz5hmjy': {
      'en': '17.08.2023',
      'de': '',
    },
    '6dv22oov': {
      'en': 'Updated',
      'de': '',
    },
    'hn0mrbp5': {
      'en': 'Wheat',
      'de': '',
    },
    'oyp6fhk7': {
      'en': 'Finance',
      'de': '',
    },
    'mfta7mdm': {
      'en': 'alphavantage',
      'de': '',
    },
    'amo2w1bu': {
      'en': '2',
      'de': '',
    },
    'vxowgq6f': {
      'en': '17.08.2023',
      'de': '',
    },
    'n1tkogne': {
      'en': 'Raw',
      'de': '',
    },
    'vsexr2wa': {
      'en': 'Aluminium',
      'de': '',
    },
    'za5mnmah': {
      'en': 'Finance',
      'de': '',
    },
    'ze5syf7w': {
      'en': 'alphavantage',
      'de': '',
    },
    'w46g14vp': {
      'en': '51',
      'de': '',
    },
    'elg5kela': {
      'en': '17.08.2023',
      'de': '',
    },
    '0q3sclj7': {
      'en': 'Updated',
      'de': '',
    },
    'eibhgast': {
      'en': 'Natural Gas',
      'de': '',
    },
    'wnarbqr0': {
      'en': 'Finance',
      'de': '',
    },
    'jyw4wu26': {
      'en': 'alphavantage',
      'de': '',
    },
    'jz7ri6ci': {
      'en': '25',
      'de': '',
    },
    'psijjydm': {
      'en': '17.08.2023',
      'de': '',
    },
    '2ph7qqx5': {
      'en': 'Updated',
      'de': '',
    },
    'lrbr0iu4': {
      'en': 'Copper',
      'de': '',
    },
    'i0boya7w': {
      'en': 'Finance',
      'de': '',
    },
    'awmz4eko': {
      'en': 'alphavantage',
      'de': '',
    },
    'nig8p0jm': {
      'en': '2',
      'de': '',
    },
    'eeo4jiwe': {
      'en': '17.08.2023',
      'de': '',
    },
    'gmhdapn1': {
      'en': 'Raw',
      'de': '',
    },
    'r8r17mtp': {
      'en': 'Steel',
      'de': '',
    },
    'i89w5auq': {
      'en': 'Finance',
      'de': '',
    },
    '5vjrm23w': {
      'en': 'alphavantage',
      'de': '',
    },
    '0t7xlcnz': {
      'en': '48',
      'de': '',
    },
    'edzdbqny': {
      'en': '17.08.2023',
      'de': '',
    },
    '08qhyaar': {
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
    '6t34nn1e': {
      'en': 'Feature',
      'de': '',
    },
    'beh6zxm1': {
      'en': 'Date',
      'de': '',
    },
    '6q3yl0xf': {
      'en': 'Description',
      'de': '',
    },
    '2izudime': {
      'en': 'Feature',
      'de': '',
    },
    'b7pnxfpi': {
      'en': 'Feature',
      'de': '',
    },
    '1691bwr3': {
      'en': 'Feature',
      'de': '',
    },
    '3dn1wnk3': {
      'en': 'Feature',
      'de': '',
    },
    'ycmtnrwe': {
      'en': 'Feature',
      'de': '',
    },
    '89m8e5f5': {
      'en': 'Feature',
      'de': '',
    },
    'gbzvi35h': {
      'en': 'Feature',
      'de': '',
    },
    'y0duila7': {
      'en': 'Feature',
      'de': '',
    },
    'srxqzm65': {
      'en': 'Feature',
      'de': '',
    },
    'uvqc9py9': {
      'en': 'Feature',
      'de': '',
    },
    'glyz6075': {
      'en': 'Feature',
      'de': '',
    },
    '8pcd6zzp': {
      'en': 'Feature',
      'de': '',
    },
    'ih5zdff0': {
      'en': 'Feature',
      'de': '',
    },
    'xwazyc8k': {
      'en': 'Feature',
      'de': '',
    },
    'poxcm99j': {
      'en': 'Feature',
      'de': '',
    },
    'qyda5r0q': {
      'en': 'Feature',
      'de': '',
    },
    'snimklt7': {
      'en': 'Feature',
      'de': '',
    },
    '3ec0fbde': {
      'en': 'Feature',
      'de': '',
    },
    'woqkeuuk': {
      'en': 'Feature',
      'de': '',
    },
    'q219r8q8': {
      'en': 'Feature',
      'de': '',
    },
    'j226ttyd': {
      'en': 'Feature',
      'de': '',
    },
    'j600rpw3': {
      'en': 'Feature',
      'de': '',
    },
    'bc6x1h4o': {
      'en': 'Feature',
      'de': '',
    },
    '2x3odsmz': {
      'en': 'Feature',
      'de': '',
    },
    'rjrr7h3r': {
      'en': 'Feature',
      'de': '',
    },
    'qsfs20ys': {
      'en': 'Feature',
      'de': '',
    },
    'adj4yqiw': {
      'en': 'Feature',
      'de': '',
    },
    'rziqmqv6': {
      'en': 'Feature',
      'de': '',
    },
    'vzil12hm': {
      'en': 'Feature',
      'de': '',
    },
    'cbhtj2qy': {
      'en': 'Feature',
      'de': '',
    },
    'z5s85o9a': {
      'en': 'Feature',
      'de': '',
    },
    'h22f2hgv': {
      'en': 'Feature',
      'de': '',
    },
    'q0s1c4sr': {
      'en': 'Feature',
      'de': '',
    },
    'lsw73gcb': {
      'en': 'Feature',
      'de': '',
    },
    'vy21yibs': {
      'en': 'Feature',
      'de': '',
    },
    'isrzy6y0': {
      'en': 'Feature',
      'de': '',
    },
    'x6mjol4l': {
      'en': 'Feature',
      'de': '',
    },
    'j45amtvs': {
      'en': 'Feature',
      'de': '',
    },
    '5mlyfyg4': {
      'en': 'Feature',
      'de': '',
    },
    'lrbjjbaz': {
      'en': 'Feature',
      'de': '',
    },
    'fzzmgl70': {
      'en': 'Feature',
      'de': '',
    },
    'u0r680ym': {
      'en': 'Feature',
      'de': '',
    },
    'f52cbfux': {
      'en': 'Feature',
      'de': '',
    },
    'r0530msc': {
      'en': 'Feature',
      'de': '',
    },
    'hpgtyxo8': {
      'en': 'Feature',
      'de': '',
    },
    '7npjg10o': {
      'en': 'Feature',
      'de': '',
    },
    'enja7oni': {
      'en': 'Feature',
      'de': '',
    },
    'rcrufgdz': {
      'en': 'Feature',
      'de': '',
    },
    'x01oz1g4': {
      'en': 'Feature',
      'de': '',
    },
    'yvi07ao4': {
      'en': 'Feature',
      'de': '',
    },
    'durkguow': {
      'en': 'Feature',
      'de': '',
    },
    'pxixri4l': {
      'en': 'Feature',
      'de': '',
    },
    '4l6jj1w6': {
      'en': 'Feature',
      'de': '',
    },
    '90w6ikrz': {
      'en': 'Feature',
      'de': '',
    },
    '26uchbse': {
      'en': 'Feature',
      'de': '',
    },
    'lb7ovif6': {
      'en': 'Feature',
      'de': '',
    },
    'mmxqo9rx': {
      'en': 'Feature',
      'de': '',
    },
    'u1h6zqxh': {
      'en': 'Feature',
      'de': '',
    },
    'ali0lbva': {
      'en': 'Feature',
      'de': '',
    },
    'vdme5xm8': {
      'en': 'Feature',
      'de': '',
    },
    'firyb2l3': {
      'en': 'Feature',
      'de': '',
    },
    'na1gs69u': {
      'en': 'Feature',
      'de': '',
    },
    'fmsh37e7': {
      'en': 'Feature',
      'de': '',
    },
    'zac8gquc': {
      'en': 'Feature',
      'de': '',
    },
    '36tfey3m': {
      'en': 'Feature',
      'de': '',
    },
    'hvzfx9w1': {
      'en': 'Feature',
      'de': '',
    },
    '3nin0ke8': {
      'en': 'Feature',
      'de': '',
    },
    'wzvclffc': {
      'en': 'Feature',
      'de': '',
    },
    'olbx5mxw': {
      'en': 'Feature',
      'de': '',
    },
    'fj43pg5y': {
      'en': 'Feature',
      'de': '',
    },
    't34wpa5o': {
      'en': 'Feature',
      'de': '',
    },
    'e5dz7nkg': {
      'en': 'Feature',
      'de': '',
    },
    'yrfmpuy3': {
      'en': 'Feature',
      'de': '',
    },
    '4ibnufqr': {
      'en': 'Feature',
      'de': '',
    },
    'a3tfjbuu': {
      'en': 'Feature',
      'de': '',
    },
    'vpd3uoxd': {
      'en': 'Feature',
      'de': '',
    },
    'bxcv0ioy': {
      'en': 'Feature',
      'de': '',
    },
    'wseyyrv0': {
      'en': 'Feature',
      'de': '',
    },
    '17s1vrti': {
      'en': 'Feature',
      'de': '',
    },
    '5uv83gxo': {
      'en': 'Feature',
      'de': '',
    },
    'ep3g2kmo': {
      'en': 'Feature',
      'de': '',
    },
    'gr41p437': {
      'en': 'Feature',
      'de': '',
    },
    '0stthm6e': {
      'en': 'Feature',
      'de': '',
    },
    'deovp6e7': {
      'en': 'Feature',
      'de': '',
    },
    'hwps97fe': {
      'en': 'Feature',
      'de': '',
    },
    'n5xb255d': {
      'en': 'Feature',
      'de': '',
    },
    'a2sley5a': {
      'en': 'Feature',
      'de': '',
    },
    'zwez4u4w': {
      'en': 'Feature',
      'de': '',
    },
    'qqaqpx0n': {
      'en': 'Feature',
      'de': '',
    },
    'jsy5v7o0': {
      'en': 'Feature',
      'de': '',
    },
    '9acmgy2i': {
      'en': 'Feature',
      'de': '',
    },
    'twah12f4': {
      'en': 'Feature',
      'de': '',
    },
    'ayibpy1n': {
      'en': 'Feature',
      'de': '',
    },
    'ly3r4b4h': {
      'en': 'Feature',
      'de': '',
    },
    'rhbkxsfd': {
      'en': 'Feature',
      'de': '',
    },
    'qe8tbp9a': {
      'en': 'Feature',
      'de': '',
    },
    'puja4ek2': {
      'en': 'Home',
      'de': '',
    },
  },
  // AuthenticateSolo1
  {
    'pkzn84mn': {
      'en': 'Login',
      'de': '',
    },
    'lhojmaln': {
      'en': 'Email Address',
      'de': '',
    },
    'efczczp3': {
      'en': 'Password',
      'de': '',
    },
    '38dl1bcs': {
      'en': 'Password',
      'de': '',
    },
    '261qkn24': {
      'en': 'Save Credentials ',
      'de': '',
    },
    '39uh8s2k': {
      'en': 'Login',
      'de': '',
    },
    'tyd7scmz': {
      'en': 'Forgot Password?',
      'de': '',
    },
  },
  // forgotPassword
  {
    'liobs1ph': {
      'en': 'Forgot Password',
      'de': '',
    },
    '7s0f1p4y': {
      'en': 'Enter your email address to reset your password.',
      'de': '',
    },
    'vcq6s561': {
      'en': 'Email Address',
      'de': '',
    },
    '32fa9v6v': {
      'en': 'Reset Password',
      'de': '',
    },
    'nl7f9p5f': {
      'en': 'Remember your password? ',
      'de': '',
    },
    'zzmwbqpx': {
      'en': 'Sign In',
      'de': '',
    },
  },
  // Dropdown05Notifications
  {
    '3fdgdpjg': {
      'en': 'Notifications',
      'de': '',
    },
    '5da98rjo': {
      'en': 'New',
      'de': '',
    },
    '0cr4v83c': {
      'en': 'New Data Update',
      'de': '',
    },
    '9k4k42nu': {
      'en': 'WTI Oil was updated',
      'de': '',
    },
    'zuy3p0er': {
      'en': '3m ago',
      'de': '',
    },
    'lmz42i75': {
      'en': 'New Data Update',
      'de': '',
    },
    'cg6a3155': {
      'en': 'Extreme weather events was updated',
      'de': '',
    },
    'mr930pej': {
      'en': '3m ago',
      'de': '',
    },
    'jwqv58gd': {
      'en': 'New Data Update',
      'de': '',
    },
    'w4bbxfzb': {
      'en': 'Adidas Stock was updated',
      'de': '',
    },
    'tff3my44': {
      'en': '3m ago',
      'de': '',
    },
    'pyhrn1g8': {
      'en': 'All',
      'de': '',
    },
    '9lpz6zap': {
      'en': 'New Product View',
      'de': '',
    },
    'yhifu6aj': {
      'en': 'Sally Mandrus, viewed your product',
      'de': '',
    },
    '0d03r9tz': {
      'en': '3m ago',
      'de': '',
    },
    'smo1cucd': {
      'en': 'New Product View',
      'de': '',
    },
    'yqw8dxt4': {
      'en': 'Sally Mandrus, viewed your product',
      'de': '',
    },
    'u95gmu8c': {
      'en': '3m ago',
      'de': '',
    },
    'rp8g2fr7': {
      'en': 'New Product View',
      'de': '',
    },
    'g0xyib49': {
      'en': 'Sally Mandrus, viewed your product',
      'de': '',
    },
    'z96osjde': {
      'en': '3m ago',
      'de': '',
    },
    '33wv0389': {
      'en': 'New Product View',
      'de': '',
    },
    '1h9y0ll8': {
      'en': 'Sally Mandrus, viewed your product',
      'de': '',
    },
    '1p9ixhoc': {
      'en': '3m ago',
      'de': '',
    },
    'vms3ncn5': {
      'en': 'New Product View',
      'de': '',
    },
    'lst83mj6': {
      'en': 'Sally Mandrus, viewed your product',
      'de': '',
    },
    'c8tbdppc': {
      'en': '3m ago',
      'de': '',
    },
  },
  // SideNav02
  {
    'z5u1qas6': {
      'en': 'Dashboard',
      'de': '',
    },
    '2we5jmrc': {
      'en': 'Top Level Category',
      'de': '',
    },
    'fee71znv': {
      'en': 'Idea?',
      'de': '',
    },
    'cjcgu5qr': {
      'en': 'Settings',
      'de': '',
    },
    'sxnc57d9': {
      'en': 'Notifications',
      'de': '',
    },
    'lw2pawn8': {
      'en': '12',
      'de': '',
    },
    'oews3mco': {
      'en': 'User',
      'de': '',
    },
    'w9o4lg77': {
      'en': 'Explore',
      'de': '',
    },
    'wwuvsljo': {
      'en': 'Light Mode',
      'de': '',
    },
    'lrhtsgul': {
      'en': 'Dark Mode',
      'de': '',
    },
    'wy6cplds': {
      'en': 'Light Mode',
      'de': '',
    },
    'o8mrpdt7': {
      'en': 'Dark Mode',
      'de': '',
    },
    '9zi2yt2z': {
      'en': 'Logout ',
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
