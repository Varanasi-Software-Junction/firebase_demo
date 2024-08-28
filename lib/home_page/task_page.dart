import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/edit_task.dart';
import 'package:firebase_demo/home_page/task_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//
// class TaskPage extends StatefulWidget {
//   static FirebaseFirestore? firestoredb;
//
//   const TaskPage({super.key});
//
//   @override
//   State<TaskPage> createState() => _TaskPageState();
// }
//
// class _TaskPageState extends State<TaskPage> {
//   bool isselect = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: TaskPage.firestoredb
//           ?.collection("goal_getter")
//           .snapshots(),
//       builder: (context, snapshot) {
//         try {
//           print("come");
//           if (snapshot.hasData) {
//             print("data is here");
//             // final messages = snapshot.data?.docs;
//             // List<Widget> lst = [];
//             // for (var message in messages!) {
//             //   final messagetext = message.get("title");
//             //   final messagetextfield = VsjTwo(messagetext.toString());
//             //   lst.add(messagetextfield);
//             //   lst.add(SizedBox(height: 10)
//             //   );
//             // }
//             return const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:[
//                 Text("hash data"),
//               ]
//             );
//           } else {
//             return Column(
//               children: const [
//                 Text("Waiting"),
//               ],
//             );
//           }
//         } catch (e) {
//           return const Text("Error loading data");
//         }
//       },
//     );
//   }
// }



class TaskPage extends StatefulWidget {
  static FirebaseFirestore? firestoredb; //=FirebaseFirestore.instance;
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {


  @override
  void initState(){
    super.initState();
    firebaseInit();
    getmessages();

  }

  void firebaseInit() {
    try {
      TaskPage.firestoredb = FirebaseFirestore.instance;
    } catch (ee) {
      print(ee);
    }
  }
  List<Widget> lst = [];
  Future<void> getmessages() async {

    print("click");
    dynamic result =
    await TaskPage.firestoredb?.collection("goal_getter").snapshots();
    print("result");
    print(result.runtimeType);
    print("yes");
    Stream<QuerySnapshot> ms = result;
    firebasedata = "";
    ms.forEach((element) {
      for (var value in element.docs) {
        print(value.data());

        lst.add(  TaskList(value.get("title").toString()));
        //await element.docs.removeAt(index);
        firebasedata = firebasedata + value.data().toString() + "\n";
        print(value.get("title"));
        // print(value.get("messagefrom"));
      }
    });
    print(firebasedata);


  }

  _FirebaseDemoState() {}
  String firebasedata = "data";
  bool isselect=false;
  @override
  Widget build(BuildContext context) {

    return  TaskList("One");

    }


  }
