import 'package:flutter/material.dart';
import 'package:todo/models/db_model.dart';
import 'package:todo/widgets/todo_card_widget.dart';

class TodoList extends StatelessWidget {
  var db = DatabaseConnect();
  final Function insertFunction;
  final Function deleteFunction;
  TodoList(
      {Key? key, required this.insertFunction, required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getTodo(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var dataLength = data!.length;

          return dataLength == 0
              ? Center(
                  child: Text('No Data Found'),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => TodoCard(
                      id: data[i]!.id,
                      title: data[i]!.title,
                      creationDate: data[i]!.creationDate,
                      isChecked: data[i]!.isChecked,
                      insertFunction: insertFunction,
                      deleteFunction: deleteFunction),
                );
        },
      ),
    );
  }
}
