import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              height: 300,
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tarefas.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    );
                  })),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              //SERVE PARA PEGAR O TEXTO QUE ESTA NO TEXTFIELD E SALVAR ELE NA LISTA
              if (_textEditingController.text.length > 0) {
                setState(() {
                  tarefas.add(_textEditingController.text);
                });

                _textEditingController.clear();
              }
              print(tarefas);
            },
            child: Icon(Icons.add),
          ),

           FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              //SERVE PARA PEGAR O TEXTO QUE ESTA NO TEXTFIELD E SALVAR ELE NA LISTA
              
                setState(() {
                  tarefas = [];
                });

                _textEditingController.clear();
            
              
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
