 import 'dart:async';
 import 'package:http/http.dart' as http;
 import 'dart:convert';
 import 'package:videos/common/Constants.dart';
 import 'package:videos/model/Media.dart';

 class HttpHandler{

   final String _baseUrl = "api.themoviedb.org";
   final String _lenguaje = "es-ES";

   Future<dynamic> getJson(Uri uri) async{

     http.Response response = await http.get(uri);
     //return json.decode(response.body).toString();
     return json.decode(response.body);

   }

   //Future<String> fetchMovies(){
   Future<List<Media>> fetchMovies(){


     var uri = new Uri.http(_baseUrl, "3/movie/popular",{'api_key' : API_KEY, 'page' : "1" , 'lenguaje' : _lenguaje });

     //return getJson(uri).then((data) => data.toString());

     return getJson(uri).then((data) =>  data['results'].map<Media>((item) => new Media(item)).toList());

   }




 }

