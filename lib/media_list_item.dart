import 'package:flutter/material.dart';
import 'package:videos/model/Media.dart';

class MediaListItem extends StatelessWidget {

  final Media media;
  MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(

        children: <Widget>[
          Container(
            child: new Stack(
          children: <Widget>[

            //imagen
            new FadeInImage.assetNetwork(
              placeholder: "assets/placeholder.jpg",
              image: media.getBackDropUrl(),
              fit: BoxFit.cover,width: double.infinity ,
              fadeInDuration: new Duration(milliseconds: 40),
              height: 200.0),

            //Franja de informacion
            new Positioned(left: 0.0, bottom: 0.0,right: 0.0,
              child: new Container(
                decoration: new BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
                constraints: new BoxConstraints.expand(height: 55.0)
              )
            ),

            //Colocar Informacion

            new Positioned(left: 10.0, bottom: 10.0,
              child: new Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  new Container(
                    child: new Text(
                      media.title,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),

                  new Container(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Text(
                      media.getGenres(),
                      style: new TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )

                ],
              ),
            )

            ]
          )
          )

        ],

      ),
    );
  }
}