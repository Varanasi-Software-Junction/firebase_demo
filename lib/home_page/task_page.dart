import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// class TaskPage extends StatefulWidget {
//   static FirebaseFirestore? firestoredb; //=FirebaseFirestore.instance;
//
//   const TaskPage({super.key});
//
//   @override
//   State<TaskPage> createState() => _TaskPageState();
// }
//
// class _TaskPageState extends State<TaskPage> {
//   bool isselect = false;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         StreamBuilder<QuerySnapshot>(
//           stream: TaskPage.firestoredb
//               ?.collection("goal_getter")
//               //.where("messagefrom", isEqualTo: "champak")
//               //.orderBy("time")
//               //.collection("messages").where("messagefrom", isEqualTo: "champak")
//               .snapshots(),
//           builder: (context, snapshot) {
//             try {
//               if (snapshot.hasData) {
//                 final messages = snapshot.data?.docs;
//                 List<Widget> lst = [];
//                 for (var message in messages!) {
//                   final messagetext = message.get("title");
//                   //final sender = message.get("messagefrom");
//                   final messagetextfield = VsjTwo(messagetext.toString()
//                       // sender.toString(),
//                       );
//                   lst.add(messagetextfield);
//                   lst.add(SizedBox(
//                     height: 10,
//                   ));
//                 }
//                 return Column(
//                   children: lst,
//                 );
//               } else {
//                 List<Text> lst = [];
//                 lst.add(Text("Waiting"));
//                 return Column(
//                   children: lst,
//                 );
//               }
//             } catch (e) {
//               return Text("data");
//             }
//           },
//         )
//       ],
//     );
//   }
// }


class TaskPage extends StatefulWidget {
  static FirebaseFirestore? firestoredb;

  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isselect = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: TaskPage.firestoredb
          ?.collection("goal_getter")
          .snapshots(),
      builder: (context, snapshot) {
        try {
          print("come");
          if (snapshot.hasData) {
            print("data is here");
            // final messages = snapshot.data?.docs;
            // List<Widget> lst = [];
            // for (var message in messages!) {
            //   final messagetext = message.get("title");
            //   final messagetextfield = VsjTwo(messagetext.toString());
            //   lst.add(messagetextfield);
            //   lst.add(SizedBox(height: 10)
            //   );
            // }
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text("hash data"),
              ]
            );
          } else {
            return Column(
              children: const [
                Text("Waiting"),
              ],
            );
          }
        } catch (e) {
          return const Text("Error loading data");
        }
      },
    );
  }
}



class VsjTwo extends StatelessWidget {
  String message = "";
  VsjTwo(String message) {
    this.message = message;
    //this.sender=sender;
  }
  static TextStyle myTextStyle() {
    return TextStyle(
      color: Colors.white,
      backgroundColor: Colors.blue,
      fontSize: 20,
    );
  }

  static InputDecoration myInputDecoration() {
    return InputDecoration(
        hintText: "Text Input", border: OutlineInputBorder());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.blueAccent,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: myTextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                " : ",
                style: TextStyle(backgroundColor: Colors.white),
              ),
            ),
            Text("")
          ],
        ));
  }
}

