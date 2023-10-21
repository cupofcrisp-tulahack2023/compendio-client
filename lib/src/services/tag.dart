class TagService {
  final List<String> tags = [
    "Физика",
    "Математика",
    "Информатика",
    "Начинающий уровень",
    "Продвинутый уровень",
    "Биология",
    "Анатомия",
    "Астрономия",
    "Программирование",
    "Музыка",
    "Кожевничество",
    "Кузнечное дело",
  ];

  Future<List<String>> getTags() async {
    return Future.delayed(const Duration(seconds: 1), () => tags);
  }
}
