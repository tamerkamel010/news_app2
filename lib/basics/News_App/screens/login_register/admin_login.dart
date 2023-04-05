import 'package:flutter/material.dart';
import 'package:news_app2/basics/News_App/News_Ui.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:news_app2/shared/components/constants.dart';

class Admin_login extends StatefulWidget {
  @override
  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
  @override
  var form_key = GlobalKey<FormState>();

  var person_cont = TextEditingController();

  var password_cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: form_key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text_field(context: context,prefix_icon: Icons.person,controller: person_cont),
              SizedBox(height: height(context)*0.03,),
              text_field(context: context,prefix_icon: Icons.lock,controller: password_cont),
              SizedBox(height: height(context)*0.03,),
              ElevatedButton(onPressed: (){
               if(person_cont.text.toString() == 'tamer'&& password_cont.text.toString() =='123'){
                 NavigateAndDelete(context, newsHome());
               }
              }, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
