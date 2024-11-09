import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess
}) {
  switch(response.statusCode){
    case 200 :
    onSuccess();
    break;
    case 400:
    showSnackBar(context, json.decode(response.body)['msg'] , Colors.red);
    break;
    case 500:
    showSnackBar(context, json.decode(response.body)['error'], Colors.red);
    break;
    case 201:
    onSuccess();
    break;
  }
}

void showSnackBar(BuildContext context , String title , Color color){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title),backgroundColor: color,));
}