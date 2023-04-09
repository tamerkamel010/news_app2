import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/basics/News_App/News_cubit.dart';
import 'package:news_app2/basics/News_App/News_states.dart';
import 'package:news_app2/shared/components/Bloc_observer.dart';
import 'package:news_app2/shared/network/local/shared_pref.dart';
import 'package:news_app2/shared/network/remote/dioHelper.dart';
import 'package:page_transition/page_transition.dart';
import 'basics/News_App/screens/login_register/welcome page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dio_Helper.init();
  await shared_pref.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///..getsports and ..getscience after getbusiness ,it download all of the data in  3 of them
        ///
        BlocProvider(
          create: (BuildContext context) => News_cubit()..getBusinessData()..getScienceData()..getSportsData(),
        ),
      ],
      child: BlocConsumer<News_cubit, News_States>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          //News_cubit.get(context).isDark ?? false;
          return MaterialApp(
            themeMode: News_cubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.white,
                elevation: 0.0,
              ),
            ),
            darkTheme: ThemeData(
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(),
                  fillColor:Colors.grey,
                  labelStyle: TextStyle(color: Colors.grey),
                  iconColor: Colors.grey,
                  hintStyle: TextStyle(color: Colors.grey) ,

                ),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                  backgroundColor: Colors.black12,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                scaffoldBackgroundColor: Colors.black12,
                textTheme: const TextTheme(
                  caption: TextStyle(decorationColor: Colors.grey),
                  bodyText1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black26,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  color: Colors.black26,
                  elevation: 0.0,
                )),
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              duration: 2000,
              splash: Container(
                decoration: const BoxDecoration(
                  //shape: BoxShape.circle,
                  color: Colors.deepOrange,
                ),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image:AssetImage('assets/news_app.png'))
                    ),
                  )),
              nextScreen: WelcomeScreen(),
              splashTransition: SplashTransition.slideTransition,
              pageTransitionType: PageTransitionType.fade,
              backgroundColor: Colors.deepOrange,
            ),
            title: "News",
          );
        },
      ),
    );
  }
}
