import 'dart:convert';
import 'package:e_shopping/global_variables.dart';
import 'package:e_shopping/models/user.dart';
import 'package:e_shopping/services/manage_http_response.dart';
import 'package:e_shopping/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AuthController {
  Future<void> signUpUsers({
    required BuildContext context,
    required String email,
    required String fullName,
    required String password
  }) async {
    try{
      User user = User(
        id: '', 
        fullName: fullName, 
        email: email, 
        state: '', 
        city: '', 
        locality: '', 
        password: password,
        token: ''
        );
      http.Response response = await http.post(Uri.parse('$uri/api/signup'),
      body:user.toJson(),
      headers: <String , String> {
        "Content-Type" : "application/json; charset=UTF-8"
      }
      );
      
      manageHttpResponse(response: response, context: context, onSuccess: (){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => const MainScreen()), (Route<dynamic> route) => false);
        showSnackBar(context, 'Account created successfully',Colors.green);
      });
    } catch (e) {
      debugPrint("Error:$e");
    }
  }


  Future<void> signinUsers({
    required BuildContext context,
    required String email,
    required String password,
  }) async{

    try{
     http.Response response =  await http.post(Uri.parse('$uri/api/signin'),
      body: jsonEncode({
        'email' : email,
        'password' : password,
      }),
      headers: <String , String>{
        'Content-Type' : 'application/json; charset=UTF-8'
      }
      );
      manageHttpResponse(response: response, context: context, onSuccess: (){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => const MainScreen()), (Route<dynamic> route) => false);
        showSnackBar(context, 'Logged in',Colors.green);
      });
    } catch (e) {
      debugPrint("Error:$e");
      showSnackBar(context, 'Please register', Colors.red);
    }

  }
}