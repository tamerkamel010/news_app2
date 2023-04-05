import 'package:news_app2/basics/News_App/News_cubit.dart';
import 'package:news_app2/basics/News_App/News_states.dart';
import 'package:news_app2/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_cubit,News_States>(
      listener: (context,state){},
      builder: (context,state){
        var Science = News_cubit.get(context).science;
        return articlebuilder(Science,context);
      },
    );
  }

}