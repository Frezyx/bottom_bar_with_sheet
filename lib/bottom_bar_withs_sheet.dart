library bottom_bar_with_sheet;

import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_item.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BottomBarWithSheet extends StatefulWidget {

  final List<BottomBarWithSheetItem> items;
  final BottomBarTheme styleBottomBar;
  final Function onSelectItem;
  final int selectedIndex;
  bool isOpened;

  BottomBarWithSheet({

    Key key,
    this.selectedIndex = 0,
    this.isOpened = false,
    @required this.onSelectItem,
    @required this.items,
    @required this.styleBottomBar,

  }) {

    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);

  }

  @override
  _BottomBarWithSheetState createState() => _BottomBarWithSheetState(selectedIndex: selectedIndex, isOpened: isOpened);
}

class _BottomBarWithSheetState extends State<BottomBarWithSheet> {
  int selectedIndex;
  bool isOpened;
  _BottomBarWithSheetState({this.selectedIndex, this.isOpened});

  var bottomSheetController;

  @override
  Widget build(BuildContext context) {

    final BottomBarTheme styleBottomBar = widget.styleBottomBar;
    final backgroundColor = styleBottomBar.barBackgroundColor ?? Theme.of(context).bottomAppBarColor;

    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: widget.styleBottomBar.leftMargin,
        child: MultiProvider(
          providers: [
            Provider<BottomBarTheme>.value(value: styleBottomBar),
            Provider<int>.value(value: widget.selectedIndex),
            Provider<bool>.value(value: widget.isOpened),
          ],
          child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
            height: widget.styleBottomBar.barHeight,
            child: Row(
              mainAxisAlignment: widget.isOpened? MainAxisAlignment.end : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: widget.isOpened? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: <Widget>[

              !widget.isOpened ? Container(
                  color: backgroundColor,
                  margin: EdgeInsets.only(left: widget.styleBottomBar.leftMargin, right: widget.styleBottomBar.rightMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          width: MediaQuery.of(context).size.width / widget.items.length - (widget.styleBottomBar.leftMargin + 100) / widget.items.length,
                          height: styleBottomBar.barHeight,
                          child: item,
                        ),
                      ),
                    );
                  }).toList(),
                ),
          ):Container(),

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
                                  child: SizedBox(width: 55, height: 55, 
                                  child: Icon(Icons.add, color:Colors.white)
                                ),
                                  onTap: () {
                                    setState((){
                                     widget.styleBottomBar.barHeight = widget.isOpened?  70 : 400;
                                     widget.isOpened = !widget.isOpened;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                      ),
                  )
              ],
            )
        ),
      ),
    );
  }

  // make1Shit(){
  //            var bottomSheetController = showBottomSheet(
  //         context: context,
  //         builder: (context) => Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
  //                 boxShadow:<BoxShadow>[
  //                     BoxShadow(
  //                       color: Color.fromRGBO(0, 0, 0, 0.05),
  //                       offset: Offset(-100.0, 0.0),
  //                       blurRadius: 10.0,
  //                     ),
  //                   ],
  //               ),
  //               height: 250,
  //             ));

  //       setState((){
  //           isOpened = true;
  //         });

  //         bottomSheetController.closed.then((value) {

  //           setState((){
  //               isOpened = false;
  //           });

  //         }); 
  //   return bottomSheetController;
  // }

  //   makeShit(bottomSheetController){

  //         Navigator.pop(context);
  //           setState((){
  //             isOpened = false;
  //           });
  //         }

}
