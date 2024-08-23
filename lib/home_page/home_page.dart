import 'package:firebase_demo/add_task/add_task.dart';
import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/home_page/categery.dart';
import 'package:firebase_demo/home_page/task_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Center(child: Text("Welcome",
          style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 30),
        )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Icon(Icons.notification_add,size: 30,color: Colors.teal,),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Center(
                    child: Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text("Hello,",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 35,fontStyle: FontStyle.italic),),
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width:200,
                                    child: Text("MR: ${App_Text.name.text}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),

                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage("images/intro.png"),
                                )

                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                    width:200,
                                    child: Text("")),
                                InkWell(
                                  child: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white,width: 1.5),

                                    ),

                                    child: const Center(
                                      child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                  onTap: (){
                                    // Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     type: PageTransitionType.rightToLeft,
                                    //     isIos: true,
                                    //     child: const Edit_ProfilePage(),
                                    //   ),
                                    // );

                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //********* Task Overview ***************//
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Row(
                      children: [
                        Text("Task Overview",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green.shade100,
                              border: Border.all(color: Colors.green)

                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Complete Task",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green.shade100,
                              border: Border.all(color: Colors.green)

                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("3",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Pending Task",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //************ Category slider *****************//
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Category(),
                  ),
                  //******** Task ****************//
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text("Today's Task",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const TaskPage(),
                  const SizedBox(height: 20,),
                  const TaskPage(),
                  const SizedBox(height: 20,),
                  const TaskPage(),

                ],
              ),
            ),
          ),

          //***********Task Add Button****************//
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal
                ),
                child:
                const Icon(Icons.add,size: 50,color: Colors.white,),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    isIos: true,
                    child: const Add_TaskPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}