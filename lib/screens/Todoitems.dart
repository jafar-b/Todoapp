import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart'        ;

class Todoitems extends StatelessWidget {
  const Todoitems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListTile(
                      onTap:(){ print("Clicked a todo Item.");},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        tileColor: Colors.white,

        leading: Icon(Icons.check_box,color: tdBlue,),
        title: Text("Check mail",style: TextStyle(fontSize: 16,color: tdBlack,decoration: TextDecoration.lineThrough),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          
          padding: EdgeInsets.all( 0),
          margin: EdgeInsets.symmetric(vertical: 8),
          
          decoration: BoxDecoration(

              color: tdRed,
              borderRadius: BorderRadius.circular(5)),
          
          child: IconButton(
            onPressed:( ){print("delete pressed");},
              color:Colors.white,
              icon:Icon(Icons.delete),

        ),
        
      )
      ),
    )                                                                                                     ;  }
}
