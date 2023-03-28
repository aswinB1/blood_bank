import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddInfopage extends StatelessWidget {
  AddInfopage({super.key});

  final bloodgroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedgroups;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 253, 17, 0),
        title: Text(
          "Add information",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              label: Text("Enter name "),
            )),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  label: Text("Enter number"),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: DropdownButtonFormField(
                decoration: InputDecoration(label: Text("Select blood group")),
                items: bloodgroup
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedgroups = val;
                }),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 252, 17, 0)),
                  minimumSize:
                      MaterialStatePropertyAll(Size(350, 50))),
              child: Text("Submit",style: TextStyle(fontSize: 23),))
        ],
      )),
    );
  }
}
