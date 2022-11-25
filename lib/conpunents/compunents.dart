
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/modules/webview/web_view_screan.dart';

Widget buildArticlesItem(artical,context)=>InkWell(
  onTap: (){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>WebViewScraen(artical['url'])
        )
    );
  },
  child:   Padding(
    padding: const EdgeInsets.all(15.0),

    child: Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                image: NetworkImage(artical['urlToImage'].toString()),

                fit: BoxFit.cover,

              )

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child:Column(

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(

                  artical['title'].toString(),

                  style: Theme.of(context).textTheme.bodyText1,

                  maxLines: 3,

                  overflow: TextOverflow.ellipsis,

                ),

                SizedBox(

                  height: 10.0,

                ),

                Text(

                  artical['publishedAt'].toString(),

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ) ,

          ),

        ),



      ],

    ),

  ),
);