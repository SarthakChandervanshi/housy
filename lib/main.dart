import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:housy/animation.dart';
import 'package:housy/route.dart';
import 'package:hexcolor/hexcolor.dart';

import 'notes.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      title: "Housy",
      debugShowCheckedModeBanner: false,
      home: Home(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> c1 = ["#f7ba2c","#6274e7","#2feaa8"];
  List<String> c2 = ["#ea5459","#8752a3","#028cf3"];

  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        // padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor(c1[current_index]),
              HexColor(c2[current_index]),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FaIcon(FontAwesomeIcons.barsStaggered,color: Colors.white,size: 20,),
                  Text("TODO",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  FaIcon(FontAwesomeIcons.magnifyingGlass,color: Colors.white,size: 20,),
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 50,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black12, spreadRadius: 3,offset: Offset(1,3))],
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child:Image.network("https://i.pinimg.com/736x/7e/20/51/7e2051972bd0ffe64b7d2ebbaf57057f.jpg",height: 100,width: 100,fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Text("Hello, Jane.",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w400),),
                          SizedBox(height: 13,),
                          Text("Looke like feel good",style: TextStyle(color: Colors.white60,fontSize: 17,fontWeight: FontWeight.w400),),
                          SizedBox(height: 5,),
                          Text("You have 3 tasks to do today.",style: TextStyle(color: Colors.white60,fontSize: 17,fontWeight: FontWeight.w400),),
                          SizedBox(height: 40,),
                          Text("TODAY : JUNE 14, 2022",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w700,fontSize: 15),),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    CarouselSlider(
                      items: [
                        GestureDetector(
                          child: Container(
                            height: 350,
                            width: 270,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12, spreadRadius: 5,offset: Offset(2,7),blurStyle: BlurStyle.normal)],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20.3,
                                      child: CircleAvatar(
                                        child: Icon(Icons.person,color: Colors.orange,size: 20,),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.more_vert,color: Colors.grey,size: 20,),
                                  ],
                                ),
                                SizedBox(height: 200,),
                                Text("9 Tasks",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text("Personal",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.w600),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey[200],
                                        valueColor: AlwaysStoppedAnimation(Colors.orange),
                                        value: 0.6,
                                      ),
                                    ),
                                    Text("60%",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onVerticalDragUpdate: (details){
                            int sensitivity = 5;
                            if(details.delta.dy < -sensitivity){
                              Navigator.push(context, CustomAnimation(widget: Notes(current_index)));
                            }
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 350,
                            width: 270,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12, spreadRadius: 5,offset: Offset(2,7),blurStyle: BlurStyle.normal)],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20.3,
                                      child: CircleAvatar(
                                        child: Icon(Icons.person,color: Colors.purple,size: 20,),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.more_vert,color: Colors.grey,size: 20,),
                                  ],
                                ),
                                SizedBox(height: 200,),
                                Text("6 Tasks",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text("Work",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.w600),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey[200],
                                        valueColor: AlwaysStoppedAnimation(Colors.purple),
                                        value: 0.4,
                                      ),
                                    ),
                                    Text("40%",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onVerticalDragUpdate: (details){
                            int sensitivity = 5;
                            if(details.delta.dy < -sensitivity){
                              Navigator.push(context, CustomAnimation(widget: Notes(current_index)));
                            }
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 350,
                            width: 270,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black12, spreadRadius: 5,offset: Offset(2,7),blurStyle: BlurStyle.normal)],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 20.3,
                                      child: CircleAvatar(
                                        child: Icon(Icons.person,color: Colors.greenAccent,size: 20,),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.more_vert,color: Colors.grey,size: 20,),
                                  ],
                                ),
                                SizedBox(height: 200,),
                                Text("2 Tasks",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w500),),
                                SizedBox(height: 5,),
                                Text("Home",style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.w600),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey[200],
                                        valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
                                        value: 0.82,
                                      ),
                                    ),
                                    Text("82%",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onVerticalDragUpdate: (details){
                            int sensitivity = 5;
                            if(details.delta.dy < -sensitivity){
                              Navigator.push(context, CustomAnimation(widget: Notes(current_index)));
                            }
                          },
                        ),
                      ],
                      options: CarouselOptions(
                        height: 350,
                        autoPlay: false,
                        viewportFraction: 0.7,
                        enableInfiniteScroll: false,
                        onPageChanged: (index,reason){
                          setState((){
                            current_index = index;
                            print(index);
                          });
                        },
                        padEnds: true,

                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

