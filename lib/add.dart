import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Add extends StatefulWidget {
  int current_index;
  Add(this.current_index,{Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<String> c1 = ["#f7ba2c","#6274e7","#2feaa8"];
  List<String> c2 = ["#ea5459","#8752a3","#028cf3"];
  bool work = false;
  String todo = "";
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }
          , icon: Icon(Icons.close,color: Colors.grey,size: 20,),),
        leadingWidth: 60,
        title: Text("New Task",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      body: Container(
        margin: EdgeInsets.only(left: 60,right: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text("What tasks are you planning to perform?",style:TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w400),),
            TextField(
              style: TextStyle(color: Colors.grey,fontSize: 25,fontWeight: FontWeight.w500),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value){
                todo = _textEditingController.text;
              },
              controller: _textEditingController,
            ),
            SizedBox(height: 40,),
            Divider(thickness: 1,height: 5,color: Colors.grey[200],),
            TextButton.icon(
                onPressed: (){
                  setState((){
                    work = true;
                  });
                },
                icon: Icon(Icons.work_outline,color: Colors.grey,size: 20,),
                label: Text("Work",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 15),),
            ),
            Divider(thickness: 1,height: 10,color: Colors.grey[200],),
            TextButton.icon(
              onPressed: (){
                work = false;
              },
              icon: Icon(Icons.edit_calendar,color: Colors.grey,size: 20,),
              label: Text("Today",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 15),),
            ),
            Divider(thickness: 1,height: 15,color: Colors.grey[200],),
            SizedBox(height: 20,),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    HexColor(c1[widget.current_index]),
                    HexColor(c2[widget.current_index])
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context,[work,todo]);
                  },
                  icon: Icon(Icons.add,color: Colors.white,size: 30,),

              ),
            )
          ],
        ),
      ),
    );
  }
}
