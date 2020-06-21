library bottom_bar_with_sheet;

import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class BottomBarWithSheet extends StatefulWidget {

  final List<BottomBarWithSheetItem> items;
  final BottomBarTheme styleBottomBar;
  final Function onSelectItem;
  final int selectedIndex;
  bool isOpened;
  MainAxisAlignment bottomBarMainAxisAlignment;
  CrossAxisAlignment bottomBarCrossAxisAlignment;

  BottomBarWithSheet({

    Key key,
    this.selectedIndex = 0,
    this.isOpened = false,
    this.bottomBarMainAxisAlignment = MainAxisAlignment.center,
    this.bottomBarCrossAxisAlignment = CrossAxisAlignment.start,
    @required this.onSelectItem,
    @required this.items,
    @required this.styleBottomBar,

  }) {

    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);

  }

  @override
  _BottomBarWithSheetState createState() => _BottomBarWithSheetState(
    selectedIndex: selectedIndex,
    isOpened: isOpened,
    bottomBarMainAxisAlignment:bottomBarMainAxisAlignment,
    bottomBarCrossAxisAlignment: bottomBarCrossAxisAlignment,
    );
}

class _BottomBarWithSheetState extends State<BottomBarWithSheet> with SingleTickerProviderStateMixin {
  int selectedIndex;
  bool isOpened;
  _BottomBarWithSheetState({this.selectedIndex, this.isOpened, this.bottomBarMainAxisAlignment, this.bottomBarCrossAxisAlignment});

  AnimationController _arrowAnimationController;
  Animation _arrowAnimation;
  var bottomSheetController;
  bool isAnimated = false;
  MainAxisAlignment bottomBarMainAxisAlignment;
  
  //Не нужно
  CrossAxisAlignment bottomBarCrossAxisAlignment;

  @override
  void initState() {
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _arrowAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_arrowAnimationController);
  }

@override
void dispose() {
  _arrowAnimationController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {

    final BottomBarTheme styleBottomBar = widget.styleBottomBar;
    final backgroundColor = styleBottomBar.barBackgroundColor ?? Theme.of(context).bottomAppBarColor;

    return BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        shape: CircularNotchedRectangle(),
        notchMargin: widget.styleBottomBar.rightMargin,
        child: MultiProvider(
          providers: [
            Provider<BottomBarTheme>.value(value: styleBottomBar),
            Provider<int>.value(value: widget.selectedIndex),
            Provider<bool>.value(value: widget.isOpened),
            Provider<MainAxisAlignment>.value(value: widget.bottomBarMainAxisAlignment),
          ],
          child: AnimatedContainer(
            // Real animated 
            duration: Duration(milliseconds: 1000),
            height: widget.styleBottomBar.barHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
              ),
              color: backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              // widget.bottomBarCrossAxisAlignment,
              children: <Widget>[

              // !widget.isOpened ? 
              Container(
                  margin: EdgeInsets.only(left: widget.styleBottomBar.rightMargin, right: widget.styleBottomBar.marginBetweenPanelAndActtionButton),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.items.map((item) {
                    var i = widget.items.indexOf(item);
                    item.setIndex(i);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onSelectItem(i);
                          selectedIndex = i;
                        });
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / widget.items.length - (widget.styleBottomBar.rightMargin + 100) / widget.items.length,
                          height: 70,
                          child: item,
                        ),
                      ),
                    );
                  }).toList(),
                ),
          ),
          // :Container(

          // ),

           Container(
                  child: Container(
                        color: Colors.transparent,
                        child: Padding(
                            padding: EdgeInsets.all(7),
                            child: ClipOval(
                              child: Material(
                                color: Colors.blue, // button color
                                child: InkWell(
                                  splashColor: Colors.indigo[900], // inkwell color
                                  child: 
                                  
                                  AnimatedBuilder(
                                    animation: _arrowAnimationController,
                                    builder: (BuildContext context, Widget child) { 
                                        return Transform.rotate(
                                        angle:  _arrowAnimation.value * 2.0 * math.pi,
                                        child: child,
                                      );
                                    },
                                    child:SizedBox(
                                      width: 55, height: 55, 
                                      child: Icon(Icons.add, color:Colors.white)
                                ),),
                                  onTap: () {
                                    setState((){
                                     widget.styleBottomBar.barHeight = widget.isOpened?  70 : 400;
                                     widget.isOpened = !widget.isOpened;

                                     _arrowAnimationController.isCompleted
                                        ? _arrowAnimationController.reverse().then((value){

                                        })
                                        : _arrowAnimationController.forward().then((value){
                                          
                                        });
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                      )
                    )
              ],
          ),
        ),
      ),
    );
  }
}
