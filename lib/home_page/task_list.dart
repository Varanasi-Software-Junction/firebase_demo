import 'package:firebase_demo/app_theam.dart';
import 'package:firebase_demo/edit_task.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TaskList extends StatefulWidget {
  // TaskList({super.key});
  String id = "";
  String title = "";
  String sub_title = "";
  String time = "";
  String date = "";
  String month = "";
  String year = "";
  String category = "";
  String comments = "";
  @override
  State<TaskList> createState() => _TaskListState();

  TaskList(
    String id,
    String title,
    String sub_title,
    String time,
    String date,
    String month,
    String year,
    String category,
    String comments,
  ) {
    this.id = id;
    this.title = title;
    this.sub_title = sub_title;
    this.time = time;
    this.date = date;
    this.month = month;
    this.year = year;
    this.category = category;
    this.comments = comments;
  }
}

class _TaskListState extends State<TaskList> {
  bool isselect = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 180,
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
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        widget.sub_title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.category,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            // const SizedBox(width: 15,),
                            Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green.shade300,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.lock_clock,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      widget.time,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.teal,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.date,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Text("-"),
                          Text(
                            widget.month,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Text("-"),
                          Text(
                            widget.year,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.star,
                            size: 30,
                            color:
                                isselect ? Colors.green : Colors.green.shade100,
                          ),
                          onTap: () {
                            setState(() {
                              // using this double tap//
                              isselect = !isselect;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.edit,
                            color: Colors.green,
                            size: 30,
                          ),
                          onTap: () {
                            App_Text.edit_task.text = widget.id;
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                isIos: true,
                                child: Edit_TaskPage(
                                  "${widget.title}",
                                  "${widget.sub_title} ",
                                  "${widget.comments}",
                                  "${widget.time}",
                                  "${widget.date}",
                                  "${widget.month}",
                                  "${widget.year}",
                                  "${widget.id}",
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
