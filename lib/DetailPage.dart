import 'package:flutter/material.dart';
import 'package:gdg_school/workshop.dart';
import 'package:gdg_school/WorkshopDetail.dart';
import 'package:gdg_school/seperator.dart';


class DetailPage extends StatelessWidget {
  
  final Workshop workshop;

  DetailPage(this.workshop);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
         title: new Text("Planet Detail"),
       ),
       body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            /*_getToolbar(context),*/
          ],
        ),
        ),
    );
  }

Container _getBackground () {
    return new Container(
            child: new Image.asset(workshop.picture,
              fit: BoxFit.cover,
              height: 300.0,
            ),
            constraints: new BoxConstraints.expand(height: 300.0),
          );
}

Container _getGradient() {
     return new Container(
       margin: new EdgeInsets.only(top: 190.0),
       height: 110.0,
       decoration: new BoxDecoration(
         gradient: new LinearGradient(
           colors: <Color>[
             new Color(0x00736AB7),
             new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
     final _overviewTitle = "Overview".toUpperCase();
       return new ListView(
         padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          WorkshopDetail(workshop,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle, 
                  style: new TextStyle(
                    fontFamily: 'GoogleSans',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400
                  )
                ),
                new Separator(),
                new Text(workshop.description, 
                  style: new TextStyle(
                    fontFamily: 'GoogleSans',
                    color: const Color(0xffb6b2df),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400
                  )
                ),
              ],
            ),
          ),
        ],
    );
  }
}
