abstract class News_States {
}
class IntialState extends News_States{}
class ChangeBottomNavBarState extends News_States{}
class ChangeLanguage extends News_States{}
class loadingDataState extends News_States{}
class GetDataOfBusinessSuccessState extends News_States{}
class loadingBusinessState extends News_States{}
class changeModeState extends News_States{}
class errorBusinessState extends News_States{
  String error;
  errorBusinessState(this.error);
}
///SportsData
class GetDataOfSportsSuccessState extends News_States{}
class loadingSportsState extends News_States{}
class errorSportssState extends News_States{
  String error;
  errorSportssState(this.error);
}
///search
class GetDataOfSearchSuccessState extends News_States{}
class loadingSearchState extends News_States{}
class errorSearchState extends News_States{
  String error;
  errorSearchState(this.error);
}
///science
class GetDataOfScienceSuccessState extends News_States{}
class loadingScienceState extends News_States{}
class errorScienceState extends News_States{
  String error;
  errorScienceState(this.error);
}


