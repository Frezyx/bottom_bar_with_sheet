import 'dart:async';

class BottomBarWithSheetController {
  BottomBarWithSheetController({required int initialIndex})
      : _selectedIndex = initialIndex;
  final _itemsController = StreamController<int>.broadcast();
  int _selectedIndex;

  Stream<int> get itemsStream => _itemsController.stream;
  int get selectedIndex => _selectedIndex;

  void selectItem(int val) {
    _selectedIndex = val;
  }

  Future<void> close() async {
    await _itemsController.close();
  }
}
