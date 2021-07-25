import 'package:bottom_bar_with_sheet/src/enums/positions.dart';
import 'package:bottom_bar_with_sheet/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test_ItemsGenerator', () {
    final _mainActionButton = GlobalKey(debugLabel: 'MainButton');

    final _firstItem = GlobalKey(debugLabel: 'first');
    final _secondItem = GlobalKey(debugLabel: 'second');
    final _thirdItem = GlobalKey(debugLabel: 'third');
    final _fourthItem = GlobalKey(debugLabel: 'fourth');

    late Widget iconButton;
    late List<Widget> items;

    setUp(() {
      iconButton = TextFormField(
        key: _mainActionButton,
      );
      items = [
        TextFormField(key: _firstItem),
        TextFormField(key: _secondItem),
        TextFormField(key: _thirdItem),
        TextFormField(key: _fourthItem),
      ];
    });
    test('LeftSide_Button', () async {
      final generatedItems = ItemsGenerator.generateByButtonPosition(
        mainActionButton: iconButton,
        items: items,
        position: MainButtonPosition.left,
      );

      expect(generatedItems, isNotNull);
      expect(generatedItems, isList);
      expect(generatedItems, isNotEmpty);
      expect(generatedItems.first.key, _mainActionButton);
      expect(generatedItems[1].key, _firstItem);
    });

    test('RightSide_Button', () async {
      final generatedItems = ItemsGenerator.generateByButtonPosition(
        mainActionButton: iconButton,
        items: items,
        position: MainButtonPosition.right,
      );

      expect(generatedItems, isNotNull);
      expect(generatedItems, isList);
      expect(generatedItems, isNotEmpty);
      expect(generatedItems.last.key, _mainActionButton);
      expect(generatedItems.first.key, _firstItem);
    });

    test('CenterSide_Button_Event', () async {
      final generatedItems = ItemsGenerator.generateByButtonPosition(
        mainActionButton: iconButton,
        items: items,
        position: MainButtonPosition.middle,
      );

      expect(generatedItems, isNotNull);
      expect(generatedItems, isList);
      expect(generatedItems, isNotEmpty);
      expect(generatedItems[2].key, _mainActionButton);
      expect(generatedItems.first.key, _firstItem);
      expect(generatedItems.last.key, _fourthItem);
    });
  });
}
