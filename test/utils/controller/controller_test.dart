import 'package:bottom_bar_with_sheet/src/src.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test_Controller', () {
    late BottomBarWithSheetController _controller;

    setUp(() {
      _controller = BottomBarWithSheetController(initialIndex: 0);
    });

    test('Select_Item', () async {
      _controller.selectItem(2);

      expect(_controller.selectedIndex, isNotNull);
      expect(_controller.selectedIndex, 2);
    });

    test('Toggle_Sheet', () async {
      _controller.toggleSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, true);

      _controller.toggleSheet();

      expect(_controller.isOpened, isNotNull);
      expect(_controller.isOpened, false);
    });
  });
}
