class MenuController<T> {
  final List<T> items;
  String _itemTextSelected = '';

  get itemTextSelected => _itemTextSelected;
  MenuController({required this.items});

  void itemSelected(String value) {
    _itemTextSelected = value;
  }
}
