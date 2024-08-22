import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int isselect = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
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
                      "Category",
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
                    child: Text("Office Work",
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
               Text("Add more...",
                 style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,
                 decorationColor: Colors.green.shade600),),
              const SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }
}