# bottom_bar_with_sheet

💥Non-standard way to use more space of screens in your application💥<br>
😳Custom bottom Sheet under Bottom Navigation Bar😳<br>
😩Sounds sucks? 😉First of all look at screens!

<img src="https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/example/rep_files/preview.gif?raw=true" width="270">

## Getting Started

### Add dependency

```yaml
dependencies:
  bottom_bar_withs_sheet: ^0.0.1 #latest version
```

### Add import package

```dart
import 'package:bottom_bar_with_sheet/bottom_bar_withs_sheet.dart';
```

### Easy to use

```dart
Scaffold(
      body: Center(child: Text("Place for your content")),

      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: selectedIndex,
        duration: Duration(milliseconds: 600),
        styleBottomBar: BottomBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          mainActionButtonSize: 55,
          barHeightClosed: 70,
          barHeightOpened: 400,
          marginBetweenPanelAndActtionButton: 30,
          rightMargin: 15,
          mainActionButtonPadding: EdgeInsets.all(7),
          mainActionButtonIconClosed: Icon(Icons.arrow_drop_up, color:Colors.white , size: 40,),
          mainActionButtonIconOpened: Icon(Icons.arrow_drop_down, color:Colors.white, size: 40,),
        ),

        onSelectItem: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        sheetChild: Center(child: Text("Place for your another content")),

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
        <li style="margin-left:10px;"><strong>barBackgroundColor:</strong> background color of main Widget</li>
        <li style="margin-left:10px;"><strong>rightMargin:</strong> size of space between right mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>leftMargin:</strong> size of space between left mobile border and Widget insides</li>
        <li style="margin-left:10px;"><strong>marginBetweenPanelAndActtionButton:</strong> it seems so clear. No?. Request issue if so.</li>
        <li style="margin-left:10px;"><strong>barHeightClosed:</strong> main Widget height when sheet is closed</li>
        <li style="margin-left:10px;"><strong>barHeightOpened:</strong> main Widget height when sheet is opened</li>
        <li style="margin-left:10px;"><strong>mainActionButtonPadding:</strong> space beetwen circle border and icon of main action button</li>
        <li style="margin-left:10px;"><strong>mainActionButtonSize:</strong> size of main action button</li>
        <li style="margin-left:10px;"><strong>notchMargin:</strong> radius of space size between FloatingActionBar and BottomNavigationBar (if you need in FAB)</li>
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
