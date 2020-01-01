import 'package:flutter/material.dart';
import 'package:my_shop/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;

  final _tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.view_list),
      title: Text('Orders'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text('Favorites'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.playlist_add),
      title: Text('Add Product'),
    ),
  ];

  final _titles = [
    'Home',
    'Orders',
    'Favorites',
    'Add Product',
  ];

  void _didSelectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _widgetForSelectedTab(BuildContext context) {
    if (_selectedIndex == 0) {
      return HomeScreen();
    } else {
      return Text('Unknow tab');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: Center(
        child: _widgetForSelectedTab(context),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: _tabs,
          currentIndex: _selectedIndex,
          onTap: _didSelectTab,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black45,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
