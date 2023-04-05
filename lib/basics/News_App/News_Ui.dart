import 'package:news_app2/basics/News_App/News_cubit.dart';
import 'package:news_app2/basics/News_App/News_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:news_app2/basics/News_App/screens/search_screen.dart';
import 'package:news_app2/shared/components/components.dart';
class newsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<News_cubit,News_States>(
      listener: (BuildContext context,News_States){
      },
      builder: (BuildContext context,News_States){
        News_cubit cubit = News_cubit.get(context);
        //important to put here
        return Scaffold(
          ///drawer
            /*drawer :Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 500,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                        ),
                        child: Text('News App'),
                      ),
                      ListTile(
                        title: const Text('Item 1'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                      ListTile(
                        title: const Text('Item 2'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),*/
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              ///lang
               Padding(
                padding: const EdgeInsets.only(right: 7),
                //language
                child: InkWell(
                  onTap: (){
                    News_cubit.get(context).changeLang();
                  },
                  child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.deepOrange,
                      child: Text(News_cubit.get(context).isAR!?'EN':'AR',
                        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              ///brightness
               Padding(
                padding: const EdgeInsets.only(right: 7),
                child: InkWell(
                  onTap: (){
                    News_cubit.get(context).changeMode();
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.brightness_4_outlined,color: Colors.white,)
                  ),
                ),
              ),
              ///search
               Padding(
                padding: EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: (){
                    NavigateTo(context,search_screen());
                  },
                  child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.search,color: Colors.white,)
                  ),
                ),
              ),


            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:
          SnakeNavigationBar.color(
            snakeViewColor: Colors.deepOrange,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            /*type: BottomNavigationBarType.shifting,
            unselectedIconTheme: const IconThemeData(size: 25),
            iconSize: 35,*/
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.white,
            elevation: 0,
            unselectedItemColor: Colors.grey,
            onTap: (index){
              cubit.ChangeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.currency_exchange),label: 'Business'),
              BottomNavigationBarItem(icon: Icon(Icons.sports_soccer_outlined),label: 'Sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),

            ],
          ),
        );
      },
    );
  }
}
