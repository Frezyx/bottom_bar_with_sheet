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

  Function(int index)? onItemSelect;
  int _selectedIndex;
  bool _sheetOpened;

  /// Stream to check wich item now selected
  Stream<int> get itemsStream => _itemsController.stream;

  /// Stream to check is bottom bar open or close
  Stream<bool> get stream => _bottomSheetController.stream;

  /// Current selected page (item) of [List<BottomBarWithSheetItem>] [items]
  int get selectedIndex => _selectedIndex;

  /// Is sheet opened
  bool get isOpened => _sheetOpened;

  /// Method to select one item of [List<BottomBarWithSheetItem>] [items]
  void selectItem(int val) {
    _selectedIndex = val;
    _itemsController.add(val);
    onItemSelect?.call(val);
  }

  /// Method to open / close sheet
  /// if [isOpened] == true -> closing sheet
  /// if [isOpened] == false -> opening sheet
  void toggleSheet() {
    _sheetOpened = !_sheetOpened;
    _bottomSheetController.add(_sheetOpened);
  }

  /// Method to open sheet
  void openSheet() {
    if (!_sheetOpened) {
      _sheetOpened = true;
      _bottomSheetController.add(_sheetOpened);
    }
  }

  /// Method to close sheet
  void closeSheet() {
    if (_sheetOpened) {
      _sheetOpened = false;
      _bottomSheetController.add(_sheetOpened);
    }
  }

  /// Close controller helpers - controllers
  /// before stop working with main [BottomBarWithSheetController] controller
  Future<void> close() async {
    await _itemsController.close();
    await _bottomSheetController.close();
  }
}
