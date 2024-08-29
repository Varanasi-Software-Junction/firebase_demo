import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/edit_task.dart';
import 'package:firebase_demo/home_page/task_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
    dynamic result =
    await TaskPage.firestoredb?.collection("goal_getter").snapshots();
    Stream<QuerySnapshot> ms = result;
    firebasedata = "";
    ms.forEach((element) {

      for (var value in element.docs) {
if(value.get('date').toString() != DateTime.now().day.toString())
  continue;
        setState(() {
          App_Text.Counter++;
          lst.add(TaskList(
            value.get("title").toString(),
            value.get("sub_title").toString(),
            value.get("time").toString(),
            value.get("date").toString(),
            value.get("month").toString(),
            value.get("year").toString(),
            value.get("category").toString(),

          ));

          //******************** value initlization*******************************//
          App_Text.date = value.get("date").toString();
          App_Text.month = value.get("month").toString();
          App_Text.year = value.get("year").toString();


        });
        firebasedata = firebasedata + value.data().toString() + "\n";
        print(TimeOfDay.hoursPerDay);
      }
    });
    setState(() {
    });
    print(firebasedata);


  }

  _FirebaseDemoState() {}
  String firebasedata = "data";

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: lst,

      ),
    );
      //TaskList("One");
    }



  }
