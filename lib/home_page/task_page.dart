
import 'package:firebase_demo/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  bool isselect=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: 350,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade100),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.green.shade100,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child:  Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Title",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  const Text("SubTitle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Text("Category",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),),
                        const SizedBox(width: 20,),
                        Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green.shade300,

                            ),
                            child: const Center(child: Text("Date & Time",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: Icon(Icons.star, size: 30,
                          color: isselect  ? Colors.green : Colors.green.shade100,
                        ),
                        onTap: (){
                          setState(() {
                            // using this double tap//
                            isselect= !isselect;
                          });
                        },
                      ),
                      const SizedBox(width: 30,),
                      InkWell(child: const Icon(Icons.edit,color: Colors.green,size: 30,),
                        onTap: (){
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              isIos: true,
                              child: const Edit_TaskPage(),
                            ),
                          );

                        },
                      )
                      // Text("Edit..",style: TextStyle(color: Colors.teal,fontSize: 17,
                      //     decoration: TextDecoration.underline,decorationColor: Colors.green),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
