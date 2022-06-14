import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'add.dart';
import 'animation.dart';

class Notes extends StatefulWidget {
  int current_index;
  Notes(this.current_index,{Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  List<bool> initial_value = List.generate(10, (index) => false);
  List<String> todos = ["Meeting with clients", "Developing new skills", "Finishing chores", "Taking wife to dinner","Planning outing next week !!!","Meeting with clients", "Developing new skills", "Finishing chores", "Taking wife to dinner","Planning outing next week !!!"];
  List<bool> work = [true,false,false,true,false,true,false,false,true,false];
  List<String> c1 = ["#f7ba2c","#6274e7","#2feaa8"];
  List<String> c2 = ["#ea5459","#8752a3","#028cf3"];
  List<Color> c3 = [Colors.orange,Colors.purple,Colors.greenAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(context, CustomAnimation(widget: Add(widget.current_index)));
            setState((){
              print(result);
              result.forEach((x) => {
                if(x.runtimeType == bool){
                  work.add(x),
                }
                else if(x.runtimeType == String){
                  todos.add(x),
                  initial_value.add(false),
              }
              });
            });

          },
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  HexColor(c1[widget.current_index]),
                  HexColor(c2[widget.current_index])
                ],
              ),
            ),
              child: Icon(Icons.add,color: Colors.white,size: 30,),
          ),
          splashColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.grey,size: 20,)),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.more_vert,color: Colors.grey,size: 20,)),
            ],
          ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left:50 ,right: 50),
                children:[
                  // crossAxisAlignment: CrossAxisAlignment.start,
                    SizedBox(height: 40,),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20.5,
                      child: CircleAvatar(
                        child: Icon(Icons.card_travel_rounded,color: c3[widget.current_index],size: 20,),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("9 Tasks",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 17),),
                    SizedBox(height: 10,),
                    Text("Work",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 30),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(c3[widget.current_index]),
                            value: 0.4,
                          ),
                        ),
                        Text("40%",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Text("Today",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 14),),
                    SizedBox(height: 80,),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: todos.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context,int index){
                        return Stack(
                          fit: StackFit.loose,
                          alignment: AlignmentDirectional.center,
                          children: [
                            initial_value[index] ? Container(
                              height: 1,
                              width: 280,
                              color: Colors.grey,
                            ) : Container(height: 0,width: 0,),
                            Column(
                              children: [
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    activeColor: Colors.grey,
                                    focusColor: Colors.white,
                                    checkColor: Colors.white,
                                    value: initial_value[index],
                                    onChanged: (value){
                                      setState((){
                                          initial_value[index] = !initial_value[index];
                                      });
                                    },
                                  ),
                                  Text(todos[index],style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold,decoration: initial_value[index] ? TextDecoration.lineThrough : TextDecoration.none),),
                                  initial_value[index] ? IconButton(
                                    onPressed: (){
                                      setState((){
                                        todos.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete,color: Colors.grey,size: 20,),
                                  ) : (work[index] ? Icon(Icons.work_outline,color: Colors.grey,size: 20,) : Icon(Icons.edit_calendar,color: Colors.grey,size: 20,)),
                                ],
                          ),
                                Divider(height: 5,thickness: 1,color: Colors.grey[200],)
                              ],
                            ),
                          ],
                        );
                        },
                    ),
      ]
              ),
            ),
        ],
      )
    );
  }
}
