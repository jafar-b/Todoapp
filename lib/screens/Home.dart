import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/screens/Todoitems.dart';
import 'package:todoapp/model/todo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final list = todo.list();
  final _textController = TextEditingController();
  List<todo> _foundTodos =[];
  void _handleOnChange(todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _onDelete(String id) {
    setState(() {
      list.removeWhere((item) => item.id == id);
    });
  }

  @override
  void initState() {
    _foundTodos = list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: appBar(),
        body: Stack(
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            children: [
              Container(
                child: Column(
                  children: [
                    searchBox(),
                    Expanded(
                        child: ListView(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 20),
                          child: (const Text(
                            "All Todos",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w500),
                          )),
                        ),
                        for (todo Todoo in _foundTodos.reversed)
                          
                          Todoitems(
                            Todo: Todoo,
                            onDelete: _onDelete,
                            onTodoChanged: _handleOnChange,
                            addTodo: _addTodo,
                          ),
                      ],
                    ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Add a new Todo',
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tdBlue,
                            minimumSize: Size(60, 60),
                            elevation: 10),
                        onPressed: () {
                          _addTodo(_textController.text);
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]));
  }

  void _runFilter(String input){
    List<todo> result = [];
    if (input.isEmpty) {
      result = list;
    } else {
      result = list
          .where((item) =>
              item.TodoText!.toLowerCase().contains(input.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodos=result;
    });
  }

  void _addTodo(String text) {
    setState(() {
      list.add(todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          TodoText: text));
      _textController.clear();
    });
  }

  Widget searchBox() {
    
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        // margin: EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
            child: Column(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child:  TextField(
                       onChanged: (value)=>{_runFilter(value)},
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
}
