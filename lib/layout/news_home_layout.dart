
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/search/search_screan.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(BuildContext context,NewsStates state){},
      builder: (BuildContext context,NewsStates state){
        NewsCubit Cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text(
              'News App'
             // Cubit.appBarName[Cubit.currentIndex]
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) =>  SearchScrean())
                 );
                 // Cubit.getBusiness();
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  Cubit.changeAppMode();
                },
              )
            ],
          ),
          body: Cubit.screans[Cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_center),
                  label: 'Business'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports),
                  label: 'Sport'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science),
                  label: 'Science'
              ),
            ],
            onTap:(index){
              Cubit.changeNavBarIndex(index);
            },
          ),
        );
      },
    );
  }
}
