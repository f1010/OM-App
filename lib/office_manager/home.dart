import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc_flutter/office_manager/add_kid/steps.dart';
import 'package:poc_flutter/office_manager/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TeddyCare")),
        body: PageView(
          children: [
            Container(color: Colors.red),
            StepsContainer(),
            Container(color: Colors.blue),
            Container(color: Colors.grey),
            Container(color: Colors.green)
          ],
          controller: _pageController,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: _buildBottomContainer());
  }

  Widget _buildBottomContainer() {
    return Container(
        color: AppColors.lightViolet,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildBottomNavColumn(Icons.people, "Manage", 0),
            _buildBottomNavColumn(Icons.add, "Add", 1),
            _buildBottomNavColumn(Icons.notifications, "Notifications", 2),
            _buildBottomNavColumn(Icons.search, "Search", 3),
            _buildBottomNavColumn(Icons.view_list, "Records", 4)
          ],
        ));
  }

  Widget _buildBottomNavColumn(IconData icon, String label, int position) {
    final Color _color =
        position == _currentPage ? AppColors.lightBlue : AppColors.darkViolet;

    return InkWell(
        onTap: () {
          _onBottomNavigationTapped(position);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: _color),
              Text(
                label,
                style: TextStyle(
                  fontSize: 8.0,
                  fontWeight: FontWeight.w400,
                  color: _color,
                ),
              ),
            ],
          ),
        ));
  }

  void _onBottomNavigationTapped(int page) {
    _pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }
}
