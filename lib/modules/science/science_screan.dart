
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../conpunents/compunents.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ScineceScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context, state) {
          NewsCubit.get(context).gettScince();
          var list=NewsCubit.get(context).scienceArticlesList;
          return ConditionalBuilder(
            condition: list.length>0,
           // condition: state is !ScienceLodingState,
            builder: (BuildContext context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticlesItem(list[index],context),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              itemCount: list.length,
            ),
            fallback:(context)=>Center (child:CircularProgressIndicator()) ,
          );
        }
    );

  }
}