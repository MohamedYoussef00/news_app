
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/business/business_screan.dart';
import 'package:newsapp/modules/science/science_screan.dart';
import 'package:newsapp/modules/sports/sportes_screan.dart';
import 'package:newsapp/network/cash_helper/cash_helper.dart';

import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context)=>BlocProvider.of(context);

  List<Widget> screans=[
    BusinessScrean(),
    SportesScrean(),
    ScineceScrean()
  ];

  List<String> appBarName=[
    'Business',
    'Sportes',
    'Scinece'
  ];
   int currentIndex=0;

   void changeNavBarIndex(index){
     currentIndex=index;
     emit(ChangeNavBarState());
   }

   List<dynamic> businessArticlesList=[];

   void getBusiness(){
     emit(BusinessLodingState());

     if (businessArticlesList.length==0){
       DioHelper.getData(
           url: 'v2/top-headlines',
           query: {
             'country':'eg',
             'category':'business',
             'apiKey':'49d14dfa81ae43d9a7819330b38d1d57',
           }).then((value){
         print (value.data.toString());
         businessArticlesList=value.data['articles'];
         print (businessArticlesList[0]['title']+"lllllllllllllllllllllllllllllllllllllllllllllll");
         emit(BusinessGetState());
       }).catchError((error){
         print(error.toString());
         emit(BusinessErorrState(error.toString()));
       });
     }else{
       emit(BusinessGetState());
     }

   }

  List<dynamic> sportsArticlesList=[];

  void getSports(){

    emit(SportsLodingState());
    if(sportsArticlesList.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'49d14dfa81ae43d9a7819330b38d1d57',
          }).then((value){
        print (value.data.toString());
        sportsArticlesList=value.data['articles'];

        emit(SportsGetState());
      }).catchError((error){
        print(error.toString());
        emit(SportsErorrState(error.toString()));
      });
    }else{
      emit(SportsGetState());
    }
  }

  List<dynamic> scienceArticlesList=[];

  void gettScince(){
    emit(ScienceLodingState());
   if(scienceArticlesList.length==0){
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country':'eg',
           'category':'science',
           'apiKey':'49d14dfa81ae43d9a7819330b38d1d57',
         }).then((value){
       print (value.data.toString());
       scienceArticlesList=value.data['articles'];
       print (businessArticlesList[0]['title']+"lllllllllllllllllllllllllllllllllllllllllllllll");
       emit(ScienceGetState());
     }).catchError((error){
       print(error.toString());
       emit(ScienceErorrState(error.toString()));
     });
   }else{
     emit(ScienceGetState());
   }
  }

  List<dynamic> searchArticlesList=[];

  void gettsearch(String data){
    searchArticlesList=[];
    emit(SearchLodingState());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':'$data',
            'apiKey':'49d14dfa81ae43d9a7819330b38d1d57',
          }).then((value){
        print (value.data.toString());
        searchArticlesList=value.data['articles'];
        emit(SearchGetState());
      }).catchError((error){
        print(error.toString());
        emit(SearchErorrState(error.toString()));
      });

  }

  bool isDark=true;
  void changeAppMode( {bool fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
      emit(ChangeAppMode());
    }else{
      isDark=!isDark;
      CashHelper.putData(key: 'IsDark', value: isDark)
          .then((value){
            emit(ChangeAppMode());
          }
      );
    }


    }

}