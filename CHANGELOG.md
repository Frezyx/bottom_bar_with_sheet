## 2.4.0
  - **BREAKING**: Remove **isOpened**, **selectedIndex**, **mainActionButton** fields
  - **BREAKING**: Remove outside position
  - **INFO**: Update examples and create new usecase example
  - **INFO**: Update README with thanks for [Nivin389](https://github.com/Nivin389)

## 2.3.1
  - **INFO**: Fix examples in example folder

## 2.3.0
  - **FEAT**: Add [mainActionButtonBuilder](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/lib/src/bottom_bar_with_sheet_base.dart#:~:text=final%20bool-,disableMainActionButton,-%3B) to build your custom main action button
  - **INFO**: Recreate example proj

## 2.2.0
  - **FEAT**: Add [openSheet](https://github.com/Frezyx/bottom_bar_with_sheet/blob/109ecfdc995e0e6942e41b02d95bf65c0099933b/lib/src/utils/controller/controller.dart#:~:text=void-,openSheet,-()%20%7B) method to open sheet by controller
  - **FEAT**: Add [closeSheet](https://github.com/Frezyx/bottom_bar_with_sheet/blob/109ecfdc995e0e6942e41b02d95bf65c0099933b/lib/src/utils/controller/controller.dart#:~:text=void-,closeSheet,-()%20%7B) method to close sheet by controller
  - **INFO**: Add comments for controller
  - **INFO**: Make small refactor

## 2.1.0
  - **FEAT**: Add [isVerticalItemLabel](https://github.com/Frezyx/bottom_bar_with_sheet/blob/master/lib/src/theme/bottom_bar_with_sheet_theme.dart#:~:text=final%20bool-,isVerticalItemLabel,-%3B) field

Thanks for [coskuncay](https://github.com/coskuncay)

## 2.0.1
  - **FIX**: Fix tap zone of bar item
  - **FIX**: Fix icon size passing from custom theme
## 2.0.0

 - **BREAKING**: Implement BottomBarWithSheetController for working with items selection!
 - **BREAKING**: Delete iconOpened, itemWidth, selectedItemLabelColor, itemLabelColor,selectedItemBackgroundColor fields
 - **FEAT**: Refactor all old code base (shit code)! Now everything works faster and more convenient to upgrading
 - **FEAT**: Now BottomBarWithSheetItem is model to create widget
 - **FEAT**: MainActionButton now common Widget
 - **FIX**: Update theme of widget
 - **FIX**: Fix widgets tree scheme

## 1.1.1 - 25-04-2021

* Fix analyser issues
* Refactor provider naming

## 1.1.0 - 25-04-2021

* Simplify package using with default themes
* Make bottomBarTheme, mainActionButtonTheme optional

## 1.0.1 - 25-04-2021

* Provide key value to super class in BottomBarWithSheet widget

## 1.0.0 - 12-04-2021

* **Breaking change** migrated to null safety.

## 0.6.1 - 19-03-2021

* Update all examples and README.md

## 0.6.0 - 14-03-2021

* Add **autoClose** field then works to close automatically when clicked on BottomBarWithSheetItem 

## 0.5.5+2 - 11-02-2021

* Format code

## 0.5.5+1 - 11-02-2021

* Fix pub.dev issues

## 0.5.5 - 11-02-2021

* Refactor code on BottomBar and BarItem
* Add pedantic dependency
* Replace providing variables into BottomBarProvider

## 0.5.4 - 21-12-2020

* Fix preview overload

## 0.5.3 - 4-12-2020

* Added new usage examples
* Update documentation

## 0.5.2 - 4-12-2020

* Added selectedItemIconSize field in BottomBarTheme class
* Remove ci/cd logic from travis to GithubActions

## 0.5.1 - 5-11-2020

### Created Widget tests

## 0.5.0 - 5-11-2020

### Implement custom mainActionButton

## 0.4.0 - 27-10-2020

### New UI way

* Added ability to disable MainActionButton
* Added ability to set 0 initial height of widget
* Created [example](https://github.com/Frezyx/bottom_bar_with_sheet/example/lib/examples/fab_outside_bottom_bar.dart) of new usage way of package 
  
## 0.3.2 - 10-10-2020

* fix example images in repository README.md

## 0.3.1 - 10-10-2020

* fix support the latest published version of included packages


## 0.3.0 - 09-10-2020

### Big package update

* Remove theme fields in own classes
* Fix bar auto closing when item pressed
* Make working with fields easier then before
* Add transform field for MainActionButton
* Add decoration field for bar theme
* etc

## 0.2.1 - 30-09-2020

* Added the ability to set own margins (content paddings).
  In case to solve this [issue](https://github.com/Frezyx/bottom_bar_with_sheet/issues/5), for new ios devices.

* Now the widget is not based on the standard BottomAppBar.

## 0.2.0 - 16-09-2020

* Added ability to set center position of the main button

## 0.1.3 - 12-08-2020

* Simplify example end README.md

## 0.1.2 - 06-08-2020

* Fix typo in the name of the main file of usage documentation
* Add gifs with usage examples

## 0.1.1 - 01-08-2020

* Fast fix immutable

## 0.1.0 - 31-07-2020

* Added the curve and mainButtonPosition field 
<br> to create cool animations and the positioning of the open sheet button

## 0.0.1 - 20-06-2020

* Initial functionality 
