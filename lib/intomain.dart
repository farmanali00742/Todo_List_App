import 'package:flutter/material.dart';
import 'package:to_do_list/todoprovider.dart';
import 'listdes.dart';
import 'package:provider/provider.dart';

class intomain extends StatefulWidget {
  const intomain({Key? key}) : super(key: key);

  @override
  State<intomain> createState() => _intomainState();
}

class _intomainState extends State<intomain> {
  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(100),
              topLeft: Radius.circular(100),
            ),
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Colors.white, // Sky Blue
            //     Color.fromARGB(255, 173, 216, 230), // Light Blue
            //   ],
            // ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: todoProvider.todos.length,
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: Colors.black,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  var todo = todoProvider.todos[index];

                                  return ListTile(
                                    title: Text(
                                      todo.category,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    subtitle: Text(
                                      todo.description,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onTap: () {
                                      _showEditTodoSheet(
                                          context, todoProvider, index);
                                    },
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _showEditTodoSheet(
                                                context, todoProvider, index);
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            todoProvider.delete(index);
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 550,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.9, 0.9),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => listdes()),
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Color.fromARGB(196, 117, 185, 240),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditTodoSheet(
      BuildContext context, TodoProvider todoProvider, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _EditTodoSheet(
          initialCategory: todoProvider.todos[index].category,
          initialDescription: todoProvider.todos[index].description,
          onUpdate: (newCategory, newDescription) {
            todoProvider.update(index, newCategory, newDescription);
            Navigator.pop(context); // Close the modal sheet
          },
        );
      },
    );
  }
}

class _EditTodoSheet extends StatefulWidget {
  final String initialCategory;
  final String initialDescription;
  final Function(String, String) onUpdate;

  _EditTodoSheet({
    required this.initialCategory,
    required this.initialDescription,
    required this.onUpdate,
  });

  @override
  __EditTodoSheetState createState() => __EditTodoSheetState();
}

class __EditTodoSheetState extends State<_EditTodoSheet> {
  late TextEditingController _categoryController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController(text: widget.initialCategory);
    _descriptionController =
        TextEditingController(text: widget.initialDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.onUpdate(
                _categoryController.text,
                _descriptionController.text,
              );
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
