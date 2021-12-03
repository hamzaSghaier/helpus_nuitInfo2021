class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇫🇷", "Français", "fr"),
      Language(2, "🇬🇧", "UK.English", "en"),
      Language(3, "🇺🇸", "US.English", "us"),
      //Language(4, "🇦🇺", "AUS.English", "au"),
      Language(5, "🇪🇸", "Español", "es"),
      Language(6, "🇹🇳", " العربية", "ar"),
    ];
  }
}
