import 'package:news_app2/basics/News_App/News_states.dart';
import 'package:news_app2/basics/News_App/screens/business.dart';
import 'package:news_app2/basics/News_App/screens/science.dart';
import 'package:news_app2/basics/News_App/screens/sports.dart';
import 'package:news_app2/shared/network/local/shared_pref.dart';
import 'package:news_app2/shared/network/remote/dioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
class News_cubit extends Cubit<News_States>{
  News_cubit():super(IntialState());
  static News_cubit get(context) => BlocProvider.of(context);
  int currentIndex =0;
  List<Widget> screens = [
    business(),
    sports(),
    Science(),
  ];
  void ChangeIndex(int index){
    currentIndex = index;
    if(currentIndex == 1)getSportsData();
    if(currentIndex == 2)getScienceData();

    emit(ChangeBottomNavBarState());
  }
  ///it will be english in default to avoid null value
  ///if there is no saved value in the shared preferences file
  @required bool? isAR = shared_pref.getbool(key: 'isAR') ?? true;
  void changeLang(){
    isAR = !isAR!;
    shared_pref.putbool(key: 'isAR', value: isAR).then((value){
      getBusinessData();
      getSportsData();
      getScienceData();
      emit(ChangeLanguage());
      print(value.toString());
    });
  }
///change theme
  @required bool isDark = shared_pref.getbool(key: 'isDark') ?? true;
  void changeMode(){
    isDark = !isDark;
    shared_pref.putbool(key: 'isDark', value: isDark).then((value){
      emit(changeModeState());
    });
  }
///business
  List<dynamic> Business =[];
  void getBusinessData(){
    emit(loadingBusinessState());
    Dio_Helper.getData(url:'v2/top-headlines' ,query: {
      'country':isAR! ? 'eg' :'us',
      'category':'business',
      'apiKey':'6b0f507491054ae4aadabe764c079a7c',

    }).then((value) {
      Business = value.data['articles'];
      print(Business.toString());
      emit(GetDataOfBusinessSuccessState());
    }).catchError((error){
      emit(errorBusinessState(error.toString()));
      print('$error');});
  }
  ///search
  List<dynamic> Search =[];
  void getSearchData(String value){
    Search= [];
    emit(loadingSearchState());
    Dio_Helper.getData(url:'v2/everything' ,query: {
      'q':value,
      'apiKey':'6b0f507491054ae4aadabe764c079a7c',

    }).then((value) {
      Search= [];
      Search = value.data['articles'];
      print(Search.toString());
      emit(GetDataOfSearchSuccessState());
    }).catchError((error){
      emit(errorSearchState(error.toString()));
      print('$error');});
  }
///sports
  List<dynamic> Sports =[];
  void getSportsData(){
    emit(loadingSportsState());
    Dio_Helper.getData(url:'v2/top-headlines' ,query: {
      'country':isAR! ? 'eg' :'us',
      'category':'sports',
      'apiKey':'6b0f507491054ae4aadabe764c079a7c',

    }).then((value) {
      Sports = value.data['articles'];
      print(Sports.toString());
      emit(GetDataOfSportsSuccessState());
    }).catchError((error){
      emit(errorSportssState(error.toString()));
      print('$error');});
  }
///science
  List<dynamic> science =[];
  List<dynamic> science_1 =[];///to prevent google news
  void getScienceData(){
    emit(loadingScienceState());
    Dio_Helper.getData(url:'v2/top-headlines' ,query: {
      'country':isAR! ? 'eg' :'us',
      'category':'science',
      'apiKey':'6b0f507491054ae4aadabe764c079a7c',

    }).then((value) {
      science_1 =[];
      science = value.data['articles'];
      for(int i =0;i<=science.length;i++){
        if(science[i]['source']['name']!= 'Google News'){
          science_1.add(science[i]);
        }
      }
      print(science_1.toString());
      emit(GetDataOfScienceSuccessState());
    }).catchError((error){
      emit(errorScienceState(error.toString()));
      print('$error');});
  }

}


