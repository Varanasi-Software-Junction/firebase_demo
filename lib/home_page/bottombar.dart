
import 'package:firebase_demo/calander.dart';
import 'package:firebase_demo/complete_page.dart';
import 'package:firebase_demo/home_page/home_page.dart';
import 'package:firebase_demo/pending_page.dart';
import 'package:flutter/material.dart';

class Bottomnavigation extends StatefulWidget {
  int index = 0;
  Bottomnavigation({super.key, required this.index});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _selectedIndex = 0;
  final bool _showBottomSheet = false;
  int _previousIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
     const PandingPage(),
     const CompletePage(),
     const CalanderPage(),
    // const Profile(),
  ];

  final bool _isBottomSheetOpen = false;

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.maincolor,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.green.shade50,
        selectedLabelStyle: const TextStyle(fontSize: 2),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _previousIndex = _selectedIndex;

          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.home_filled,
                    color: _selectedIndex == 0 ? Colors.green : Colors.green.shade100,

                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 10,
                      color: _selectedIndex == 0 ? Colors.teal : Colors.green.shade100,
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.padding,
                    color: _selectedIndex == 1 ? Colors.green : Colors.green.shade100,

                  ),
                  Text(
                    "Pending",
                    style: TextStyle(
                      fontSize: 10,
                      color: _selectedIndex == 1 ? Colors.teal : Colors.green.shade100,
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.task_alt,
                    color: _selectedIndex == 2 ? Colors.green : Colors.green.shade100,

                  ),
                  Text(
                    "Complete",
                    style: TextStyle(
                      fontSize: 10,
                      color: _selectedIndex == 2 ? Colors.green : Colors.green.shade100,
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: _selectedIndex == 3 ? Colors.green : Colors.green.shade100,

                  ),
                  Text(
                    "Calendar",
                    style: TextStyle(
                      fontSize: 10,
                      color: _selectedIndex == 3 ? Colors.green : Colors.green.shade100,
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          ),


        ],
      ),

      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
        ],
      ),
      // bottomSheet: _showBottomSheet ? _buildBottomSheet() : null,
    );
  }
}