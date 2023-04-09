import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app2/basics/News_App/News_cubit.dart';
import 'package:news_app2/basics/News_App/screens/web_view_screen.dart';

import '../../basics/News_App/screens/login_register/register.dart';
import '../../basics/News_App/screens/login_register/welcome page.dart';
import 'constants.dart';
Widget defaultTextField(
        {
        required TextEditingController Controller,
          required BuildContext context,
        required IconData icon_1,
          String? label,
        required Function validate,
          String? hint,
          Function? ONchange,
        bool ispassword = false,
        Function? suffix_1}) =>
    Card(
      color: Colors.white,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
        decoration: InputDecoration(
            prefixIcon: Icon(icon_1),
            suffixIcon: ispassword
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye,),
                    onPressed: (){
                      suffix_1??(){};
                    },
                  )
                : null,
            ///icon next to the tff but the prefix is inside it
            labelText: label??'',
          hintText: hint??''
        ),
        validator: (s){
          validate(s!);
        },
        onChanged: (s){ONchange!(s);},
        controller: Controller,
        obscureText: ispassword,
      ),
    );

///questions
///difference between TextFormField and textfield ?
///how to paint the border of the widget?
Widget defaultButton({
  double height = 50,
  double width = double.infinity,
  Color background = Colors.deepPurple,
  double radius = 5,
  bool IsUpper = true,
  required String text,
  Color text_color = Colors.white,
  double text_size = 20,
  required Function function,

}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        child: Text(
          IsUpper ? text.toUpperCase() : text,
          style: TextStyle(
              color: text_color,
              fontSize: text_size,
              fontWeight: FontWeight.bold),
        ),
        onPressed: (){
          function;
        },
      ),
    );

Widget newTFF({
  required TextEditingController textcontroller,
  bool visiable_off = false,
  Function? showPicker,
  bool suffix = false,
  IconData? TF_Icon = Icons.email,
  required TextInputType Keyboard_typing,
  String? label,
}) =>TextFormField(
  onTap: (){
    showPicker;
  },
  obscureText: visiable_off,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(TF_Icon),
    suffixIcon: suffix
        ? IconButton(
      icon: visiable_off
          ? const Icon(Icons.visibility)
          : const Icon(
        Icons.visibility_off,
        color: Colors.redAccent,
      ),
      onPressed: (){
        showPicker;
      },
    )
        : null,
    border: const OutlineInputBorder(),
  ),
  validator: (String? value){
    if(value!.isEmpty){
      return "required";
    }
    return null;
  },
  keyboardType:Keyboard_typing ,
);

Widget TFF({required TextEditingController tc,Function? tap,})=> TextFormField(
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
  ),
  controller: tc,
  onTap: (){
    tap;
  },


);
String dateAsString (String dateTime,int start,int end){

  List<String> date_1 = dateTime.split('');
  return (date_1.getRange(start, end)).toString();

}
dynamic News(List<Map> articles){
  List<Map> imgArticles=[];
  for(int i=0;i<= articles.length;i++){
    if(articles[i]['source']['name']!= 'Google News'){
      imgArticles.add(articles[i]);
    }
  }
  return imgArticles;
}
Widget Item(Map article,context) {
  return InkWell(
    onTap: (){
      NavigateTo(context, web_view_screen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //main image
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      article['urlToImage']??
                          'https://coffective.com/wp-content/uploads/2018/06/default-featured-image.png.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            height: 175,
            width: double.infinity,
          ),
          const SizedBox(
            height: 15,
          ),
          //title
          Text(
            article['title']??'no title',textDirection: News_cubit.get(context).isAR! ? TextDirection.rtl : TextDirection.ltr,
            style: Theme.of(context).textTheme.bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(radius: 15,child: Text(article['source']['name']=='Google News'|| article['source']['name']== null ? article['author'][0]:article['source']['name'][0]??'A',style: const TextStyle(fontWeight: FontWeight.bold),)),
              const SizedBox(width: 5,),
              Text(article['source']['name']=='Google News' || article['source']['name']==null? article['author']:article['source']['name'] ??'News',
                style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
              const Spacer(),
              Text(article['publishedAt'].toString().substring(0,10)??'No date',style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    ),
  );
}
Widget myDivider()=>Padding(
  padding: const EdgeInsets.only(left: 50,right: 50),
  child: Container(
    color: Colors.deepOrange,
    height: 3.0,
    width: double.infinity,
  ),
);
Widget articlebuilder(list,context,{bool isSearch = false}) =>ConditionalBuilder(
    condition:(list.isNotEmpty) ,
    builder: (context)=>ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Item(list[index],context),
        separatorBuilder: (context, index) =>myDivider(),
        itemCount: list.length),
    fallback: (context)=> !isSearch ?const Center(child:CircularProgressIndicator()): Container());
void NavigateTo(context,Widget){
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ));
}
void NavigateAndDelete(context,Widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) => Widget,
  ), (route) => false);
}
///news app components
Widget newsButton({required String text,double? height,double? width})=> Container(
  height: height,
  width: width,
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
    child: Text(text.toUpperCase(),
      style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
  ),
);
Widget text_field({required context,required IconData prefix_icon,required controller})=>Container(
  height: height(context)*0.06,
  width: width(context)*0.8,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.deepOrange.shade50,
  ),
  child: Center(
    child: TextFormField(
      style:Theme.of(context).textTheme.bodyText1,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(prefix_icon,color: Colors.deepOrange,),
      ),
      validator: (value){
        if(value!.isEmpty){
          return 'field must not be empty';
        }else{
          return '';
        }
      },
    ),
  ),
);
Widget screenBuilder({required context})=>Scaffold(
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
          ///welcome text
          const Text(
            'Welcome!',
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          SizedBox(height: height(context)*0.01,),
          ///sign in text
          const Text('Sign in to continue',
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: height(context)*0.1,),
          ///user field
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
          ///login button
          Align(
              alignment: Alignment.center,
              child: newsButton(text: 'Login',height: height(context)*0.06,width: width(context)*0.7)),
          ///forget password
          Align(alignment: Alignment.center,
              child: TextButton(onPressed: (){}, child: Text('Forget password?',style: TextStyle(),))),
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
          ///social media login
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
          ///have an ...... sign in
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ?"
                ,style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){
                NavigateTo(context, registerScreen());
              }, child: const Text("Sign up"
                ,style:  TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),))
            ],),

        ],
      ),
    ),
  ),
);