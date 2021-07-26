import 'package:anubiss/widgets/aboutus.dart';
import 'package:anubiss/widgets/main.dart';
import 'package:anubiss/widgets/ourServices.dart';
import 'package:anubiss/widgets/ourworks.dart';
import 'package:anubiss/widgets/profile.dart';
import 'package:anubiss/widgets/register.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> tabs = [
    MainWidget(),
    AboutUs(),
    OurWorks(),
    OurServices(),
  ];
  Widget _selectedTab = tabs.first;
  late Widget _upperTab;
  bool _upper = false;

//newwwwwwwwww
  void _handleIndexChanged(int i) {
    setState(() {
      _upper = false;
      _selectedTab = tabs.elementAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        // margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: tabs.indexOf(_selectedTab),
        dotIndicatorColor: Color(0xffE78F0B),
        unselectedItemColor: Colors.black54,
        // enableFloatingNavBar: false,

        onTap: _handleIndexChanged,
        paddingR: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        borderRadius: 15,
        items: [
          DotNavigationBarItem(
            icon: Icon(EvaIcons.home),
            selectedColor: Color(0xffE78F0B),
          ),

          DotNavigationBarItem(
            icon: Icon(EvaIcons.people),
            selectedColor: Color(0xffE78F0B),
          ),

          DotNavigationBarItem(
            icon: Icon(EvaIcons.browser),
            selectedColor: Color(0xff73544C),
          ),
          //

          DotNavigationBarItem(
            icon: Icon(EvaIcons.settings2),
            selectedColor: Color(0xff73544C),
          ),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.06),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.ac_unit),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _upper = true;
                        _upperTab = Register();
                      });
                    },
                    child: Icon(
                      Icons.person_rounded,
                      color: _upper ? Color(0xffE78F0B) : Color(0xff2F3A73),
                    ),
                  ),
                  SizedBox(width: size.width * 0.06),
                  Icon(
                    Icons.chat_rounded,
                    color: Color(0xff2F3A73),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.28,
              child: _upper ? _upperTab : _selectedTab,
            ),
          ],
        ),
      ),
    );
  }
}
