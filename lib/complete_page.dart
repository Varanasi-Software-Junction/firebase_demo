import 'package:firebase_demo/home_page/task_page.dart';
import 'package:flutter/material.dart';
class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  int isselect = 0;
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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [
            //************ Pending task *************//
            SizedBox(height: 10,),
            TaskPage(),

          ],
        ),
      ),
    );
  }
}