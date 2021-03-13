# bottom_bar_with_sheet

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FFrezyx%2Fbottom_bar_with_sheet%2Fbadge%3Fref%3Dmaster&style=flat)](https://actions-badge.atrox.dev/Frezyx/bottom_bar_with_sheet/goto?ref=master) [![License](https://img.shields.io/github/license/Frezyx/bottom_bar_with_sheet)](https://opensource.org/licenses/MIT) [![Pub](https://img.shields.io/pub/v/bottom_bar_with_sheet.svg)](https://pub.dartlang.org/packages/bottom_bar_with_sheet)
![Stars](https://img.shields.io/github/stars/Frezyx/bottom_bar_with_sheet?style=social)

💥Non-standard way to use more space of screens in your application💥<br>
😳Custom bottom Sheet under Bottom Navigation Bar😳<br>
😩Sounds sucks? 😉First of all look at screens!

| ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example1.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example2.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example3.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example4.gif?raw=true) |
| :------------: | :------------: | :------------: | :------------: |

<!-- | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example4.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example5.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example6.gif?raw=true) | -->


## Getting Started

### Add dependency

```yaml
dependencies:
  bottom_bar_with_sheet: ^0.5.5+2
```

### Add import package

```dart
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
```

### Easy to use

Create a **Scaffold** widget and set **bottomNavigationBar** with **BottomBarWithSheet** like in the code below

```dart
Scaffold(
      body: Center(child: Text("Place for your content")),
// -----------------------------------------------------------------------------
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: 0,
        sheetChild: Center(child: Text("Place for your another content")),
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
          selectedItemBackgroundColor: const Color(0xFF2B65E3),
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 60,
          color: const Color(0xFF2B65E3),
          icon: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) => print('item $index was pressed'),
        items: [
          BottomBarWithSheetItem(icon: Icons.people),
          BottomBarWithSheetItem(icon: Icons.shopping_cart),
          BottomBarWithSheetItem(icon: Icons.settings),
          BottomBarWithSheetItem(icon: Icons.favorite),
        ],
      ),
/// ----------------------------------[end of widget]----------------------------------
    );
```

**More examples you can see** [here](https://github.com/Frezyx/bottom_bar_with_sheet/tree/master/example/lib)

## Attributes

| Attribute  | Type | Annotation |
| ------------- | ------------- | ------------- |
| isOpened | bool | Responsible for the open / closed state of the widget |
| autoClose | bool | If true the [BottomBarWithSheetItem]'s DO NOT automatically close the child sheet when pressed |
| disableMainActionButton | bool | disable MainActionButton if true , enable if false |
| sheetChild | Widget | that displayed on bottom of **BottomBarWithSheet** when **isOpened** == true |
| items | List BottomBarWithSheetItem | navigation buttons of **BottomBarWithSheet** |
| bottomBarTheme | BottomBarTheme | theme of **BottomBarWithSheet** |
| mainActionButtonTheme | MainActionButtonTheme | theme of **Main Action Button** |
| onSelectItem | Function | Callback **Function** works by clicking on one of **items** Return int **index** of selected button |
| selectedIndex | int | index of selected **BottomBarWithSheetItem** from **items** |
| duration | Duration | animation time of closing / opening **BottomBarWithSheet** |
| curve | Curve | the style of animation from the suggested ones of **Curve** |
| bottomBarMainAxisAlignment | MainAxisAlignment | The direction in which the widget content will line up |
| mainActionButton | MainActionButton | Custom version of Main Action Button |

## Attributes of BottomBarTheme

| Attribute  | Type | Annotation |
| ------------- | ------------- | ------------- |
| height | double | **BottomBarWithSheet** icons line height |
| heightOpened | double | **BottomBarWithSheet** height when **isOpened** == true |
| heightClosed | double | **BottomBarWithSheet** height when **isOpened** == false |
| decoration | BoxDecoration | decoration of **BottomBarWithSheet** |
| contentPadding | EdgeInsets | create padding between content of widget and sides |
| backgroundColor | Color | **BottomBarWithSheet** background color |
| selectedItemIconColor | Color | selected item icon color |
| itemIconColor | Color | unselected item icon color |
| selectedItemLabelColor | Color | selected item text color |
| itemLabelColor | Color | unselected item text color |
| selectedItemTextStyle | Color | selected item text style |
| itemTextStyle | Color | unselected item text style |
| selectedItemBackgroundColor | Color | selected item icon color |
| selectedItemIconSize | double | size of item icon when item is pressed |
| mainButtonPosition | enum | filed that response for the position of MainActionButton position this field have 3 possible values: MainButtonPosition.Left, MainButtonPosition.Right , MainButtonPosition.Center |

## Attributes of MainActionButtonTheme

| Attribute  | Type | Annotation |
| ------------- | ------------- | ------------- |
| size | double | size of button |
| icon | Widget | icon that displayed when the  **BottomBarWithSheet** when **isOpened** == false |
| iconOpened | Widget | icon that displayed when the  **BottomBarWithSheet** when **isOpened** == true |
| color | Color | background color of widget circle |
| splash | Color | splash color of widget circle |
| margin | EdgeInsets | side paddings of **Main Action Button** |
| transform | Matrix4 | This field can set transform location of **Main Action Button** |

<br><br>

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
