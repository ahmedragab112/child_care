import 'package:childcare/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: pages[index],
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color(
                      0xff97D04D,
                    ),
                    width: 2,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: index,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.black,
                  onTap: (value) {
                    index = value;
                    setState(() {});
                  },
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 64),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage(
                              "assets/images/child.png",
                            ),
                            size: 64),
                        label: "Child"),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("assets/images/mom.png"),
                          size: 64,
                        ),
                        label: "Mom"),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("assets/images/info.png"),
                            size: 64),
                        label: "Info"),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
