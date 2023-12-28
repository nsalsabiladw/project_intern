import '../response/post_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService{
Future<PostResponse?> getPosts() async{
  try{
    final response = await Dio().get('https://reqres.in/api/users?page=1&per_page=10');
    debugPrint('GET POST : ${response.data['data']}');
    return PostResponse.fromRegres(response.data['data']);

  }on DioException catch(e){
    debugPrint(e.toString());
  }
}
}