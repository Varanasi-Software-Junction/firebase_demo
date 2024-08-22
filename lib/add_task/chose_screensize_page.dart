import 'package:firebase_demo/app_theam.dart';
import 'package:flutter/material.dart';

class Screensize_Page extends StatefulWidget {
  const Screensize_Page({super.key});

  @override
  State<Screensize_Page> createState() => _Screensize_PageState();
}

class _Screensize_PageState extends State<Screensize_Page> {
  bool light = false;
  bool light_b = false;
  bool isselect = false;
  bool isselect_b = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          child: const Icon(Icons.arrow_circle_left,size: 50,color: Colors.teal,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        //title: const Center(child: Text("Select",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 25),)),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text("Select Screen Size",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade200)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Full Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Switch(
                        // This bool value toggles the switch.
                        value: light,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            light = value;
                            print(value);
                            if(value == true) {
                              App_Text.Screen_size = "Full Screen";
                              print(App_Text.Screen_size);
                            }
                          });
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade200)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Half Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Switch(
                        // This bool value toggles the switch.
                        value: light_b,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            light_b = value;
                            if(value==true) {
                              App_Text.Screen_size = "Half Screen";
                              print(App_Text.Screen_size);
                            }

                          });
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text("Close Remainder Sound",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade200)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("In Side The App",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: InkWell(
                          child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: isselect
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.green.shade300)),
                              child: Center(
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: isselect ? Colors.white : Colors.green,
                                    ),
                                  ))),
                          onTap: () {
                            setState(() {
                              isselect =! isselect;
                              print(isselect);
                            });
                          },
                        ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),
            Container(
              height: 80,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green.shade200)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("On The Screen",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black,fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                color: isselect_b
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.green.shade300)),
                            child: Center(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: isselect_b ? Colors.white : Colors.green,
                                  ),
                                ))),
                        onTap: () {
                          setState(() {
                            isselect_b =! isselect_b;
                            print(isselect_b);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
