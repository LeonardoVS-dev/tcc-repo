
class Processos {
  Processos(
    {
    required this.id,
    required this.data,
    required this.descricao,
    this.isExpanded = false,
  });

  int id;
  var data;
  String descricao;
  bool isExpanded = false;

  static List<Processos> generateItems(int numberOfItems) {
    return List<Processos>.generate(numberOfItems, (int index) {
      return Processos(
        id: index + 1,
        data: 'XX/XX',
        descricao: 'Processo ${index + 1}'
      );
    });
  }
}