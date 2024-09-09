import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/home_page/task_list.dart';
import 'package:firebase_demo/home_page/task_page.dart';
import 'package:flutter/material.dart';

class PandingPage extends StatefulWidget {
  static FirebaseFirestore? firestoredb; //=FirebaseFirestore.instance;

  const PandingPage({super.key});

  @override
  State<PandingPage> createState() => _PandingPageState();
}

class _PandingPageState extends State<PandingPage> {
  int isselect = 0;
  @override
  void initState(){
    super.initState();
    firebaseInit();
    getmessages();
  }

  void firebaseInit() {
    try {
      PandingPage.firestoredb = FirebaseFirestore.instance;
    } catch (ee) {
      print(ee);
    }
  }
  List<Widget> lst = [];
  Future<void> getmessages() async {
    dynamic result =
    await PandingPage.firestoredb?.collection("goal_getter").snapshots();
    Stream<QuerySnapshot> ms = result;
    firebasedata = "";
    ms.forEach((element) {
      for (var value in element.docs) {
        if(value.get('done').toString() == 'false' && value.get('gmail').toString() == App_Text.gmail)

        setState(() {
          //print(value.get("comments").toString());
          lst.add(TaskList(
            value,
          ));


        });
        firebasedata = firebasedata + value.data().toString() + "\n";
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
        leading: const Icon(Icons.arrow_circle_left,size: 50,color: Colors.teal,),
        title: const Text("Pending Task",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              //const SizedBox(height: 20,),
              //************ search bar *************//
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 50,
              //     color: Colors.white,
              //     child: SizedBox(
              //       child: TextField(
              //         autofocus: true,
              //         cursorColor: Colors.grey,
              //         style: const TextStyle(
              //             color: Colors.black, fontWeight: FontWeight.bold),
              //         decoration: InputDecoration(
              //             enabledBorder:  OutlineInputBorder(
              //               // borderRadius: BorderRadius.circular(10),
              //               borderSide: BorderSide(
              //                 color: Colors.green.shade200,
              //                 //width: 1.5,
              //               ),
              //             ),
              //
              //             //********Focus border like hover******************8
              //             focusedBorder: OutlineInputBorder(
              //               // borderRadius: BorderRadius.circular(10),
              //                 borderSide: BorderSide(color: Colors.green.shade200),
              //                 borderRadius: BorderRadius.circular(15)),
              //
              //             hintText: "Search",
              //             hintStyle: const TextStyle(color: Colors.green),
              //             prefixIcon: const Icon(
              //               Icons.search,
              //               color: Colors.green,
              //               size: 30,
              //             )),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30,),
              //************ searching method *************//

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 0
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 0 ? Colors.black : Colors.white,
                                  ),
                                ))),
                        onTap: () {
                          setState(() {
                            isselect = 0;
                            print(isselect);
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                color: isselect != 1
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text(
                                  "Personal",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 1 ? Colors.black : Colors.white,
                                  ),
                                ))),
                        onTap: () {
                          setState(() {
                            isselect = 1;
                          });
                        },
                      ),
                      const SizedBox(width: 10,),
                      InkWell(child:
                      Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              color: isselect != 2
                                  ? Colors.white
                                  : Colors.green.shade300,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green.shade300)),
                          child: Center(
                            child: Text("office Work",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: isselect != 2 ? Colors.black : Colors.white,
                              ),),
                          )),
                        onTap: (){
                          setState(() {
                            isselect=2;
                          });
                        },
                      ),
                      const SizedBox(width: 10,),

                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 3
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text("Workout",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 3 ? Colors.black : Colors.white,
                                  ),))),
                        onTap: (){
                          setState(() {
                            isselect=3;
                          });
                        },
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 4
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(child: Text("Yoga",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: isselect != 4 ? Colors.black : Colors.white,
                              ),))),
                        onTap: (){
                          setState(() {
                            isselect = 4;
                          });
                        },),
                      const SizedBox(width: 10,),
                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 5
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text("Sport",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 5 ? Colors.black : Colors.white,
                                  ),))),
                        onTap: (){
                          setState(() {
                            isselect = 5;
                          });
                        },),
                      const SizedBox(width: 10,),
                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 6
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text("Birthday",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 6 ? Colors.black : Colors.white,
                                  ),))),
                        onTap: (){
                          setState(() {
                            isselect = 6;
                          });
                        },),
                      const SizedBox( width: 10,),
                      InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect != 7
                                    ? Colors.white
                                    : Colors.green.shade300,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text("Other",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect != 7 ? Colors.black : Colors.white,
                                  ),))),
                        onTap: (){
                          setState(() {
                            isselect = 7;
                          });
                        },),
                    ],
                  ),
                ),
              ),
              //************ Pending task *************//
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("All Pending Tasks",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                children: lst
              ),


            ],
          ),
        ),
      ),
    );
  }
}