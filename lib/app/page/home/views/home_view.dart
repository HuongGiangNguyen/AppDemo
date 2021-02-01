import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/state_view.dart';
import 'package:flutter_base/app/page/home/home_controller.dart';
import 'package:flutter_base/app/page/home/views/profile_view.dart';
import 'package:flutter_base/app/page/home/views/rank_view.dart';
import 'package:flutter_base/app/page/home/views/store_view.dart';
import 'package:flutter_base/app/page/home/views/orderme_view.dart';

class HomeView extends View {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    StoreView(),
    OrderMeView(),
    RankView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget buildPage(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                ),
                label: 'Cửa hàng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: 'Đơn hàng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stars),
                label: 'Xếp hạng',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Cá nhân',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff7C4DFF),
            unselectedItemColor: Color(0xff9b9999),
            onTap: _onItemTapped,
          ),
        ),
        // loading(status: controller.status.value, context: context)
      ],
    );
  }
}
