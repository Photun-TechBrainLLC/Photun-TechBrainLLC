import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ja', 'zh_Hans', 'de', 'fr'];

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
    String? jaText = '',
    String? zh_HansText = '',
    String? deText = '',
    String? frText = '',
  }) =>
      [enText, jaText, zh_HansText, deText, frText][languageIndex] ?? '';

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
  // login
  {
    'ihe5l1h3': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'rj4wj696': {
      'en': 'Email Address',
      'de': 'E-Mail-Adresse',
      'fr': 'Adresse e-mail',
      'ja': '電子メールアドレス',
      'zh_Hans': '电子邮件地址',
    },
    '988czchg': {
      'en': 'Enter your email here...',
      'de': 'Gib deine E-Mail hier ein...',
      'fr': 'Entrez votre email ici...',
      'ja': 'あなたのメールアドレスをここに入力してください...',
      'zh_Hans': '在此输入您的电子邮件...',
    },
    '6t9w3bf3': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    '0u24nlfl': {
      'en': 'Enter your email here...',
      'de': 'Gib deine E-Mail hier ein...',
      'fr': 'Entrez votre email ici...',
      'ja': 'あなたのメールアドレスをここに入力してください...',
      'zh_Hans': '在此输入您的电子邮件...',
    },
    'exlq97jh': {
      'en': 'Log In',
      'de': 'Anmeldung',
      'fr': 'Se connecter',
      'ja': 'ログイン',
      'zh_Hans': '登录',
    },
    'g2xxacc3': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'fr': 'Continuer avec Google',
      'ja': 'Google を続ける',
      'zh_Hans': '继续使用谷歌',
    },
    'ela063ou': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
      'ja': 'アカウントを作成する',
      'zh_Hans': '创建账户',
    },
    '2jik9j9k': {
      'en': 'Forgot Password?',
      'de': 'Passwort vergessen?',
      'fr': 'Mot de passe oublié?',
      'ja': 'パスワードをお忘れですか？',
      'zh_Hans': '忘记密码？',
    },
    'n6lzypax': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // createAccount
  {
    'oj0p3s9b': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'tz83muno': {
      'en': 'Please make sure to fill out all fields!',
      'de': 'Bitte füllen Sie unbedingt alle Felder aus!',
      'fr': 'Assurez-vous de remplir tous les champs !',
      'ja': '必ずすべてのフィールドに入力してください。',
      'zh_Hans': '请务必填写所有字段！',
    },
    'qscnciyl': {
      'en': 'Display Name',
      'de': 'Anzeigename',
      'fr': 'Afficher un nom',
      'ja': '表示名',
      'zh_Hans': '显示名称',
    },
    'v6e5tqn2': {
      'en': 'Enter your display name here...',
      'de': 'Geben Sie hier Ihren Anzeigenamen ein...',
      'fr': 'Entrez votre nom d\'affichage ici...',
      'ja': 'ここに表示名を入力してください...',
      'zh_Hans': '在此输入您的显示名称...',
    },
    '7tx2f3oq': {
      'en': 'Email Address',
      'de': 'E-Mail-Adresse',
      'fr': 'Adresse e-mail',
      'ja': '電子メールアドレス',
      'zh_Hans': '电子邮件地址',
    },
    'tgjt6o58': {
      'en': 'Enter your email here...',
      'de': 'Gib deine E-Mail hier ein...',
      'fr': 'Entrez votre email ici...',
      'ja': 'あなたのメールアドレスをここに入力してください...',
      'zh_Hans': '在此输入您的电子邮件...',
    },
    'bma1gpp3': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
      'ja': 'パスワード',
      'zh_Hans': '密码',
    },
    'mcdjs4y6': {
      'en': 'Enter your password here...',
      'de': 'Geben Sie hier Ihr Passwort ein...',
      'fr': 'Entrez votre mot de passe ici...',
      'ja': 'ここにパスワードを入力してください...',
      'zh_Hans': '在此输入您的密码...',
    },
    's0n1lfj9': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'fr': 'Confirmez le mot de passe',
      'ja': 'パスワードを認証する',
      'zh_Hans': '确认密码',
    },
    'mbt4cwoe': {
      'en': 'Enter your password here...',
      'de': 'Geben Sie hier Ihr Passwort ein...',
      'fr': 'Entrez votre mot de passe ici...',
      'ja': 'ここにパスワードを入力してください...',
      'zh_Hans': '在此输入您的密码...',
    },
    'hqjwhgjq': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
      'ja': 'アカウントを作成する',
      'zh_Hans': '创建账户',
    },
    's9hlh7d4': {
      'en': 'Continue with Google',
      'de': 'Weiter mit Google',
      'fr': 'Continuer avec Google',
      'ja': 'Google を続ける',
      'zh_Hans': '继续使用谷歌',
    },
    'gdl7n612': {
      'en': 'Already Have An Account?',
      'de': 'Sie haben bereits ein Konto?',
      'fr': 'Vous avez déjà un compte?',
      'ja': 'すでにアカウントをお持ちですか？',
      'zh_Hans': '已有账户？',
    },
    'q5cipour': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Settings
  {
    'f4cl3oas': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'uthly5hx': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '8wre8314': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    '84vlvhea': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    '5ey79ocd': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'cxz9ba47': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    '482fb3ga': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'yyjwsjwk': {
      'en': 'Conversions',
      'de': 'Konvertierungen',
      'fr': 'Conversions',
      'ja': 'コンバージョン',
      'zh_Hans': '转换',
    },
    'gmnndfxe': {
      'en': 'Support',
      'de': 'Unterstützung',
      'fr': 'Soutien',
      'ja': 'サポート',
      'zh_Hans': '支持',
    },
    'awc17gai': {
      'en': 'Submit a Bug',
      'de': 'Senden Sie einen Fehler',
      'fr': 'Soumettre un bug',
      'ja': 'バグを送信する',
      'zh_Hans': '提交错误',
    },
    '11ccouhj': {
      'en': 'Submit a Feature Request',
      'de': 'Senden Sie eine Funktionsanfrage',
      'fr': 'Soumettre une demande de fonctionnalité',
      'ja': '機能リクエストを送信する',
      'zh_Hans': '提交功能请求',
    },
    'bq352mw9': {
      'en': 'Light ',
      'de': 'Licht',
      'fr': 'Lumière',
      'ja': 'ライト',
      'zh_Hans': '光',
    },
    's30zc0ak': {
      'en': 'Dark',
      'de': 'Dunkel',
      'fr': 'Sombre',
      'ja': '暗い',
      'zh_Hans': '黑暗的',
    },
    '86lcdap1': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'fr': 'Se déconnecter',
      'ja': 'ログアウト',
      'zh_Hans': '登出',
    },
    'qsfjttlf': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'igtdpkn5': {
      'en': '__',
      'de': '__',
      'fr': '__',
      'ja': '__',
      'zh_Hans': '__',
    },
  },
  // Dashboard
  {
    'pzarr7i0': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'rzix7m9j': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '5mlvc9sx': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    'ok5hbe6w': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'eehpiw0s': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'taxkxo66': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    '2wjx8vrm': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'bc2laarz': {
      'en': 'Daily Conversion Analytics:',
      'de': 'Tägliche Conversion-Analyse:',
      'fr': 'Analyses de conversion quotidiennes :',
      'ja': '毎日のコンバージョン分析:',
      'zh_Hans': '每日转化分析：',
    },
    'o9569xsj': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
      'ja': '合計',
      'zh_Hans': '全部的',
    },
    'mla49snr': {
      'en': 'Completed',
      'de': 'Vollendet',
      'fr': 'Complété',
      'ja': '完了',
      'zh_Hans': '完全的',
    },
    'sqrkh29n': {
      'en': 'Working',
      'de': 'Arbeiten',
      'fr': 'Fonctionnement',
      'ja': '働く',
      'zh_Hans': '在职的',
    },
    'kcexma7s': {
      'en': 'Recent Conversions',
      'de': 'Aktuelle Konvertierungen',
      'fr': 'Conversions récentes',
      'ja': '最近のコンバージョン',
      'zh_Hans': '最近的转换',
    },
    'ztzbknzh': {
      'en': 'Priority:',
      'de': 'Priorität:',
      'fr': 'Priorité:',
      'ja': '優先度：',
      'zh_Hans': '优先事项：',
    },
    'tbkk9go2': {
      'en': '1',
      'de': '1',
      'fr': '1',
      'ja': '1',
      'zh_Hans': '1',
    },
    '650lqsh8': {
      'en': 'No recent conversions',
      'de': 'Keine aktuellen Konvertierungen',
      'fr': 'Aucune conversion récente',
      'ja': '最近のコンバージョンはありません',
      'zh_Hans': '最近没有转化',
    },
    'pxtzs6rh': {
      'en': 'Start Converting',
      'de': 'Beginnen Sie mit der Konvertierung',
      'fr': 'Commencer la conversion',
      'ja': '変換の開始',
      'zh_Hans': '开始转换',
    },
    'eu3sokts': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '0r48mgwe': {
      'en': '__',
      'de': '__',
      'fr': '__',
      'ja': '__',
      'zh_Hans': '__',
    },
  },
  // ConversionManager
  {
    'mbth0l8u': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'tgdzdpmp': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    'rxt7ruvk': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    '4a1r5d7j': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'aul5g1bp': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '403ke6aw': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    '7h35h140': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    '4jus3wjg': {
      'en': 'Start New Conversion',
      'de': 'Neue Konvertierung starten',
      'fr': 'Démarrer une nouvelle conversion',
      'ja': '新しい変換を開始',
      'zh_Hans': '开始新的转换',
    },
    'ssj8odjd': {
      'en': 'Filters',
      'de': 'Filter',
      'fr': 'Filtres',
      'ja': 'フィルター',
      'zh_Hans': '过滤器',
    },
    'jwit7y38': {
      'en': 'Complete',
      'de': 'Vollständig',
      'fr': 'Complet',
      'ja': '完了',
      'zh_Hans': '完全的',
    },
    '1beo4kom': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'fr': 'En cours',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    'vyjmht4p': {
      'en': 'Incomplete',
      'de': 'Unvollständig',
      'fr': 'Incomplet',
      'ja': '不完全な',
      'zh_Hans': '不完整',
    },
    'nz4ldjlh': {
      'en': 'All',
      'de': 'Alle',
      'fr': 'Tous',
      'ja': '全て',
      'zh_Hans': '全部',
    },
    'ffml4bw4': {
      'en': 'All',
      'de': 'Alle',
      'fr': 'Tous',
      'ja': '全て',
      'zh_Hans': '全部',
    },
    'gw65om3k': {
      'en': 'Priority: ',
      'de': 'Priorität:',
      'fr': 'Priorité:',
      'ja': '優先度：',
      'zh_Hans': '优先事项：',
    },
    'rl00coh8': {
      'en': 'Model Size: ',
      'de': 'Modellgröße:',
      'fr': 'Taille du modèle :',
      'ja': 'モデルサイズ:',
      'zh_Hans': '型号尺寸：',
    },
    'i4dbaiz1': {
      'en': 'Result Resolution: ',
      'de': 'Ergebnisauflösung:',
      'fr': 'Résolution du résultat :',
      'ja': '結果の解決策:',
      'zh_Hans': '结果分辨率：',
    },
    'ixw007ji': {
      'en': 'Current Status: ',
      'de': 'Aktueller Status:',
      'fr': 'Statut actuel:',
      'ja': '現在のステータス：',
      'zh_Hans': '当前状态：',
    },
    '3x2np4xn': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'dixattxd': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'tb421qn5': {
      'en': 'Team Training Workshop',
      'de': 'Team-Trainings-Workshop',
      'fr': 'Atelier de formation d\'équipe',
      'ja': 'チームトレーニングワークショップ',
      'zh_Hans': '团队培训工作坊',
    },
    'ck4syfdo': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'de':
          'Organisieren Sie einen Schulungsworkshop für das Team, um dessen Fähigkeiten und Wissen zu einem bestimmten Thema zu verbessern. Entwickeln Sie eine Agenda, beschaffen Sie Unterrichtsmaterialien und koordinieren Sie die Logistik. Weisen Sie Trainer zu und überwachen Sie deren Anwesenheit, um einen erfolgreichen Ablauf sicherzustellen.',
      'fr':
          'Organiser un atelier de formation pour l’équipe afin d’améliorer ses compétences et ses connaissances sur un sujet spécifique. Élaborer un agenda, trouver du matériel pédagogique et coordonner la logistique. Désigner des formateurs et surveiller la présence pour assurer la réussite...',
      'ja':
          'チーム向けのトレーニング ワークショップを企画し、特定のトピックに関するスキルと知識を向上させます。議題を作成し、教材を調達し、手配を調整します。トレーナーを割り当て、出席状況を監視して、成功を確実にします...',
      'zh_Hans':
          '为团队组织培训研讨会，以提高他们在特定主题上的技能和知识。制定议程、采购教材并协调后勤工作。分配培训师并监控出勤情况，以确保成功...',
    },
    'nndhfo8h': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'tqonq8ei': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '89jkq1ub': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'hrqw9ab3': {
      'en': 'Budget Planning',
      'de': 'Budgetplanung',
      'fr': 'Planification budgétaire',
      'ja': '予算計画',
      'zh_Hans': '预算规划',
    },
    '6l9wcge9': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'de':
          'Erstellen Sie einen detaillierten Budgetplan für ein bevorstehendes Projekt und berücksichtigen Sie dabei alle relevanten Ausgaben wie Arbeitskosten, Materialien und externe Dienstleistungen. Arbeiten Sie mit dem Finanzteam zusammen, um Genauigkeit und Übereinstimmung mit den gesamten Finanzen sicherzustellen ...',
      'fr':
          'Créez un plan budgétaire détaillé pour un projet à venir, en tenant compte de toutes les dépenses pertinentes, telles que les coûts de main-d\'œuvre, les matériaux et les services externes. Collaborer avec l\'équipe financière pour garantir l\'exactitude et l\'alignement avec les données financières globales...',
      'ja':
          '人件費、資材、外部サービスなどのすべての関連経費を考慮して、今後のプロジェクトの詳細な予算計画を作成します。財務チームと協力して、財務全体の正確性と整合性を確保します。',
      'zh_Hans':
          '为即将进行的项目制定详细的预算计划，考虑所有相关费用，例如劳动力成本、材料和外部服务。与财务团队合作，确保准确性并与整体财务保持一致...',
    },
    '8zyqg7kv': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'efuyi736': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '9h6xehxz': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    '04f8mzwh': {
      'en': 'Client Onboarding Process',
      'de': 'Kunden-Onboarding-Prozess',
      'fr': 'Processus d\'intégration des clients',
      'ja': 'クライアントのオンボーディングプロセス',
      'zh_Hans': '客户入职流程',
    },
    'kzwu9g9g': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'de':
          'Entwickeln Sie einen effizienten Kunden-Onboarding-Prozess, der die Einführung neuer Kunden in die Dienstleistungen des Unternehmens optimiert. Definieren Sie klare Schritte, erstellen Sie notwendige Vorlagen und weisen Sie für jede Aufgabe verantwortliche Teammitglieder zu. Überwachen Sie die Fertigstellung...',
      'fr':
          'Développer un processus d\'intégration des clients efficace qui rationalise l\'introduction de nouveaux clients dans les services de l\'entreprise. Définissez des étapes claires, créez les modèles nécessaires et affectez des membres de l\'équipe responsables pour chaque tâche. Surveiller la réalisation...',
      'ja':
          '会社のサービスへの新規顧客の導入を合理化する、効率的な顧客オンボーディング プロセスを開発します。明確な手順を定義し、必要なテンプレートを作成し、各タスクに責任のあるチーム メンバーを割り当てます。完了を監視します...',
      'zh_Hans':
          '开发高效的客户入职流程，简化新客户对公司服务的介绍。定义清晰的步骤，创建必要的模板，并为每项任务分配负责的团队成员。监控完成情况...',
    },
    '4xg6cn7j': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    '5lhg6h0x': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'af8d911p': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'jzpzlk3p': {
      'en': 'Product Testing',
      'de': 'Produkttest',
      'fr': 'Tests de produits',
      'ja': '製品テスト',
      'zh_Hans': '产品测试',
    },
    '8xkhi08n': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'de':
          'Führen Sie vor der offiziellen Veröffentlichung umfassende Tests eines neuen Produkts durch. Erstellen Sie einen strukturierten Testplan, definieren Sie Testfälle und weisen Sie Teammitgliedern verschiedene Testphasen zu. Während des Tests entdeckte Fehler und Probleme dokumentieren ...',
      'fr':
          'Effectuer des tests complets d’un nouveau produit avant sa sortie officielle. Mettez en place un plan de test structuré, définissez des cas de test et affectez les membres de l\'équipe aux différentes phases de test. Documenter les bogues et les problèmes découverts lors des tests...',
      'ja':
          '新製品の正式リリース前に包括的なテストを実施します。構造化されたテスト計画を設定し、テスト ケースを定義し、さまざまなテスト フェーズにチーム メンバーを割り当てます。テスト中に発見されたバグや問題を文書化します...',
      'zh_Hans':
          '在新产品正式发布之前对其进行全面的测试。制定结构化测试计划，定义测试用例，并为各个测试阶段分配团队成员。记录测试期间发现的错误和问题...',
    },
    'mt82lt07': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'fr': 'En cours',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    '2lufev7k': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '2glm18j5': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'wkjlmp6d': {
      'en': 'Team Training Workshop',
      'de': 'Team-Trainings-Workshop',
      'fr': 'Atelier de formation d\'équipe',
      'ja': 'チームトレーニングワークショップ',
      'zh_Hans': '团队培训工作坊',
    },
    'hld0v3wa': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'de':
          'Organisieren Sie einen Schulungsworkshop für das Team, um dessen Fähigkeiten und Wissen zu einem bestimmten Thema zu verbessern. Entwickeln Sie eine Agenda, beschaffen Sie Unterrichtsmaterialien und koordinieren Sie die Logistik. Weisen Sie Trainer zu und überwachen Sie deren Anwesenheit, um einen erfolgreichen Ablauf sicherzustellen.',
      'fr':
          'Organiser un atelier de formation pour l’équipe afin d’améliorer ses compétences et ses connaissances sur un sujet spécifique. Élaborer un agenda, trouver du matériel pédagogique et coordonner la logistique. Désigner des formateurs et surveiller la présence pour assurer la réussite...',
      'ja':
          'チーム向けのトレーニング ワークショップを企画し、特定のトピックに関するスキルと知識を向上させます。議題を作成し、教材を調達し、手配を調整します。トレーナーを割り当て、出席状況を監視して、トレーニングを確実に成功させます。',
      'zh_Hans':
          '为团队组织培训研讨会，以提高他们在特定主题上的技能和知识。制定议程、采购教材并协调后勤工作。分配培训师并监控出勤情况，以确保成功...',
    },
    'cn3m1fn6': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    '06kp0dyy': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'm1v1mivk': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'm0jxc7o3': {
      'en': 'Budget Planning',
      'de': 'Budgetplanung',
      'fr': 'Planification budgétaire',
      'ja': '予算計画',
      'zh_Hans': '预算规划',
    },
    '7cgy1b4k': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'de':
          'Erstellen Sie einen detaillierten Budgetplan für ein bevorstehendes Projekt und berücksichtigen Sie dabei alle relevanten Ausgaben wie Arbeitskosten, Materialien und externe Dienstleistungen. Arbeiten Sie mit dem Finanzteam zusammen, um Genauigkeit und Übereinstimmung mit den gesamten Finanzen sicherzustellen ...',
      'fr':
          'Créez un plan budgétaire détaillé pour un projet à venir, en tenant compte de toutes les dépenses pertinentes, telles que les coûts de main-d\'œuvre, les matériaux et les services externes. Collaborer avec l\'équipe financière pour garantir l\'exactitude et l\'alignement avec les données financières globales...',
      'ja':
          '人件費、資材、外部サービスなどのすべての関連経費を考慮して、今後のプロジェクトの詳細な予算計画を作成します。財務チームと協力して、財務全体の正確性と整合性を確保します。',
      'zh_Hans':
          '为即将进行的项目制定详细的预算计划，考虑所有相关费用，例如劳动力成本、材料和外部服务。与财务团队合作，确保准确性并与整体财务保持一致...',
    },
    'vl7q50b8': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'e45un5rj': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '7o5tjm0b': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'edtdozek': {
      'en': 'Client Onboarding Process',
      'de': 'Kunden-Onboarding-Prozess',
      'fr': 'Processus d\'intégration des clients',
      'ja': 'クライアントのオンボーディングプロセス',
      'zh_Hans': '客户入职流程',
    },
    'vmzuunub': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'de':
          'Entwickeln Sie einen effizienten Kunden-Onboarding-Prozess, der die Einführung neuer Kunden in die Dienstleistungen des Unternehmens optimiert. Definieren Sie klare Schritte, erstellen Sie notwendige Vorlagen und weisen Sie für jede Aufgabe verantwortliche Teammitglieder zu. Überwachen Sie die Fertigstellung...',
      'fr':
          'Développer un processus d\'intégration des clients efficace qui rationalise l\'introduction de nouveaux clients dans les services de l\'entreprise. Définissez des étapes claires, créez les modèles nécessaires et affectez des membres de l\'équipe responsables pour chaque tâche. Surveiller la réalisation...',
      'ja':
          '会社のサービスへの新規顧客の導入を合理化する、効率的な顧客オンボーディング プロセスを開発します。明確な手順を定義し、必要なテンプレートを作成し、各タスクに責任のあるチーム メンバーを割り当てます。完了を監視します...',
      'zh_Hans':
          '开发高效的客户入职流程，简化新客户对公司服务的介绍。定义明确的步骤，创建必要的模板，并为每项任务分配负责的团队成员。监控完成情况...',
    },
    'xn4f5rcg': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'm4btc16w': {
      'en': 'No Conversions',
      'de': 'Keine Konvertierungen',
      'fr': 'Aucune conversion',
      'ja': '変換なし',
      'zh_Hans': '无转化',
    },
    'lx3m5s7h': {
      'en': 'Start New Conversion',
      'de': 'Neue Konvertierung starten',
      'fr': 'Démarrer une nouvelle conversion',
      'ja': '新しい変換を開始',
      'zh_Hans': '开始新的转换',
    },
    'eyrnfyjy': {
      'en': 'Promotion Manager',
      'de': 'Promotion-Manager',
      'fr': 'Responsable des promotions',
      'ja': 'プロモーションマネージャー',
      'zh_Hans': '推广经理',
    },
    'vjhdaahb': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // NewConversion
  {
    'pfujxpb4': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'mgq11swb': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    '9g0xjakg': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    '41thxa2f': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'mzfq12ez': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '1niaj1yb': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    '0k0cmk3t': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'e7qr4zyq': {
      'en': 'Upload Video',
      'de': 'Video hochladen',
      'fr': 'Télécharger une video',
      'ja': 'ビデオをアップロードする',
      'zh_Hans': '上传视频',
    },
    '5txu737a': {
      'en': 'Conversion Name',
      'de': 'Konvertierungsname',
      'fr': 'Nom de la conversion',
      'ja': '変換名',
      'zh_Hans': '转换名称',
    },
    'owvkamlo': {
      'en': 'Enter a name for the conversion here...',
      'de': 'Geben Sie hier einen Namen für die Konvertierung ein...',
      'fr': 'Entrez ici un nom pour la conversion...',
      'ja': 'ここに変換の名前を入力します...',
      'zh_Hans': '在此输入转换的名称...',
    },
    'xrrgrylz': {
      'en': 'Conversion Description',
      'de': 'Konvertierungsbeschreibung',
      'fr': 'Description des conversions',
      'ja': '変換の説明',
      'zh_Hans': '转换说明',
    },
    '7gssdwgq': {
      'en': 'Enter a description for the conversion here...',
      'de': 'Geben Sie hier eine Beschreibung für die Konvertierung ein...',
      'fr': 'Entrez une description pour la conversion ici...',
      'ja': 'ここに変換の説明を入力してください...',
      'zh_Hans': '在此处输入转换的说明...',
    },
    'uosyai3e': {
      'en': 'Small',
      'de': 'Klein',
      'fr': 'Petit',
      'ja': '小さい',
      'zh_Hans': '小的',
    },
    'hzbpnn9g': {
      'en': 'Medium',
      'de': 'Mittel',
      'fr': 'Moyen',
      'ja': '中くらい',
      'zh_Hans': '中等的',
    },
    'mheygfv5': {
      'en': 'Large',
      'de': 'Groß',
      'fr': 'Grand',
      'ja': '大きい',
      'zh_Hans': '大的',
    },
    'b6i8b7kg': {
      'en': 'Select Model Size',
      'de': 'Wählen Sie Modellgröße',
      'fr': 'Sélectionnez la taille du modèle',
      'ja': 'モデルサイズの選択',
      'zh_Hans': '选择型号尺寸',
    },
    'kl6lrvuj': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'ka85fbfj': {
      'en': '4K',
      'de': '4K',
      'fr': '4K',
      'ja': '4K',
      'zh_Hans': '4K',
    },
    'mcxsv8xq': {
      'en': '1080p',
      'de': '1080p',
      'fr': '1080p',
      'ja': '1080p',
      'zh_Hans': '1080p',
    },
    'cqgfts74': {
      'en': '720p',
      'de': '720p',
      'fr': '720p',
      'ja': '720p',
      'zh_Hans': '720p',
    },
    'kt69mc07': {
      'en': '360p',
      'de': '360p',
      'fr': '360p',
      'ja': '360p',
      'zh_Hans': '360p',
    },
    'l6cc2g8y': {
      'en': 'Select Result Resolution',
      'de': 'Wählen Sie Ergebnisauflösung aus',
      'fr': 'Sélectionnez la résolution du résultat',
      'ja': '結果の解像度を選択します',
      'zh_Hans': '选择结果分辨率',
    },
    'igl29ias': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'c4ewbzwg': {
      'en': 'Conversion Priority Level (1 = low, 10 = high)',
      'de': 'Conversion-Prioritätsstufe (1 = niedrig, 10 = hoch)',
      'fr': 'Niveau de priorité de conversion (1 = faible, 10 = élevé)',
      'ja': '変換優先度レベル (1 = 低、10 = 高)',
      'zh_Hans': '转换优先级（1 = 低，10 = 高）',
    },
    'x36gydsp': {
      'en': 'Start Conversion',
      'de': 'Konvertierung starten',
      'fr': 'Démarrer la conversion',
      'ja': '変換の開始',
      'zh_Hans': '开始转换',
    },
    '5v4y5koj': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
      'ja': '保存',
      'zh_Hans': '节省',
    },
    '95rc5o4t': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '5y73fohh': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'whi2wlx7': {
      'en': 'Product Testing',
      'de': 'Produkttest',
      'fr': 'Tests de produits',
      'ja': '製品テスト',
      'zh_Hans': '产品测试',
    },
    'wcr9y97h': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'de':
          'Führen Sie vor der offiziellen Veröffentlichung umfassende Tests eines neuen Produkts durch. Erstellen Sie einen strukturierten Testplan, definieren Sie Testfälle und weisen Sie Teammitgliedern verschiedene Testphasen zu. Während des Tests entdeckte Fehler und Probleme dokumentieren ...',
      'fr':
          'Effectuer des tests complets d’un nouveau produit avant sa sortie officielle. Mettez en place un plan de test structuré, définissez des cas de test et affectez les membres de l\'équipe aux différentes phases de test. Documenter les bogues et les problèmes découverts lors des tests...',
      'ja':
          '新製品の正式リリース前に包括的なテストを実施します。構造化されたテスト計画を設定し、テスト ケースを定義し、さまざまなテスト フェーズにチーム メンバーを割り当てます。テスト中に発見されたバグや問題を文書化します...',
      'zh_Hans':
          '在新产品正式发布之前对其进行全面的测试。制定结构化测试计划，定义测试用例，并为各个测试阶段分配团队成员。记录测试期间发现的错误和问题...',
    },
    'oodhizur': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'fr': 'En cours',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    'qjkr1s2y': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'fc83mjwd': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'g9o95vay': {
      'en': 'Team Training Workshop',
      'de': 'Team-Trainings-Workshop',
      'fr': 'Atelier de formation d\'équipe',
      'ja': 'チームトレーニングワークショップ',
      'zh_Hans': '团队培训工作坊',
    },
    'nv692hhw': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'de':
          'Organisieren Sie einen Schulungsworkshop für das Team, um dessen Fähigkeiten und Wissen zu einem bestimmten Thema zu verbessern. Entwickeln Sie eine Agenda, beschaffen Sie Unterrichtsmaterialien und koordinieren Sie die Logistik. Weisen Sie Trainer zu und überwachen Sie deren Anwesenheit, um einen erfolgreichen Ablauf sicherzustellen.',
      'fr':
          'Organiser un atelier de formation pour l’équipe afin d’améliorer ses compétences et ses connaissances sur un sujet spécifique. Élaborer un agenda, trouver du matériel pédagogique et coordonner la logistique. Désigner des formateurs et surveiller la présence pour assurer la réussite...',
      'ja':
          'チーム向けのトレーニング ワークショップを企画し、特定のトピックに関するスキルと知識を向上させます。議題を作成し、教材を調達し、手配を調整します。トレーナーを割り当て、出席状況を監視して、成功を確実にします...',
      'zh_Hans':
          '为团队组织培训研讨会，以提高他们在特定主题上的技能和知识。制定议程、采购教材并协调后勤工作。分配培训师并监控出勤情况，以确保成功...',
    },
    'n2dx0oz7': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'r125yb4j': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'n6wds2es': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    '6g1wcfbl': {
      'en': 'Budget Planning',
      'de': 'Budgetplanung',
      'fr': 'Planification budgétaire',
      'ja': '予算計画',
      'zh_Hans': '预算规划',
    },
    'zuyse0pk': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'de':
          'Erstellen Sie einen detaillierten Budgetplan für ein bevorstehendes Projekt und berücksichtigen Sie dabei alle relevanten Ausgaben wie Arbeitskosten, Materialien und externe Dienstleistungen. Arbeiten Sie mit dem Finanzteam zusammen, um Genauigkeit und Übereinstimmung mit den gesamten Finanzen sicherzustellen ...',
      'fr':
          'Créez un plan budgétaire détaillé pour un projet à venir, en tenant compte de toutes les dépenses pertinentes, telles que les coûts de main-d\'œuvre, les matériaux et les services externes. Collaborer avec l\'équipe financière pour garantir l\'exactitude et l\'alignement avec les données financières globales...',
      'ja':
          '人件費、資材、外部サービスなどのすべての関連経費を考慮して、今後のプロジェクトの詳細な予算計画を作成します。財務チームと協力して、財務全体の正確性と整合性を確保します。',
      'zh_Hans':
          '为即将进行的项目制定详细的预算计划，考虑所有相关费用，例如劳动力成本、材料和外部服务。与财务团队合作，确保准确性并与整体财务保持一致...',
    },
    'dqvud1pp': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'ec8sx5xd': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'kuub1e45': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    '54mlwy5n': {
      'en': 'Client Onboarding Process',
      'de': 'Kunden-Onboarding-Prozess',
      'fr': 'Processus d\'intégration des clients',
      'ja': 'クライアントのオンボーディングプロセス',
      'zh_Hans': '客户入职流程',
    },
    'fdf3pl3y': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'de':
          'Entwickeln Sie einen effizienten Kunden-Onboarding-Prozess, der die Einführung neuer Kunden in die Dienstleistungen des Unternehmens optimiert. Definieren Sie klare Schritte, erstellen Sie notwendige Vorlagen und weisen Sie für jede Aufgabe verantwortliche Teammitglieder zu. Überwachen Sie die Fertigstellung...',
      'fr':
          'Développer un processus d\'intégration des clients efficace qui rationalise l\'introduction de nouveaux clients dans les services de l\'entreprise. Définissez des étapes claires, créez les modèles nécessaires et affectez des membres de l\'équipe responsables pour chaque tâche. Surveiller la réalisation...',
      'ja':
          '会社のサービスへの新規顧客の導入を合理化する、効率的な顧客オンボーディング プロセスを開発します。明確な手順を定義し、必要なテンプレートを作成し、各タスクに責任のあるチーム メンバーを割り当てます。完了を監視します...',
      'zh_Hans':
          '开发高效的客户入职流程，简化新客户对公司服务的介绍。定义清晰的步骤，创建必要的模板，并为每项任务分配负责的团队成员。监控完成情况...',
    },
    '3nmfod6d': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'q9wioo3q': {
      'en': 'Promotion Manager',
      'de': 'Promotion-Manager',
      'fr': 'Responsable des promotions',
      'ja': 'プロモーションマネージャー',
      'zh_Hans': '推广经理',
    },
    'rcuo6uws': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // BugSubmission
  {
    '8geysdz1': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'byupjlll': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    'pfnrfo49': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    'lj888lfp': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'a0r3ppz0': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'wp578lun': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    'b37h0dg5': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'kfq9ftiq': {
      'en': 'Create Bug Report',
      'de': 'Fehlerbericht erstellen',
      'fr': 'Créer un rapport de bug',
      'ja': 'バグレポートの作成',
      'zh_Hans': '创建错误报告',
    },
    'bwsj260l': {
      'en': 'Fill out the form below to submit a ticket.',
      'de':
          'Füllen Sie das untenstehende Formular aus, um ein Ticket einzureichen.',
      'fr': 'Remplissez le formulaire ci-dessous pour soumettre un ticket.',
      'ja': 'チケットを送信するには、以下のフォームに記入してください。',
      'zh_Hans': '填写下面的表格以提交票证。',
    },
    '81f8hk98': {
      'en': 'Bug Name...',
      'de': 'Fehlername...',
      'fr': 'Nom du bug...',
      'ja': 'バグ名...',
      'zh_Hans': '错误名称...',
    },
    'vbijyxlt': {
      'en': 'Short Description of what is going on...',
      'de': 'Kurze Beschreibung dessen, was los ist...',
      'fr': 'Brève description de ce qui se passe...',
      'ja': '何が起こっているかの簡単な説明...',
      'zh_Hans': '简短描述正在发生的事情...',
    },
    'qqd1eoot': {
      'en': 'Upload Screenshot',
      'de': 'Screenshot hochladen',
      'fr': 'Télécharger une capture d\'écran',
      'ja': 'スクリーンショットをアップロードする',
      'zh_Hans': '上传截图',
    },
    '6944igve': {
      'en': 'Submit Ticket',
      'de': 'Ticket übermitteln',
      'fr': 'Envoyer le ticket',
      'ja': 'チケットを送信する',
      'zh_Hans': '提交票据',
    },
    'ztt063y2': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'w0qryso8': {
      'en': '__',
      'de': '__',
      'fr': '__',
      'ja': '__',
      'zh_Hans': '__',
    },
  },
  // EditConversion
  {
    '2tqzpisi': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'u3e6pnbp': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    'tzxvmt2f': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    'f9zy9kkc': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'x742sq38': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'nexl68pe': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    'rqupv89a': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'lo76xpxy': {
      'en': 'Upload Video',
      'de': 'Video hochladen',
      'fr': 'Télécharger une video',
      'ja': 'ビデオをアップロードする',
      'zh_Hans': '上传视频',
    },
    'ehw74se5': {
      'en': 'Conversion Name',
      'de': 'Konvertierungsname',
      'fr': 'Nom de la conversion',
      'ja': '変換名',
      'zh_Hans': '转换名称',
    },
    'kymyn6kj': {
      'en': 'Enter a name for the conversion here...',
      'de': 'Geben Sie hier einen Namen für die Konvertierung ein...',
      'fr': 'Entrez ici un nom pour la conversion...',
      'ja': 'ここに変換の名前を入力します...',
      'zh_Hans': '在此输入转换的名称...',
    },
    'gqq428qu': {
      'en': 'Conversion Description',
      'de': 'Konvertierungsbeschreibung',
      'fr': 'Description des conversions',
      'ja': '変換の説明',
      'zh_Hans': '转换说明',
    },
    'i4dgtkeu': {
      'en': 'Enter a description for the conversion here...',
      'de': 'Geben Sie hier eine Beschreibung für die Konvertierung ein...',
      'fr': 'Entrez une description pour la conversion ici...',
      'ja': 'ここに変換の説明を入力してください...',
      'zh_Hans': '在此处输入转换的说明...',
    },
    'v8zruiwi': {
      'en': 'Small',
      'de': 'Klein',
      'fr': 'Petit',
      'ja': '小さい',
      'zh_Hans': '小的',
    },
    'hrl5iq0p': {
      'en': 'Medium',
      'de': 'Mittel',
      'fr': 'Moyen',
      'ja': '中くらい',
      'zh_Hans': '中等的',
    },
    '3yepdqlj': {
      'en': 'Large',
      'de': 'Groß',
      'fr': 'Grand',
      'ja': '大きい',
      'zh_Hans': '大的',
    },
    'gpdjydsx': {
      'en': 'Select Model Size',
      'de': 'Wählen Sie Modellgröße',
      'fr': 'Sélectionnez la taille du modèle',
      'ja': 'モデルサイズの選択',
      'zh_Hans': '选择型号尺寸',
    },
    'wpirod0b': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'p7v6m2em': {
      'en': '4K',
      'de': '4K',
      'fr': '4K',
      'ja': '4K',
      'zh_Hans': '4K',
    },
    '4zxpvkl5': {
      'en': '1080p',
      'de': '1080p',
      'fr': '1080p',
      'ja': '1080p',
      'zh_Hans': '1080p',
    },
    'hlw83ndm': {
      'en': '720p',
      'de': '720p',
      'fr': '720p',
      'ja': '720p',
      'zh_Hans': '720p',
    },
    'axs9ebq1': {
      'en': '360p',
      'de': '360p',
      'fr': '360p',
      'ja': '360p',
      'zh_Hans': '360p',
    },
    'cqlrdbci': {
      'en': 'Select Result Resolution',
      'de': 'Wählen Sie Ergebnisauflösung aus',
      'fr': 'Sélectionnez la résolution du résultat',
      'ja': '結果の解像度を選択します',
      'zh_Hans': '选择结果分辨率',
    },
    'l87etpn6': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'p2ozeyw2': {
      'en': 'Conversion Priority Level (1 = low, 10 = high)',
      'de': 'Conversion-Prioritätsstufe (1 = niedrig, 10 = hoch)',
      'fr': 'Niveau de priorité de conversion (1 = faible, 10 = élevé)',
      'ja': '変換優先度レベル (1 = 低、10 = 高)',
      'zh_Hans': '转换优先级（1 = 低，10 = 高）',
    },
    'd32scavu': {
      'en': 'Start Conversion',
      'de': 'Konvertierung starten',
      'fr': 'Démarrer la conversion',
      'ja': '変換の開始',
      'zh_Hans': '开始转换',
    },
    'lqg8kq1d': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
      'ja': '保存',
      'zh_Hans': '节省',
    },
    'zro8ey1j': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '4v6xbtct': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    '4qhuvosa': {
      'en': 'Product Testing',
      'de': 'Produkttest',
      'fr': 'Tests de produits',
      'ja': '製品テスト',
      'zh_Hans': '产品测试',
    },
    'djsouy1l': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'de':
          'Führen Sie vor der offiziellen Veröffentlichung umfassende Tests eines neuen Produkts durch. Erstellen Sie einen strukturierten Testplan, definieren Sie Testfälle und weisen Sie Teammitgliedern verschiedene Testphasen zu. Während des Tests entdeckte Fehler und Probleme dokumentieren ...',
      'fr':
          'Effectuer des tests complets d’un nouveau produit avant sa sortie officielle. Mettez en place un plan de test structuré, définissez des cas de test et affectez les membres de l\'équipe aux différentes phases de test. Documenter les bogues et les problèmes découverts lors des tests...',
      'ja':
          '新製品の正式リリース前に包括的なテストを実施します。構造化されたテスト計画を設定し、テスト ケースを定義し、さまざまなテスト フェーズにチーム メンバーを割り当てます。テスト中に発見されたバグや問題を文書化します...',
      'zh_Hans':
          '在新产品正式发布之前对其进行全面的测试。制定结构化测试计划，定义测试用例，并为各个测试阶段分配团队成员。记录测试期间发现的错误和问题...',
    },
    'wmu067nj': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'fr': 'En cours',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    '8hf9we1s': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '8qjub9zq': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    '0n0u94v2': {
      'en': 'Team Training Workshop',
      'de': 'Team-Trainings-Workshop',
      'fr': 'Atelier de formation d\'équipe',
      'ja': 'チームトレーニングワークショップ',
      'zh_Hans': '团队培训工作坊',
    },
    'gc6zo9n3': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'de':
          'Organisieren Sie einen Schulungsworkshop für das Team, um dessen Fähigkeiten und Wissen zu einem bestimmten Thema zu verbessern. Entwickeln Sie eine Agenda, beschaffen Sie Unterrichtsmaterialien und koordinieren Sie die Logistik. Weisen Sie Trainer zu und überwachen Sie deren Anwesenheit, um einen erfolgreichen Ablauf sicherzustellen.',
      'fr':
          'Organiser un atelier de formation pour l’équipe afin d’améliorer ses compétences et ses connaissances sur un sujet spécifique. Élaborer un agenda, trouver du matériel pédagogique et coordonner la logistique. Désigner des formateurs et surveiller la présence pour assurer la réussite...',
      'ja':
          'チーム向けのトレーニング ワークショップを企画し、特定のトピックに関するスキルと知識を向上させます。議題を作成し、教材を調達し、手配を調整します。トレーナーを割り当て、出席状況を監視して、成功を確実にします...',
      'zh_Hans':
          '为团队组织培训研讨会，以提高他们在特定主题上的技能和知识。制定议程、采购教材并协调后勤工作。分配培训师并监控出勤情况，以确保成功...',
    },
    '4nb4lfgu': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'fdr7ygbf': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '2ut5tm9r': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'g8snuvxu': {
      'en': 'Budget Planning',
      'de': 'Budgetplanung',
      'fr': 'Planification budgétaire',
      'ja': '予算計画',
      'zh_Hans': '预算规划',
    },
    'pmxhqzto': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'de':
          'Erstellen Sie einen detaillierten Budgetplan für ein bevorstehendes Projekt und berücksichtigen Sie dabei alle relevanten Ausgaben wie Arbeitskosten, Materialien und externe Dienstleistungen. Arbeiten Sie mit dem Finanzteam zusammen, um Genauigkeit und Übereinstimmung mit den gesamten Finanzen sicherzustellen ...',
      'fr':
          'Créez un plan budgétaire détaillé pour un projet à venir, en tenant compte de toutes les dépenses pertinentes, telles que les coûts de main-d\'œuvre, les matériaux et les services externes. Collaborer avec l\'équipe financière pour garantir l\'exactitude et l\'alignement avec les données financières globales...',
      'ja':
          '人件費、資材、外部サービスなどのすべての関連経費を考慮して、今後のプロジェクトの詳細な予算計画を作成します。財務チームと協力して、財務全体の正確性と整合性を確保します。',
      'zh_Hans':
          '为即将进行的项目制定详细的预算计划，考虑所有相关费用，例如劳动力成本、材料和外部服务。与财务团队合作，确保准确性并与整体财务保持一致...',
    },
    'hi44sd82': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'nwolpvq0': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'mhu72ire': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'mno7f773': {
      'en': 'Client Onboarding Process',
      'de': 'Kunden-Onboarding-Prozess',
      'fr': 'Processus d\'intégration des clients',
      'ja': 'クライアントのオンボーディングプロセス',
      'zh_Hans': '客户入职流程',
    },
    '8c2qzff1': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'de':
          'Entwickeln Sie einen effizienten Kunden-Onboarding-Prozess, der die Einführung neuer Kunden in die Dienstleistungen des Unternehmens optimiert. Definieren Sie klare Schritte, erstellen Sie notwendige Vorlagen und weisen Sie für jede Aufgabe verantwortliche Teammitglieder zu. Überwachen Sie die Fertigstellung...',
      'fr':
          'Développer un processus d\'intégration des clients efficace qui rationalise l\'introduction de nouveaux clients dans les services de l\'entreprise. Définissez des étapes claires, créez les modèles nécessaires et affectez des membres de l\'équipe responsables pour chaque tâche. Surveiller la réalisation...',
      'ja':
          '会社のサービスへの新規顧客の導入を合理化する、効率的な顧客オンボーディング プロセスを開発します。明確な手順を定義し、必要なテンプレートを作成し、各タスクに責任のあるチーム メンバーを割り当てます。完了を監視します...',
      'zh_Hans':
          '开发高效的客户入职流程，简化新客户对公司服务的介绍。定义清晰的步骤，创建必要的模板，并为每项任务分配负责的团队成员。监控完成情况...',
    },
    '0klndwv0': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'tgtimtow': {
      'en': 'Promotion Manager',
      'de': 'Promotion-Manager',
      'fr': 'Responsable des promotions',
      'ja': 'プロモーションマネージャー',
      'zh_Hans': '推广经理',
    },
    'yn7qgcx8': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // FeatureRequestSubmission
  {
    '68s6upc9': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    '3cknhsqr': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    'yj23epo2': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    'gkaojamk': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    'wsf6bwyr': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'kt4rh9ft': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    '55h6becw': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'acki9s4v': {
      'en': 'Create Feature Request',
      'de': 'Funktionsanfrage erstellen',
      'fr': 'Créer une demande de fonctionnalité',
      'ja': '機能リクエストの作成',
      'zh_Hans': '创建功能请求',
    },
    'ffettqsp': {
      'en':
          'We care about your opinion, fill out the form below to suggest features for the next update!',
      'de':
          'Ihre Meinung ist uns wichtig. Füllen Sie das Formular unten aus, um Funktionen für das nächste Update vorzuschlagen!',
      'fr':
          'Nous nous soucions de votre avis, remplissez le formulaire ci-dessous pour suggérer des fonctionnalités pour la prochaine mise à jour !',
      'ja': '皆様のご意見をお待ちしております。次のアップデートの機能を提案するには、以下のフォームに記入してください。',
      'zh_Hans': '我们关心您的意见，请填写下面的表格，为下次更新提出建议！',
    },
    'dyxsc5yn': {
      'en': 'Feature Name...',
      'de': 'Funktionsname...',
      'fr': 'Nom de la fonctionnalité...',
      'ja': '機能名...',
      'zh_Hans': '功能名称...',
    },
    'sqzanbs1': {
      'en': 'Feature Description...',
      'de': 'Funktionsbeschreibung...',
      'fr': 'Description de fonctionnalité...',
      'ja': '機能の説明...',
      'zh_Hans': '功能描述...',
    },
    'ro9c3oqh': {
      'en': 'Submit Feature Request',
      'de': 'Senden Sie eine Funktionsanfrage',
      'fr': 'Soumettre une demande de fonctionnalité',
      'ja': '機能リクエストを送信する',
      'zh_Hans': '提交功能请求',
    },
    'zqb62gl3': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'pyhhyu89': {
      'en': '__',
      'de': '__',
      'fr': '__',
      'ja': '__',
      'zh_Hans': '__',
    },
  },
  // CompletedConversion
  {
    'a97138lr': {
      'en': 'Photun',
      'de': 'Photun',
      'fr': 'Photon',
      'ja': 'フォトン',
      'zh_Hans': '福敦',
    },
    'c9nexc5t': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
      'ja': 'ダッシュボード',
      'zh_Hans': '仪表板',
    },
    'luemkpp5': {
      'en': 'Manage Conversions',
      'de': 'Konvertierungen verwalten',
      'fr': 'Gérer les conversions',
      'ja': 'コンバージョンの管理',
      'zh_Hans': '管理转化',
    },
    'fy7rnn2f': {
      'en': 'New Conversion',
      'de': 'Neue Konvertierung',
      'fr': 'Nouvelle conversion',
      'ja': '新しい変換',
      'zh_Hans': '新转换',
    },
    '47chy0yr': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'fr': 'Paramètres',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    'zd5rvswz': {
      'en': 'Light Mode',
      'de': 'Lichtmodus',
      'fr': 'Mode lumière',
      'ja': 'ライトモード',
      'zh_Hans': '灯光模式',
    },
    'eiwe4lbl': {
      'en': 'Dark Mode',
      'de': 'Dunkler Modus',
      'fr': 'Mode sombre',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
    },
    'd7crrty5': {
      'en': 'Your converted video will appear here once completed',
      'de': 'Ihr konvertiertes Video wird hier angezeigt, sobald es fertig ist',
      'fr': 'Votre vidéo convertie apparaîtra ici une fois terminée',
      'ja': '変換されたビデオは完了するとここに表示されます',
      'zh_Hans': '完成后，您转换的视频将显示在此处',
    },
    'wdbjvpxj': {
      'en': 'Conversion Name',
      'de': 'Konvertierungsname',
      'fr': 'Nom de la conversion',
      'ja': '変換名',
      'zh_Hans': '转换名称',
    },
    'n78hix6j': {
      'en': 'Enter a name for the conversion here...',
      'de': 'Geben Sie hier einen Namen für die Konvertierung ein...',
      'fr': 'Entrez ici un nom pour la conversion...',
      'ja': 'ここに変換の名前を入力します...',
      'zh_Hans': '在此输入转换的名称...',
    },
    'gwp31hd6': {
      'en': 'Conversion Description',
      'de': 'Konvertierungsbeschreibung',
      'fr': 'Description des conversions',
      'ja': '変換の説明',
      'zh_Hans': '转换说明',
    },
    'fijebhxw': {
      'en': 'Enter a description for the conversion here...',
      'de': 'Geben Sie hier eine Beschreibung für die Konvertierung ein...',
      'fr': 'Entrez une description pour la conversion ici...',
      'ja': 'ここに変換の説明を入力してください...',
      'zh_Hans': '在此处输入转换的说明...',
    },
    'e8l9lyi8': {
      'en': 'Small',
      'de': 'Klein',
      'fr': 'Petit',
      'ja': '小さい',
      'zh_Hans': '小的',
    },
    '1dys4518': {
      'en': 'Medium',
      'de': 'Mittel',
      'fr': 'Moyen',
      'ja': '中くらい',
      'zh_Hans': '中等的',
    },
    'majduls5': {
      'en': 'Large',
      'de': 'Groß',
      'fr': 'Grand',
      'ja': '大きい',
      'zh_Hans': '大的',
    },
    'mvkh0nn0': {
      'en': 'Select Model Size',
      'de': 'Wählen Sie Modellgröße',
      'fr': 'Sélectionnez la taille du modèle',
      'ja': 'モデルサイズの選択',
      'zh_Hans': '选择型号尺寸',
    },
    '2oy5xvok': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'sdq26t29': {
      'en': '4K',
      'de': '4K',
      'fr': '4K',
      'ja': '4K',
      'zh_Hans': '4K',
    },
    'm6iryckp': {
      'en': '1080p',
      'de': '1080p',
      'fr': '1080p',
      'ja': '1080p',
      'zh_Hans': '1080p',
    },
    'amlm2ont': {
      'en': '720p',
      'de': '720p',
      'fr': '720p',
      'ja': '720p',
      'zh_Hans': '720p',
    },
    'i37m7fbx': {
      'en': '360p',
      'de': '360p',
      'fr': '360p',
      'ja': '360p',
      'zh_Hans': '360p',
    },
    'm0y7t975': {
      'en': 'Select Result Resolution',
      'de': 'Wählen Sie Ergebnisauflösung aus',
      'fr': 'Sélectionnez la résolution du résultat',
      'ja': '結果の解像度を選択します',
      'zh_Hans': '选择结果分辨率',
    },
    'kq7qx3yv': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
      'ja': 'アイテムを検索...',
      'zh_Hans': '搜索一个项目...',
    },
    'hva019r6': {
      'en': 'Conversion Priority Level (1 = low, 10 = high)',
      'de': 'Conversion-Prioritätsstufe (1 = niedrig, 10 = hoch)',
      'fr': 'Niveau de priorité de conversion (1 = faible, 10 = élevé)',
      'ja': '変換優先度レベル (1 = 低、10 = 高)',
      'zh_Hans': '转换优先级（1 = 低，10 = 高）',
    },
    'nsnirpqe': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'i5shv97t': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'cy6xpkm7': {
      'en': 'Product Testing',
      'de': 'Produkttest',
      'fr': 'Tests de produits',
      'ja': '製品テスト',
      'zh_Hans': '产品测试',
    },
    'e050d3ea': {
      'en':
          'Conduct comprehensive testing of a new product before its official release. Set up a structured testing plan, define test cases, and assign team members for various testing phases. Document bugs and issues discovered during testing...',
      'de':
          'Führen Sie vor der offiziellen Veröffentlichung umfassende Tests eines neuen Produkts durch. Erstellen Sie einen strukturierten Testplan, definieren Sie Testfälle und weisen Sie Teammitgliedern verschiedene Testphasen zu. Während des Tests entdeckte Fehler und Probleme dokumentieren ...',
      'fr':
          'Effectuer des tests complets d’un nouveau produit avant sa sortie officielle. Mettez en place un plan de test structuré, définissez des cas de test et affectez les membres de l\'équipe aux différentes phases de test. Documenter les bogues et les problèmes découverts lors des tests...',
      'ja':
          '新製品の正式リリース前に包括的なテストを実施します。構造化されたテスト計画を設定し、テスト ケースを定義し、さまざまなテスト フェーズにチーム メンバーを割り当てます。テスト中に発見されたバグや問題を文書化します...',
      'zh_Hans':
          '在新产品正式发布之前对其进行全面的测试。制定结构化测试计划，定义测试用例，并为各个测试阶段分配团队成员。记录测试期间发现的错误和问题...',
    },
    '6clluq5i': {
      'en': 'In Progress',
      'de': 'Im Gange',
      'fr': 'En cours',
      'ja': '進行中',
      'zh_Hans': '进行中',
    },
    '3l0xr832': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'ivrx1owm': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'bjmbrmrs': {
      'en': 'Team Training Workshop',
      'de': 'Team-Trainings-Workshop',
      'fr': 'Atelier de formation d\'équipe',
      'ja': 'チームトレーニングワークショップ',
      'zh_Hans': '团队培训工作坊',
    },
    '1eybmk8l': {
      'en':
          'Organize a training workshop for the team to enhance their skills and knowledge on a specific topic. Develop an agenda, source teaching materials, and coordinate logistics. Assign trainers and monitor attendance to ensure a successful...',
      'de':
          'Organisieren Sie einen Schulungsworkshop für das Team, um dessen Fähigkeiten und Wissen zu einem bestimmten Thema zu verbessern. Entwickeln Sie eine Agenda, beschaffen Sie Unterrichtsmaterialien und koordinieren Sie die Logistik. Weisen Sie Trainer zu und überwachen Sie deren Anwesenheit, um einen erfolgreichen Ablauf sicherzustellen.',
      'fr':
          'Organiser un atelier de formation pour l’équipe afin d’améliorer ses compétences et ses connaissances sur un sujet spécifique. Élaborer un agenda, trouver du matériel pédagogique et coordonner la logistique. Désigner des formateurs et surveiller la présence pour assurer la réussite...',
      'ja':
          'チーム向けのトレーニング ワークショップを企画し、特定のトピックに関するスキルと知識を向上させます。議題を作成し、教材を調達し、手配を調整します。トレーナーを割り当て、出席状況を監視して、成功を確実にします...',
      'zh_Hans':
          '为团队组织培训研讨会，以提高他们在特定主题上的技能和知识。制定议程、采购教材并协调后勤工作。分配培训师并监控出勤情况，以确保成功...',
    },
    'krclfl6k': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'nx4e0seq': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    'uh6mz97q': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'rkyjovgo': {
      'en': 'Budget Planning',
      'de': 'Budgetplanung',
      'fr': 'Planification budgétaire',
      'ja': '予算計画',
      'zh_Hans': '预算规划',
    },
    'gw2xswyz': {
      'en':
          'Create a detailed budget plan for an upcoming project, considering all relevant expenses, such as labor costs, materials, and external services. Collaborate with the finance team to ensure accuracy and alignment with overall financial...',
      'de':
          'Erstellen Sie einen detaillierten Budgetplan für ein bevorstehendes Projekt und berücksichtigen Sie dabei alle relevanten Ausgaben wie Arbeitskosten, Materialien und externe Dienstleistungen. Arbeiten Sie mit dem Finanzteam zusammen, um Genauigkeit und Übereinstimmung mit den gesamten Finanzen sicherzustellen ...',
      'fr':
          'Créez un plan budgétaire détaillé pour un projet à venir, en tenant compte de toutes les dépenses pertinentes, telles que les coûts de main-d\'œuvre, les matériaux et les services externes. Collaborer avec l\'équipe financière pour garantir l\'exactitude et l\'alignement avec les données financières globales...',
      'ja':
          '人件費、資材、外部サービスなどのすべての関連経費を考慮して、今後のプロジェクトの詳細な予算計画を作成します。財務チームと協力して、財務全体の正確性と整合性を確保します。',
      'zh_Hans':
          '为即将进行的项目制定详细的预算计划，考虑所有相关费用，例如劳动力成本、材料和外部服务。与财务团队合作，确保准确性并与整体财务保持一致...',
    },
    '8vc7ctrg': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'vmyz2a2g': {
      'en': 'ID#: ',
      'de': 'AUSWEIS#:',
      'fr': 'IDENTIFIANT#:',
      'ja': 'ID番号:',
      'zh_Hans': 'ID＃：',
    },
    '49omh27j': {
      'en': '429242424',
      'de': '429242424',
      'fr': '429242424',
      'ja': '429242424',
      'zh_Hans': '429242424',
    },
    'dpftk1jv': {
      'en': 'Client Onboarding Process',
      'de': 'Kunden-Onboarding-Prozess',
      'fr': 'Processus d\'intégration des clients',
      'ja': 'クライアントのオンボーディングプロセス',
      'zh_Hans': '客户入职流程',
    },
    '0e16lk7x': {
      'en':
          'Develop an efficient client onboarding process that streamlines the introduction of new clients to the company\'s services. Define clear steps, create necessary templates, and assign responsible team members for each task. Monitor the completion...',
      'de':
          'Entwickeln Sie einen effizienten Kunden-Onboarding-Prozess, der die Einführung neuer Kunden in die Dienstleistungen des Unternehmens optimiert. Definieren Sie klare Schritte, erstellen Sie notwendige Vorlagen und weisen Sie für jede Aufgabe verantwortliche Teammitglieder zu. Überwachen Sie die Fertigstellung...',
      'fr':
          'Développer un processus d\'intégration des clients efficace qui rationalise l\'introduction de nouveaux clients dans les services de l\'entreprise. Définissez des étapes claires, créez les modèles nécessaires et affectez des membres de l\'équipe responsables pour chaque tâche. Surveiller la réalisation...',
      'ja':
          '会社のサービスへの新規顧客の導入を合理化する、効率的な顧客オンボーディング プロセスを開発します。明確な手順を定義し、必要なテンプレートを作成し、各タスクに責任のあるチーム メンバーを割り当てます。完了を監視します...',
      'zh_Hans':
          '开发高效的客户入职流程，简化新客户对公司服务的介绍。定义明确的步骤，创建必要的模板，并为每项任务分配负责的团队成员。监控完成情况...',
    },
    '57ozjw1t': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'gsnjmv4x': {
      'en': 'Promotion Manager',
      'de': 'Promotion-Manager',
      'fr': 'Responsable des promotions',
      'ja': 'プロモーションマネージャー',
      'zh_Hans': '推广经理',
    },
    '9ug16mvf': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // ConversionDeletionSheet
  {
    'fui7eay8': {
      'en': 'Are you sure you want to delete this conversion?',
      'de': 'Möchten Sie diese Konvertierung wirklich löschen?',
      'fr': 'Êtes-vous sûr de vouloir supprimer cette conversion ?',
      'ja': 'この変換を削除してもよろしいですか?',
      'zh_Hans': '您确定要删除此转换吗？',
    },
    'e834vngk': {
      'en': 'Delete Conversion',
      'de': 'Konvertierung löschen',
      'fr': 'Supprimer la conversion',
      'ja': '変換の削除',
      'zh_Hans': '删除转化',
    },
    'm88esa9e': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
      'ja': 'キャンセル',
      'zh_Hans': '取消',
    },
  },
  // PuchaseCredits
  {
    'gz3368pr': {
      'en': 'Choose a Photun plan',
      'de': 'Wählen Sie einen Photun-Plan',
      'fr': 'Choisissez un forfait Photon',
      'ja': 'フォトンプランを選ぶ',
      'zh_Hans': '选择 Photun 计划',
    },
    'kjl5ip38': {
      'en': 'Standard',
      'de': 'Standard',
      'fr': 'Standard',
      'ja': '標準',
      'zh_Hans': '标准',
    },
    'q2kimocd': {
      'en': '\$99.99',
      'de': '99,99 \$',
      'fr': '99,99 \$',
      'ja': '\$99.99',
      'zh_Hans': '99.99 美元',
    },
    'w3eqnd7c': {
      'en': '/month',
      'de': '/Monat',
      'fr': '/mois',
      'ja': '/月',
      'zh_Hans': '/月',
    },
    'puabtqde': {
      'en': '300 Credits per Month',
      'de': '300 Credits pro Monat',
      'fr': '300 crédits par mois',
      'ja': '1 か月あたり 300 クレジット',
      'zh_Hans': '每月 300 个积分',
    },
    'w20cxgj9': {
      'en': 'Dedicated Personal Server',
      'de': 'Dedizierter persönlicher Server',
      'fr': 'Serveur personnel dédié',
      'ja': '専用パーソナルサーバー',
      'zh_Hans': '专用个人服务器',
    },
    '63dlqmbl': {
      'en': 'Up to 1080p upscaling',
      'de': 'Bis zu 1080p-Upscaling',
      'fr': 'Mise à l\'échelle jusqu\'à 1080p',
      'ja': '最大1080pのアップスケーリング',
      'zh_Hans': '高达 1080p 升级',
    },
    '51v4v2i5': {
      'en': '100 GB Storage Space',
      'de': '100 GB Speicherplatz',
      'fr': '100 Go d\'espace de stockage',
      'ja': '100GBのストレージスペース',
      'zh_Hans': '100GB存储空间',
    },
    'q7ysmpen': {
      'en': '24/7 Support',
      'de': '24/7-Support',
      'fr': 'Assistance 24h/24 et 7j/7',
      'ja': '年中無休のサポート',
      'zh_Hans': '24/7 支持',
    },
    '5jjcdq6e': {
      'en': 'Upgrade To Standard',
      'de': 'Upgrade auf Standard',
      'fr': 'Mise à niveau vers la norme',
      'ja': '標準にアップグレード',
      'zh_Hans': '升级至标准',
    },
    'd6fae1kc': {
      'en': 'Pro',
      'de': 'Profi',
      'fr': 'Pro',
      'ja': 'プロ',
      'zh_Hans': '专业版',
    },
    'npned9iu': {
      'en': '\$199.99',
      'de': '199,99 \$',
      'fr': '199,99 \$',
      'ja': '\$199.99',
      'zh_Hans': '199.99 美元',
    },
    'net1s3q5': {
      'en': '/month',
      'de': '/Monat',
      'fr': '/mois',
      'ja': '/月',
      'zh_Hans': '/月',
    },
    'yg2hhpt6': {
      'en': '800 Credits per Month',
      'de': '800 Credits pro Monat',
      'fr': '800 crédits par mois',
      'ja': '1 か月あたり 800 クレジット',
      'zh_Hans': '每月 800 个学分',
    },
    'ihkw6ot5': {
      'en': 'Dedicated Personal Server',
      'de': 'Dedizierter persönlicher Server',
      'fr': 'Serveur personnel dédié',
      'ja': '専用パーソナルサーバー',
      'zh_Hans': '专用个人服务器',
    },
    'oodn4gsa': {
      'en': 'Up to 4K upscaling',
      'de': 'Bis zu 4K-Upscaling',
      'fr': 'Mise à l\'échelle jusqu\'à 4K',
      'ja': '最大4Kアップスケーリング',
      'zh_Hans': '高达 4K 升级',
    },
    'bjx08q4h': {
      'en': 'Custom Model Creation',
      'de': 'Benutzerdefinierte Modellerstellung',
      'fr': 'Création de modèles personnalisés',
      'ja': 'カスタムモデルの作成',
      'zh_Hans': '自定义模型创建',
    },
    'kilvobv7': {
      'en': '500 GB Storage Space',
      'de': '500 GB Speicherplatz',
      'fr': '500 Go d\'espace de stockage',
      'ja': '500GBのストレージスペース',
      'zh_Hans': '500GB存储空间',
    },
    'gxpu7h9l': {
      'en': '24/7 Support',
      'de': '24/7-Support',
      'fr': 'Assistance 24h/24 et 7j/7',
      'ja': '年中無休のサポート',
      'zh_Hans': '24/7 支持',
    },
    'b8ghk5g9': {
      'en': 'Upgrade to Pro',
      'de': 'Upgrade auf Pro',
      'fr': 'Passer à Pro',
      'ja': 'プロ仕様にアップグレードする',
      'zh_Hans': '升级到专业版',
    },
  },
  // BugTickedSubmitted
  {
    '01abrtgn': {
      'en':
          'Thank you for reaching out to us! We\'ve successfully received your bug report and appreciate you taking the time to help us improve our services. Our team is now reviewing the details of your report and will be in touch with a solution or further questions as quickly as possible.',
      'de':
          'Vielen Dank, dass Sie sich an uns gewandt haben! Wir haben Ihren Fehlerbericht erfolgreich erhalten und freuen uns, dass Sie sich die Zeit genommen haben, uns bei der Verbesserung unserer Dienste zu helfen. Unser Team prüft nun die Details Ihrer Meldung und wird sich schnellstmöglich mit einer Lösung oder weiteren Fragen bei Ihnen melden.',
      'fr':
          'Merci de nous avoir contactés ! Nous avons bien reçu votre rapport de bug et apprécions que vous preniez le temps de nous aider à améliorer nos services. Notre équipe examine actuellement les détails de votre rapport et vous contactera dans les plus brefs délais pour vous proposer une solution ou d\'autres questions.',
      'ja':
          'お問い合わせいただきありがとうございます。バグレポートを無事に受け取りました。サービスの向上にご協力いただきありがとうございます。現在、私たちのチームがご報告の詳細を検討しており、解決策やさらなる質問についてできるだけ早くご連絡させていただきます。',
      'zh_Hans':
          '感谢您与我们联系！我们已成功收到您的错误报告，感谢您花时间帮助我们改进我们的服务。我们的团队现在正在审查您报告的详细信息，并将尽快联系解决方案或进一步的问题。',
    },
    'kbgigepp': {
      'en': 'Back To Dashboard',
      'de': 'Zurück zum Dashboard',
      'fr': 'Retour au tableau de bord',
      'ja': 'ダッシュボードに戻る',
      'zh_Hans': '返回仪表板',
    },
  },
  // FeatureRequestSubmitted
  {
    'vzh8lyax': {
      'en':
          'Thank you for reaching out to us! We\'ve successfully received your feature request and appreciate you taking the time to help us improve our services.',
      'de':
          'Vielen Dank, dass Sie sich an uns gewandt haben! Wir haben Ihre Funktionsanfrage erfolgreich erhalten und freuen uns, dass Sie sich die Zeit genommen haben, uns bei der Verbesserung unserer Dienste zu helfen.',
      'fr':
          'Merci de nous avoir contactés ! Nous avons reçu avec succès votre demande de fonctionnalité et apprécions que vous ayez pris le temps de nous aider à améliorer nos services.',
      'ja':
          'お問い合わせいただきありがとうございます。機能リクエストを無事に受け取りました。サービスの向上にご協力いただきありがとうございます。',
      'zh_Hans': '感谢您与我们联系！我们已成功收到您的功能请求，感谢您花时间帮助我们改进服务。',
    },
    '6yhsxfbm': {
      'en': 'Back To Dashboard',
      'de': 'Zurück zum Dashboard',
      'fr': 'Retour au tableau de bord',
      'ja': 'ダッシュボードに戻る',
      'zh_Hans': '返回仪表板',
    },
  },
  // Miscellaneous
  {
    'm0u324wn': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'v1rs9kg0': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ped9tuae': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y8r56ri2': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'y5hb71qf': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'slc8jgub': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '76dm5fyn': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'f6p4t9t3': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd60bivka': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'h61e6lvh': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wmtcei8v': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '38sb662e': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'pi5l7gj2': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'jlnic9kv': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ynoy56ar': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'n0ckczwn': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'n5a5t93n': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '6vxsf039': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '5zvaonvp': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'neqwlr7o': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mj70l85v': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'apss1b3k': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'mowovcvu': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'awo4syrr': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '019r86d8': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'v1tbr4zv': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'du3mk7q8': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wj0506tb': {
      'en': '',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
