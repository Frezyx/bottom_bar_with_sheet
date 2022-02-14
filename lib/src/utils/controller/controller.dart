import 'dart:async';

class BottomBarWithSheetController {
  BottomBarWithSheetController({
    required int initialIndex,
    bool sheetOpened = false,
    this.onItemSelect,
  })  : _selectedIndex = initialIndex,
        _sheetOpened = sheetOpened;
  final _itemsController = StreamController<int>.broadcast();
  final _bottomSheetController = StreamController<bool>.broadcast();

  Function(int)? onItemSelect;
  int _selectedIndex;
  bool _sheetOpened;

  Stream<int> get itemsStream => _itemsController.stream;
  Stream<bool> get stream => _bottomSheetController.stream;
  int get selectedIndex => _selectedIndex;
  bool get isOpened => _sheetOpened;

  void selectItem(int val) {
    _selectedIndex = val;
    _itemsController.add(val);
    if (onItemSelect != null) {
      onItemSelect!(val);
    }
  }

  void toggleSheet() {
    _sheetOpened = !_sheetOpened;
    _bottomSheetController.add(_sheetOpened);
  }

  void openSheet() {
    _sheetOpened = true;
    _bottomSheetController.add(_sheetOpened);
  }

  void closeSheet() {
    _sheetOpened = false;
    _bottomSheetController.add(_sheetOpened);
  }

  Future<void> close() async {
    await _itemsController.close();
    await _bottomSheetController.close();
  }
}
