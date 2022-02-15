import 'package:bottom_bar_with_sheet/src/src.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomBarWithSheetController', () {
    late BottomBarWithSheetController _controller;

    setUp(() {
      _controller = BottomBarWithSheetController(initialIndex: 0);
    });

    test('selectItem', () {
      _controller.selectItem(2);

      expect(_controller.selectedIndex, isNotNull);
      expect(_controller.selectedIndex, 2);
    });

    test('openSheet', () {
      _testOpen(_controller);
      _testOpen(_controller);
    });

    test('openSheet closeSheet', () {
      _testOpen(_controller);
      _testOpen(_controller);
    });

    test('openSheet 2 times', () {
      _testOpen(_controller);
      _testOpen(_controller);
    });

    test('closeSheet', () {
      _testClose(_controller);
      _testClose(_controller);
    });

    test('closeSheet openSheet', () {
      _testClose(_controller);
      _testOpen(_controller);
    });

    test('closeSheet 2 times', () {
      _testClose(_controller);
      _testClose(_controller);
    });

    test('toggleSheet', () {
      _testToggle(_controller);
    });
  });
}

void _testToggle(BottomBarWithSheetController _controller) {
  _controller.toggleSheet();

  expect(_controller.isOpened, isNotNull);
  expect(_controller.isOpened, true);

  _controller.toggleSheet();

  expect(_controller.isOpened, isNotNull);
  expect(_controller.isOpened, false);
}

void _testClose(BottomBarWithSheetController _controller) {
  _controller.closeSheet();

  expect(_controller.isOpened, isNotNull);
  expect(_controller.isOpened, false);
}

void _testOpen(BottomBarWithSheetController _controller) {
  _controller.openSheet();

  expect(_controller.isOpened, isNotNull);
  expect(_controller.isOpened, true);
}
