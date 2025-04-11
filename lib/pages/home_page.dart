import 'package:flutter/material.dart';
import 'package:project_ui/widgets/act_training.dart';
import 'package:project_ui/widgets/placement_records.dart';
import 'package:project_ui/widgets/cdt_training.dart';
import 'package:project_ui/widgets/student_details.dart';
import 'package:project_ui/widgets/nav_drawer.dart';
import 'package:project_ui/widgets/placement_statistics.dart';
import 'package:project_ui/widgets/user_menu.dart';

class HomePage extends StatefulWidget {
  final String userRole;
  const HomePage({
    super.key,
    required this.userRole,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _diaplayNavDrawer = true;
  bool _diaplayUserMenu = false;
  int _selectedDrawerIndex = 0;

  void selectDrawerItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
  }

  late final List<Widget> _drawerItemsWidgets = [
    const PlacementRecords(),
    StudentDetails(
      userRole: widget.userRole,
    ),
    const AptitudeCompetencyTraining(),
    const CareerDevelopmentTraining(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _diaplayNavDrawer = !_diaplayNavDrawer;
            });
          },
        ),
        title: const Text(
          'AutomatED',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 17,
        actions: [
          Container(
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  _diaplayUserMenu = !_diaplayUserMenu;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_pin),
                  _diaplayUserMenu
                      ? const Icon(Icons.arrow_drop_up_outlined)
                      : const Icon(Icons.arrow_drop_down_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          _diaplayNavDrawer
              ? NavDrawer(
                  onNavDrawerTap: selectDrawerItem,
                  selectDrawerItem: _selectedDrawerIndex,
                  userRole: widget.userRole,
                )
              : Container(),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: _selectedDrawerIndex != -1
                      ? _drawerItemsWidgets[_selectedDrawerIndex]
                      : const Text('Select a menu item'),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _diaplayUserMenu
                      ? UserMenu(
                          userRole: widget.userRole,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
