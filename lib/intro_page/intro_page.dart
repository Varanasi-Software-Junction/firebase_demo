import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/intro_page/to_do_list_intro.dart';
import 'package:firebase_demo/utilittis.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/intro.png"),
              const SizedBox(height: 20,),
              Text(
                'Get Organized Your Life',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                width: 300,
                child: Text(
                  'This is a simple and effective to-do list and task manager app which helps you manage time.',
                  style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.w400),
                ),
              ),
              Text("${Googel_Signin.isAuthorized}"),
              Text("${Googel_Signin.currentUser}"),
              const SizedBox(height: 100,),
              InkWell(
                child: Container(
                  height: 50,
                  width: 300,
                  color: App_Text.button_color,
                  child:  const Center(child: Text("Get Started",
                    style: App_Text.button_text,),),
                ),
                onTap: (){
                  setState((){
                     Googel_Signin.login();
                    print("bhvvybubu${Googel_Signin.currentUser}");
                  });
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      isIos: true,
                      child:  const To_Do_List_Intro(),
                      // FingerPrint(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
