# bottom_bar_with_sheet

💥Non-standard way to use more space of screens in your application💥<br>
😳Custom bottom Sheet under Bottom Navigation Bar😳<br>
😩Sounds sucks? 😉First of all look at screens!

| ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/info-doc-updates/example/rep_files/example1.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/info-doc-updates/example/rep_files/example2.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/info-doc-updates/example/rep_files/example3.gif?raw=true) |
| :------------: | :------------: | :------------: |

## Getting Started

### Add dependency

```yaml
dependencies:
  bottom_bar_with_sheet: ^0.3.0 #latest version
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

### Attributes

<strong>sheetChild:</strong> an Widget to display on bottom sheet <br>
<strong>selectedIndex:</strong> index of element in tab panel, can be used to change screens<br>
<strong>duration:</strong> time to open the sheet <br>
<strong>onSelectItem:</strong> function handling taps on items in tab panel <br>
<strong>isOpened:</strong> bool value. Set true if you need to open bottom sheet when page was builded<br>
<strong>items:</strong> List of BottomBarWithSheetItem(
    <ul>
        <li style="margin-left:10px;"><strong>icon:</strong> icon Widget that you use in tab button</li>
        <li style="margin-left:10px;"><strong>label:</strong> text under tab button</li>
        <li style="margin-left:10px;"><strong>selectedBackgroundColor:</strong> background color of circle when tab bar is selected</li>
        <li style="margin-left:10px;"><strong>itemWidth:</strong> custom width of element in tab panel</li>
        <li style="margin-left:10px;"><strong>animationDuration:</strong> speed of animation</li>
        <li style="margin-left:10px;"><strong>itemIconColor:</strong> custom color of element in tab panel </li>
    </ul>
)<br>
<strong>bottomBarTheme:</strong> -> List of style settings to customize your bottom_bar_with_sheet ->(
    <ul>
    <li><h2>Sizes</h2></li>
        <li style="margin-left:10px;"><strong>contentPadding:</strong> padding between content of widget and edges of widget</li>
        <li style="margin-left:10px;"><strong>backgroundColor:</strong> background color of main Widget</li>
        <li style="margin-left:10px;"><strong>rightMargin:</strong> size of space between right mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>leftMargin:</strong> size of space between left mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>marginBetweenPanelAndActtionButton:</strong> it seems so clear. No?. Request issue if so.</li>
        <li style="margin-left:10px;"><strong>height:</strong> main Widget height when sheet is closed</li>
        <li style="margin-left:10px;"><strong>heightOpened:</strong> main Widget height when sheet is opened</li>
        <li style="margin-left:10px;"><strong>margin:</strong> space beetwen circle border and icon of main action button</li>
        <li style="margin-left:10px;"><strong>size:</strong> size of main action button</li>
    <li><h2>Colors</h2></li>
        <li style="margin-left:10px;"><strong>splash:</strong> main action button splash color</li>
        <li style="margin-left:10px;"><strong>color:</strong> main action button color</li>
        <li style="margin-left:10px;"><strong>backgroundColor:</strong> backgroun color of tab panel</li>
        <li style="margin-left:10px;"><strong>selectedItemBackgroundColor:</strong> background circle color of selected item</li>
        <li style="margin-left:10px;"><strong>selectedItemIconColor:</strong> color of selected item icon</li>
        <li style="margin-left:10px;"><strong>selectedItemLabelColor:</strong> color of selected item text</li>
        <li style="margin-left:10px;"><strong>itemIconColor:</strong> color of unselected item icon</li>
        <li style="margin-left:10px;"><strong>itemLabelColor:</strong> color of unselected item text</li>
    <li><h2>Widgets & Full Styles</h2></li>
        <li style="margin-left:10px;"><strong>iconOpened:</strong> icon when sheet is closed</li>
        <li style="margin-left:10px;"><strong>icon:</strong> icon when sheet is opened</li>
        <li style="margin-left:10px;"><strong>selectedItemLabelColor:</strong> text style of selected item text</li>
        <li style="margin-left:10px;"><strong>itemTextStyle:</strong> text style unselected item text</li>
        <li style="margin-left:10px;"><strong>borderRadius:</strong> main Widget border radius</li>
        <li style="margin-left:10px;"><strong>boxShadow:</strong> main Widget shadow</li>
    </ul>
)<br>

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
