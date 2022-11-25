
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/conpunents/compunents.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';

class SearchScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).searchArticlesList;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App'
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Search'),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value){
                    list=[];
                    NewsCubit.get(context).gettsearch(value);
                  },
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: list.length>0,
                  builder: (BuildContext context)=> ListView.separated(
                      itemBuilder: (context, index) {
                        return buildArticlesItem(list[index], context);
                      },
                      separatorBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      itemCount: list.length
                  ),
                  fallback: (context)=>Container(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
