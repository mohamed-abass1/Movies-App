 import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
 import 'package:http/http.dart' as http;
import 'package:movies_app1/core/cache/sha-pref.dart';


@singleton
class ApiManger {
Dio dio=Dio();
Future<Response> getMoviesList(){
  return dio.get('https://yts.mx/api/v2/list_movies.json?sort=seeds&limit=15');
}
Future<Response> get50MoviesList(){
  return dio.get('https://yts.mx/api/v2/list_movies.json?limit=50');
}
Future<Response> getMoviesDetails(String id){
  return dio.get('https://yts.mx/api/v2/movie_details.json?movie_id=$id');
}
Future<Response> getMoviesSuggest(String id){
  return dio.get('https://yts.mx/api/v2/movie_suggestions.json?movie_id=$id');
}
Future<Response> getMoviesSearch(String search){
  return dio.get('https://yts.mx/api/v2/list_movies.json?limit=50&query_term=$search');
}
Future<Response> register({ required Map<String, dynamic> data}) async{

  print("TYPE: ${data.runtimeType}");
  return dio.post(
    'https://route-movie-apis.vercel.app/auth/register',
    data: data,
    options: Options(
      validateStatus: (status) => true,
      headers: {
        "Content-Type": "application/json",
      },
    ),

  );
}
static Future<http.Response> Register (String name,String password,String rePassword,String email,String phone,avatar) async {
Uri url=Uri.https('route-movie-apis.vercel.app','auth/register');
return await http.post(url,body: jsonEncode({
  "name":name,
  "email":email,
  "password":password,
  "confirmPassword":rePassword,
  "phone":phone,
  "avaterId":avatar
}));
}
static Future<http.Response> logIn (String email,String password) async {
  Uri url=Uri.https('route-movie-apis.vercel.app','auth/login');
  return await http.post(url,body: {

      "email":email,
      "password":password}
  );
}

Future<Response> addToFavourite(String imageURL,  String year,String movieId,int rating,String name) async{
 var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.post(
    'https://route-movie-apis.vercel.app/favorites/add',
    data: {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageURL,
      "year": year
    },
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}
Future<Response> getFavourite() async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.get(
    'https://route-movie-apis.vercel.app/favorites/all',
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}
Future<Response> getProfile() async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  print(token);
  return dio.get(
    'https://route-movie-apis.vercel.app/profile',
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}

Future<Response> updateProfile(String email,num? avatar) async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.patch(
    data: {
      "email":email,
      "avaterId":avatar
    },
    'https://route-movie-apis.vercel.app/profile',
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}
Future<Response> resetPassword({ required String oldPassword,required String newPassword}) async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.patch(
    'https://route-movie-apis.vercel.app/auth/reset-password',
    data: {
      "oldPassword":oldPassword,
      "newPassword":newPassword
    },
    options: Options(
      validateStatus: (status) => true,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json",
      },
    ),

  );
}
Future<Response> IsFavourite(String movieId) async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.get(
    'https://route-movie-apis.vercel.app/favorites/is-favorite/${movieId}',
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}
Future<Response> RemoveFavourite(String movieId) async{
  var token= SharedPreferenceUtils.getData(key: 'token');
  return dio.delete(
    'https://route-movie-apis.vercel.app/favorites/remove/${movieId}',
    options: Options(
      validateStatus: (status) => true,
      headers: { 'Authorization': 'Bearer $token',},
    ),

  );
}





}