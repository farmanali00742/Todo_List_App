import 'package:flutter/material.dart';

import 'package:to_do_list/todoprovider.dart';
import 'package:provider/provider.dart';

class listdes extends StatefulWidget {
  const listdes({super.key});

  @override
  State<listdes> createState() => _listdesState();
}

class _listdesState extends State<listdes> {
  String selectedCategory = 'Personal';
  List<String> categories = [
    'Personal',
    'Work',
    'Wishlist',
    'Birthday',
    'Home work'
  ];
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var todoprovider = Provider.of<TodoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(190, 105, 215, 242),
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(190, 105, 215, 242), Colors.white],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromARGB(215, 33, 201, 243),
                            Color.fromARGB(219, 107, 182, 181)
                          ],
                        ),
                      ),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(163, 255, 255, 255)),
                        child: Image.asset(
                          'assets/images/12.jpg',
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Selected Category: $selectedCategory',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Center(
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    underline: Container(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ).copyWith(top: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(135, 0, 0, 0),
                    ),
                    borderRadius: BorderRadius.circular(12)
                        .copyWith(topLeft: const Radius.circular(0)),
                  ),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Add your description here',
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    // Retrieve the user input from the TextField
                    String userDescription = descriptionController.text;
                    todoprovider.addTodo(selectedCategory, userDescription);
                    // Use the user input as needed (e.g., store it, display it, etc.)
                    descriptionController.clear();
                    print('User Description: $userDescription');
                  },
                  child: Text(
                    'Submit Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(211, 63, 190, 232)),
                    fixedSize: MaterialStatePropertyAll(
                      Size(180, 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
