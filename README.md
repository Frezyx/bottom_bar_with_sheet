# bottom_bar_with_sheet

💥Non-standard way to use more space of screens in your application💥<br>
😳Custom bottom Sheet under Bottom Navigation Bar😳<br>
😩Sounds sucks? 😉First of all look at screens!

| ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example_day_theme.gif?raw=true) | ![Image](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/example_night_theme.gif?raw=true) |
| :------------: | :------------: |

## Getting Started

### Add dependency

```yaml
dependencies:
  bottom_bar_with_sheet: ^0.2.0 #latest version
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
        sheetChild: Center(child: Text("Place for your another content")),
        selectedIndex: 0,
        styleBottomBar: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.right,
          mainActionButtonSize: 55,
          barHeightClosed: 75,
          barHeightOpened: 400,
          mainActionButtonIconClosed: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          mainActionButtonIconOpened: Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
        ),
        onSelectItem: (index) => print("$index bar item is selected"),
        items: [
          BottomBarWithSheetItem(
            iconData: Icons.people,
            label: 'Profile',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.shopping_cart,
            label: 'Cart',
            selectedBackgroundColor: Colors.blue,
          ),
          BottomBarWithSheetItem(
            iconData: Icons.settings,
            label: 'Settings',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
// ----------------------------------[end of widget]----------------------------------
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
        <li style="margin-left:10px;"><strong>iconData:</strong> icon Widget that you use in tab button</li>
        <li style="margin-left:10px;"><strong>label:</strong> text under tab button</li>
        <li style="margin-left:10px;"><strong>selectedBackgroundColor:</strong> background color of circle when tab bar is selected</li>
        <li style="margin-left:10px;"><strong>itemWidth:</strong> custom width of element in tab panel</li>
        <li style="margin-left:10px;"><strong>animationDuration:</strong> speed of animation</li>
        <li style="margin-left:10px;"><strong>itemIconColor:</strong> custom color of element in tab panel </li>
    </ul>
)<br>
<strong>styleBottomBar:</strong> -> List of style settings to customize your bottom_bar_with_sheet ->(
    <ul>
    <li><h2>Sizes</h2></li>
        <li style="margin-left:10px;"><strong>contentPadding:</strong> padding between content of widget and edges of widget</li>
        <li style="margin-left:10px;"><strong>barBackgroundColor:</strong> background color of main Widget</li>
        <li style="margin-left:10px;"><strong>rightMargin:</strong> size of space between right mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>leftMargin:</strong> size of space between left mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>marginBetweenPanelAndActtionButton:</strong> it seems so clear. No?. Request issue if so.</li>
        <li style="margin-left:10px;"><strong>barHeightClosed:</strong> main Widget height when sheet is closed</li>
        <li style="margin-left:10px;"><strong>barHeightOpened:</strong> main Widget height when sheet is opened</li>
        <li style="margin-left:10px;"><strong>mainActionButtonPadding:</strong> space beetwen circle border and icon of main action button</li>
        <li style="margin-left:10px;"><strong>mainActionButtonSize:</strong> size of main action button</li>
    <li><h2>Colors</h2></li>
        <li style="margin-left:10px;"><strong>mainActionButtonColorSplash:</strong> main action button splash color</li>
        <li style="margin-left:10px;"><strong>mainActionButtonColor:</strong> main action button color</li>
        <li style="margin-left:10px;"><strong>barBackgroundColor:</strong> backgroun color of tab panel</li>
        <li style="margin-left:10px;"><strong>selectedItemBackgroundColor:</strong> background circle color of selected item</li>
        <li style="margin-left:10px;"><strong>selectedItemIconColor:</strong> color of selected item icon</li>
        <li style="margin-left:10px;"><strong>selectedItemLabelColor:</strong> color of selected item text</li>
        <li style="margin-left:10px;"><strong>itemIconColor:</strong> color of unselected item icon</li>
        <li style="margin-left:10px;"><strong>itemLabelColor:</strong> color of unselected item text</li>
    <li><h2>Widgets & Full Styles</h2></li>
        <li style="margin-left:10px;"><strong>mainActionButtonIconClosed:</strong> icon when sheet is closed</li>
        <li style="margin-left:10px;"><strong>mainActionButtonIconOpened:</strong> icon when sheet is opened</li>
        <li style="margin-left:10px;"><strong>selectedItemLabelColor:</strong> text style of selected item text</li>
        <li style="margin-left:10px;"><strong>itemTextStyle:</strong> text style unselected item text</li>
        <li style="margin-left:10px;"><strong>borderRadius:</strong> main Widget border radius</li>
        <li style="margin-left:10px;"><strong>boxShadow:</strong> main Widget shadow</li>
    </ul>
)<br>

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
