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

class _HostMainPageState extends State<HostMainPage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late TabController _tabController;

  selectedTab(int index) {
    setState(() {
      selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      selectedIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          labelData(selectedIndex),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      // body: Container(
      //   child: Center(
      //       child: Text(
      //     labelData(selectedIndex),
      //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //   )),
      // ),
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
                  Text(
                    'Ostad Test',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    title: Text(labelData(index)),
                    onTap: () {
                      selectedTab(index);

                      _tabController.animateTo(index);
                      Navigator.pop(context);
                    },
                    tileColor: selectedIndex == index
                        ? Colors.blue.shade100 // Selected item color
                        : null, //
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectedTab(index);
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(null), label: labelData(0)),
          BottomNavigationBarItem(icon: Icon(null), label: labelData(1)),
          BottomNavigationBarItem(icon: Icon(null), label: labelData(2)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text(labelData(selectedIndex)),
        backgroundColor: bodyBackgroundColor(selectedIndex),
      ),
    );
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

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 3'),
    );
  }
}
