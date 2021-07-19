import 'package:flutter/material.dart';
import 'package:instagram_clone/page/account_page.dart';
import 'package:instagram_clone/page/home_page.dart';
import 'package:instagram_clone/provider/google_sign_in.dart';
import 'package:instagram_clone/page/search_page.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [
    HomePage(),
    SearchPage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {
            final provider = context.read<GoogleSignInProvider>();
            provider.logout();
          }, icon: Icon(Icons.exit_to_app)),
        ],
      ) ,
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTaped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
