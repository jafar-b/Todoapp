import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/screens/Todoitems.dart';
import 'package:todoapp/model/todo.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

   final  list=todo.list();
           return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Expanded(
                child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: (Text(
                    "All Todos",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  )),
                ),

                       
                Todoitems(),

              ],
            ))
          ],
        ),
      ),
    );
  }
}

Widget searchBox() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      // margin: EdgeInsets.symmetric(horizontal: 25.0),
      child: Center(
          child: Column(children: [
        Container(
          decoration: BoxDecoration(
              // boxShadow:const [
              //     BoxShadow(blurRadius: 2.0,spreadRadius: 0.5),
              //
              // ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: const TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: tdBlack,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                maxWidth: 25,
              ),
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        )
      ])));
}

AppBar appBar() {
  return AppBar(
      elevation: 5.0,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: tdBlue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
          ),
          Text("Todo App"),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              // child:Image.asset('assets/images/jafar.jpg'),
            ),
          )
        ],
      ));
}
