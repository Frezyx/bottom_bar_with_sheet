import 'package:bottom_bar_with_sheet/src/src.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomBarWithSheetController', () {
    late BottomBarWithSheetController _controller;

    setUp(() {
      _controller = BottomBarWithSheetController(initialIndex: 0);
    });

    test('selectItem', () async {
      _controller.selectItem(2);

      expect(_controller.selectedIndex, isNotNull);
      expect(_controller.selectedIndex, 2);
    });

    test('openSheet', () async {
      _controller.openSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, true);

      _controller.openSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, true);
    });

    test('closeSheet', () async {
      _controller.closeSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, false);

      _controller.closeSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, false);
    });

    test('toggleSheet', () async {
      _controller.toggleSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, true);

      _controller.toggleSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, false);
    });
  });
}
