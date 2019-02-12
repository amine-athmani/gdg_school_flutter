import 'package:gdg_school/workshop.dart';
import 'package:flutter/material.dart';
import 'package:gdg_school/DetailPage.dart';
import 'package:gdg_school/seperator.dart';

class WorkshopDetail extends StatelessWidget {

  final Workshop workshop;
  final bool horizontal;

  WorkshopDetail(this.workshop, {this.horizontal = true});

  WorkshopDetail.vertical(this.workshop): horizontal = false;


  @override
  Widget build(BuildContext context) {

    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
          tag: "planet-hero-${workshop.id}",
          child: new Image(
              image: new AssetImage(workshop.asset),
              height: 92.0,
              width: 92.0,
            ),
      ),
    );



    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(image, height: 12.0),
            new Container(width: 8.0),
            new Text(workshop.title,
              style: new TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 9.0,
                color: const Color(0xffb6b2df),
                fontWeight: FontWeight.w400
              ),
            ),
          ]
        ),
      );
    }


    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(workshop.title, 
            style: new TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ), 
          ),
          new Container(height: 10.0),
          new Text(workshop.author,
            style: new TextStyle(
                fontFamily: 'GoogleSans',
                fontSize: 14.0,
                color: const Color(0xffb6b2df),
                fontWeight: FontWeight.w400
              ), 
          ),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: workshop.asset,
                  image: 'assets/images/ic_distance.png')

              ),
              new Container (
                width: 32.0,
              ),
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                  value: workshop.asset,
                  image: 'assets/images/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );


    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
        ? new EdgeInsets.only(left: 46.0)
        : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(workshop),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
              ) ,
            )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      )
    );
  }
}