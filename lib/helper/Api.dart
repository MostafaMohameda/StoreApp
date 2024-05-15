import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Api {

  Future<dynamic> Get({required String Url,@required String? token}) async{
Map<String,String>headers={};
    if(token!=null){
      headers.addAll({
        'Authorization': 'Baerer$token',
      });
    }

    http.Response response =await http.get(Uri.parse(Url),headers:{
      'Content-Type': 'application/json; charset=UTF-8',
    },);

    if(response.statusCode==200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception('there are problem erorr ${response.statusCode}');
    }
    }

    Future<dynamic>post({required String Url,@required dynamic body,@required String? token, @required headers})async{
    Map<String,String> headers={};
    if(token!=null){
      headers.addAll({
        'Authorization': 'Baerer$token'
      });
    }
    http.Response response =await http.post(Uri.parse(Url),body: body,headers: headers);
    return jsonDecode(response.body);


    }

  Future<dynamic>put({required String Url,@required dynamic body,@required String? token, @required headers})async{
    Map<String,String> headers={};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if(token!=null){
      headers.addAll({
        'Authorization': 'Baerer$token'
      });
    }
    http.Response response =await http.put(Uri.parse(Url),body: body,headers: headers);
    return jsonDecode(response.body);


  }


}