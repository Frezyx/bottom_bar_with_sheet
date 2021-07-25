import 'dart:async';

class BottomBarWithSheetController {
  BottomBarWithSheetController({
    required int initialIndex,
    this.onItemSelect,
  }) : _selectedIndex = initialIndex;
  final _itemsController = StreamController<int>.broadcast();

  Function(int)? onItemSelect;
  int _selectedIndex;

  Stream<int> get itemsStream => _itemsController.stream;
  int get selectedIndex => _selectedIndex;

  void selectItem(int val) {
    _selectedIndex = val;
    _itemsController.add(val);
    if (onItemSelect != null) {
      onItemSelect!(val);
    }
  }

  Future<void> close() async {
    await _itemsController.close();
  }
}
