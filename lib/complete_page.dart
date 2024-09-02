import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/home_page/task_list.dart';
import 'package:firebase_demo/home_page/task_page.dart';
import 'package:flutter/material.dart';
class CompletePage extends StatefulWidget {
  static FirebaseFirestore? firestoredb; //=FirebaseFirestore.instance;

  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  int isselect = 0;

  @override
  void initState(){
    super.initState();
    firebaseInit();
    getmessages();

  }

  void firebaseInit() {
    try {
      CompletePage.firestoredb = FirebaseFirestore.instance;
    } catch (ee) {
      print(ee);
    }
  }
  List<Widget> lst = [];
  Future<void> getmessages() async {
    dynamic result =
    await CompletePage.firestoredb?.collection("goal_getter").snapshots();
    Stream<QuerySnapshot> ms = result;
    firebasedata = "";
    ms.forEach((element) {
      for (var value in element.docs) {
        // if(value.get('date').toString() != DateTime.now().toString() &&
        //     value.get('time').toString() != TimeOfDay.
        //     // value.get('year').toString() != DateTime.now().year
        // )
          //continue;
        setState(() {
          lst.add(TaskList(
            value.get("title").toString(),
            value.get("sub_title").toString(),
            value.get("time").toString(),
            value.get("date").toString(),
            value.get("month").toString(),
            value.get("year").toString(),
            value.get("category").toString(),

          ));

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: const Icon(Icons.arrow_circle_left,size: 50,color: Colors.teal,),
          onTap: (){
            // Navigator.pop(context);
          },
        ),
        title: const Text("Complete Task",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: lst,
        ),
      ),
    );
  }
}