import 'package:bottom_bar_with_sheet/src/models/positions.dart';
import 'package:bottom_bar_with_sheet/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test_ItemsGenerator', () {
    final _mainActionButtonKey = GlobalKey(debugLabel: 'MainButton');

    final _firstItemKey = GlobalKey(debugLabel: 'first');
    final _secondItemKey = GlobalKey(debugLabel: 'second');
    final _thirdItemKey = GlobalKey(debugLabel: 'third');
    final _fourthItemKey = GlobalKey(debugLabel: 'fourth');

    late Widget iconButton;
    late List<Widget> items;

    setUp(() {
      iconButton = TextFormField(
        key: _mainActionButtonKey,
      );
      items = [
        TextFormField(key: _firstItemKey),
        TextFormField(key: _secondItemKey),
        TextFormField(key: _thirdItemKey),
        TextFormField(key: _fourthItemKey),
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
      expect(generatedItems.first.key, _mainActionButtonKey);
      expect(generatedItems[1].key, _firstItemKey);
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
      expect(generatedItems.last.key, _mainActionButtonKey);
      expect(generatedItems.first.key, _firstItemKey);
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
      expect(generatedItems[2].key, _mainActionButtonKey);
      expect(generatedItems.first.key, _firstItemKey);
      expect(generatedItems.last.key, _fourthItemKey);
    });

    test('CenterSide_Button_NotEvent', () async {
      final generatedItems = ItemsGenerator.generateByButtonPosition(
        mainActionButton: iconButton,
        items: items..removeAt(0),
        position: MainButtonPosition.middle,
      );

      expect(generatedItems, isNotNull);
      expect(generatedItems, isList);
      expect(generatedItems, isNotEmpty);
      expect(generatedItems[0].key, _secondItemKey);
      expect(generatedItems[1].key, _thirdItemKey);
      expect(generatedItems[2].key, _mainActionButtonKey);
      expect(generatedItems.last.key, _fourthItemKey);
    });
  });
}
