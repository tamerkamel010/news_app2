import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/basics/News_App/News_cubit.dart';
import 'package:news_app2/basics/News_App/News_states.dart';
import 'package:news_app2/shared/components/components.dart';

class search_screen extends StatelessWidget {
  var search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: BlocConsumer<News_cubit,News_States>(
        listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: defaultTextField(
                      Controller: search_controller,
                      icon_1: Icons.search,
                      hint: 'Type something ....',
                      validate: (String value){
                        if(value.isEmpty){
                          return 'You should type something';
                        }else{
                          return null;
                        }
                      },
                      ONchange: (String value){
                       News_cubit.get(context).getSearchData(value);
                      }
                  ),
                ),
              Expanded(child: articlebuilder(News_cubit.get(context).Search,context)),
              ],
            );
          }
      ),
    );
  }
}
