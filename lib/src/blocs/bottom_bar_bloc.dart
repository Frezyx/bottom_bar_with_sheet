import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomBarBloc extends ChangeNotifier {
  BottomBarBloc({
    required int selectedIndex,
    required bool? isOpened,
    required MainAxisAlignment mainAxisAlignment,
    required BottomBarTheme bottomBarTheme,
  })   : _selectedIndex = selectedIndex,
        _isOpened = isOpened,
        _mainAxisAlignment = mainAxisAlignment,
        _bottomBarTheme = bottomBarTheme;

  int _selectedIndex;
  bool? _isOpened;
  MainAxisAlignment _mainAxisAlignment;
  BottomBarTheme _bottomBarTheme;

  BottomBarTheme get bottomBarTheme => _bottomBarTheme;

  set bottomBarTheme(BottomBarTheme value) {
    _bottomBarTheme = value;
    notifyListeners();
  }

  MainAxisAlignment get mainAxisAlignment => _mainAxisAlignment;

  set mainAxisAlignment(MainAxisAlignment value) {
    _mainAxisAlignment = value;
    notifyListeners();
  }

  bool? get isOpened => _isOpened;

  set isOpened(bool? value) {
    _isOpened = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}
