import 'package:flutter/material.dart';
///validate function of button
validate(var key){
  if(key.currentState!.validate){
    print("validated");
  }else{
    print("not validated");
  }

}
String? field_validate(String value){
  if(value.isEmpty){
    return 'field must not be empty';
  }else{
    return '';
  }
}
double height (context){
  return MediaQuery.of(context).size.height;
}
double width (context){
  return MediaQuery.of(context).size.width;
}

//base url
//https://newsapi.org
//method
// /v2/everything
//queries
//https://newsapi.org/v2/everything?q=tesla&from=2022-12-04&sortBy=publishedAt&apiKey=6b0f507491054ae4aadabe764c079a7c