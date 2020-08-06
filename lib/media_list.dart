import 'package:flutter/material.dart';
import 'package:videos/common/HttpHandler.dart';
import 'package:videos/model/Media.dart';
import 'package:videos/media_list_item.dart';



class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {

  List<Media> _media = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  void loadMovies() async{

    var movies = await HttpHandler().fetchMovies();

    setState(() {
      _media.addAll(movies); 
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index){
         //Este codigo es para consumir directamente en este widget
          /*return new Column(
            children: <Widget>[
              
              new Image.network(_media[index].getPosterUrl())

            ],
          );*/

          return new MediaListItem(_media[index]);
        },

      ),
    );
  }
}
