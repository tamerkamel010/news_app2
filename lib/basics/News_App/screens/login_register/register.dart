import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app2/basics/News_App/screens/login_register/login_screen.dart';
import 'package:news_app2/basics/News_App/screens/login_register/welcome%20page.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';

class registerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: (){
              NavigateTo(context, WelcomeScreen());
            },
            icon:const Icon(Icons.arrow_back_sharp,color: Colors.black,size: 30,weight:100,)),
        elevation: 0,
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SizedBox(height: height(context)*0.04,),
              ///Hi text
              const Text(
                'Hi!',
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: height(context)*0.01,),
              ///Create a new account
              const Text('Create a new account',
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: height(context)*0.04,),
              Container(
                height: height(context)*0.06,
                width: width(context)*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange.shade50,
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person,color: Colors.deepOrange,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(context)*0.05,),
              ///email field
              Container(
                height: height(context)*0.06,
                width: width(context)*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange.shade50,
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.deepOrange,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height(context)*0.05,),
              ///password field
              Container(
                height: height(context)*0.06,
                width: width(context)*0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange.shade50,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline_rounded,color: Colors.deepOrange,),
                  ),
                ),
              ),
              SizedBox(height: height(context)*0.08,),
              ///Sign Up button
              Align(
                  alignment: Alignment.center,
                  child: newsButton(text: 'SIGN UP',height: height(context)*0.06,width: width(context)*0.7)),
              SizedBox(height: height(context)*0.03,),
              ///or and the two lines
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width(context)*0.4,
                      height: 2,
                      color: Colors.deepOrange,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text('or',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,
                      fontSize: 20
                      ),),
                    ),
                    Container(
                      width: width(context)*0.4,
                      height: 2,
                      color: Colors.deepOrange,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height(context)*0.03,),
              const Align(
                  alignment: Alignment.center,
                  child: Text('Social Media Login',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)),
              SizedBox(height: height(context)*0.01,),
              ///sign by social media
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {  }, icon: Icon(FontAwesomeIcons.google,color: Colors.deepOrange,size: 30.0),
                  ),
                  IconButton(onPressed: () {  }, icon: Icon(FontAwesomeIcons.facebook,color: Colors.deepOrange,size: 30.0),
                  ),
                  IconButton(onPressed: () {  }, icon: Icon(FontAwesomeIcons.apple,color: Colors.deepOrange,size: 30.0),
                  ),
                ],
              ),
              SizedBox(height: height(context)*0.02,),
              ///already ..... sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"
                    ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                  TextButton(onPressed: (){
                    NavigateTo(context, login_screen());
                  }, child: const Text("Sign in"
                    ,style: TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),))
                ],),

            ],
          ),
        ),
      ),
    );
  }
}
