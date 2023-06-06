import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HostMainPage(),
    );
  }
}

class HostMainPage extends StatefulWidget {
  const HostMainPage({super.key});

  @override
  State<HostMainPage> createState() => _HostMainPageState();
}

class _HostMainPageState extends State<HostMainPage> {
  int selectedIndex = 0;

  selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Beginning'),
      ),
      body: Container(
        child: Center(
            child: Text(
          labelData(selectedIndex),
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Made By Sayman Rifat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    leading: imageData(1),
                    title: Text(labelData(index)),
                    onTap: () {
                      selectedTab(index);
                      Navigator.pop(context);
                    },
                    tileColor: selectedIndex == index
                        ? Colors.blue.shade100 // Selected item color
                        : null, //
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedTab(index);
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: imageData(0), label: labelData(0)),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: labelData(1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.three_k), label: labelData(2)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: imageData(selectedIndex),
        backgroundColor: bodyBackgroundColor(selectedIndex),
      ),
    );
  }

  imageData(int index) {
    List iconArray = [
      Icon(Icons.one_k),
      Icon(Icons.two_k),
      Icon(Icons.three_k)
    ];
    return iconArray[index];
  }

  labelData(int index) {
    List labelArray = ['Page 1', "Page 2", 'Page 3'];
    return labelArray[index];
  }

  bodyBackgroundColor(int index) {
    List colorArray = [Colors.amberAccent, Colors.red, Colors.greenAccent];
    return colorArray[index];
  }
}
