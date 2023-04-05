import 'package:flutter/material.dart';
import 'package:news_app2/basics/News_App/screens/login_register/admin_login.dart';
import 'package:news_app2/basics/News_App/screens/login_register/login_screen.dart';
import 'package:news_app2/basics/News_App/screens/login_register/register.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:news_app2/shared/components/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             SizedBox(height: height(context)*0.06,),
            const Image(image: AssetImage('assets/welcome_logo.png')),
              SizedBox(height: height(context)*0.2,),
              ///login button
              InkWell(
                onTap: (){
                  NavigateTo(context, login_screen());
                },
                child: Container(
                  height: height(context)*0.07,
                  width: width(context)*0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.deepOrange
                    ]

                    )
                  ),
                  child: Center(
                    child: Text('login'.toUpperCase(),
                      style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              SizedBox(height: height(context)*0.03,),
              ///sign up button
              InkWell(
                onTap: (){
                  NavigateTo(context, registerScreen());
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: height(context)*0.07,
                      width: width(context)*0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.deepOrange
                              ]
                          ),
                      ),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: SizedBox(
                        height: height(context)*0.07-6,
                        width: width(context)*0.7-6,
                        child: Center(
                          child: Text('Sign up'.toUpperCase(),
                            style:  TextStyle(color: Colors.deepOrange.shade900,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height(context)*0.02,),
              TextButton(onPressed: (){
                NavigateTo(context,Admin_login());
              }, child: const Text('login as admin',style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
