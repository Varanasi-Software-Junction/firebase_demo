
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TaskPage extends StatefulWidget {
  static FirebaseFirestore? firestoredb; //=FirebaseFirestore.instance;

  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isselect=false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget> [
        StreamBuilder<QuerySnapshot>(
          stream: TaskPage.firestoredb
              ?.collection("messages")
              .where("messagefrom", isEqualTo: "champak")
              .orderBy("time")
          //.collection("messages").where("messagefrom", isEqualTo: "champak")
              .snapshots(),
          builder: (contex, snapshot) {
            try{
    if (snapshot.hasData) {
    final messages = snapshot.data.docs;
    List<Widget> lst = [];
    for (var message in messages) {
    final messagetext = message.get("chatmessage");
    final sender = message.get("messagefrom");
    final messagetextfield = VsjTwo(
    messagetext.toString(),
    sender.toString(),
    );
    lst.add(messagetextfield);
    lst.add(SizedBox(
    height: 10,
    ));
    }
    return Column(
      children: lst,
    );
    } else {
      List<Text> lst = [];
      lst.add(Text("Waiting"));
      return Column(
        children: lst,
      );
    }

            }catch(e){

            }

          },
        )

      ],
    );
  }
}


class VsjTwo extends StatefulWidget {
  const VsjTwo({super.key});

  @override
  State<VsjTwo> createState() => _VsjTwoState();
}

class _VsjTwoState extends State<VsjTwo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
