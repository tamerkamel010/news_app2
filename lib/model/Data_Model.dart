import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel {
  final int ID;
  final String name;
  final String Phone;

  UserModel(
    @required this.ID,
    @required this.name,
    @required this.Phone,
  );
}

class Users_Screen extends StatelessWidget {
  List<UserModel> users =[
    UserModel(1, "Tamer Kamel", "+201029092799"),
    UserModel(2, "Hamdy Kamel", "+201123492799"),
    UserModel(3, "Ali Kamel", "+201015972799"),
    UserModel(4, "ola hKamel", "+201021232799"),
    UserModel(5, "Tamer Ali", "+201025992799"),
    UserModel(6, "yassin Kamel", "+201020092799"),
    UserModel(18, "Tamer jamal", "+201012345799"),
    UserModel(9, "Tamer alaa", "+201029012399"),
    UserModel(10, "Tamer sultan", "+201029987799"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) => ContactItem(users[index]),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: users.length)),
    );
  }

  Widget ContactItem(UserModel user) => Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Text(
                  "${user.ID}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Text(
                      "${user.Phone}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              /*Expanded(child: Container()),*/
              CircleAvatar(child: Icon(Icons.email,color: Colors.lightGreen,),
                backgroundColor: Colors.white,),
              SizedBox(width: 10,),
              CircleAvatar(child: Icon(Icons.call,color: Colors.lightGreen,),
                backgroundColor: Colors.white,),
            ],
          ),
        ),
      );
}

///build item
///build list
///add item to list "sync"
