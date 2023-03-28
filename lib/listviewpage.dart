import 'package:bloodbank/addinfopage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({super.key});

  final CollectionReference DONOR =
      FirebaseFirestore.instance.collection('DONER');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text("Blood bank", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                // print("clicked");
                Navigator.push(context, MaterialPageRoute(builder: (cnxt) {
                  return AddInfopage();
                }));
              },
              backgroundColor: Color.fromARGB(255, 255, 17, 0),
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: DONOR.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot DONORSNAP =
                            snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 15),
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    // maxRadius: ,
                                    backgroundColor: Colors.red,
                                    radius: 65,
                                    child: Text(
                                      DONORSNAP['group'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DONORSNAP['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DONORSNAP['number'].toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit),
                                      iconSize: 30,
                                      color: Colors.blue,
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete),
                                      iconSize: 30,
                                      color: Colors.red,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
