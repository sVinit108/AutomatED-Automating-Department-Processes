import 'package:flutter/material.dart';
import 'package:project_ui/pages/filter_select_screen.dart';

class NavDrawer extends StatefulWidget {
  final Function onNavDrawerTap;
  final int selectDrawerItem;
  final String userRole;
  const NavDrawer({
    super.key,
    required this.onNavDrawerTap,
    required this.selectDrawerItem,
    required this.userRole,
  });

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    int _selectedDrawerIndex = widget.selectDrawerItem;
    return Drawer(
      width: 150,
      child: ListView(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            selected: _selectedDrawerIndex == 0 ? true : false,
            selectedColor: Colors.white,
            selectedTileColor: const Color.fromARGB(255, 169, 179, 203),
            leading: const Icon(Icons.outbound_outlined),
            title: const Text('Placement Records'),
            onTap: () {
              widget.onNavDrawerTap(0);
              _selectedDrawerIndex = 0;
            },
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            selected: _selectedDrawerIndex == 1 ? true : false,
            selectedColor: Colors.white,
            selectedTileColor: const Color.fromARGB(255, 169, 179, 203),
            leading: const Icon(Icons.outbound_outlined),
            title: const Text('Student Details'),
            onTap: () {
              widget.onNavDrawerTap(1);
              _selectedDrawerIndex = 1;
            },
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            selected: _selectedDrawerIndex == 2 ? true : false,
            selectedColor: Colors.white,
            selectedTileColor: const Color.fromARGB(255, 169, 179, 203),
            leading: const Icon(Icons.outbound_outlined),
            title: const Text('ACT Training'),
            onTap: () {
              widget.onNavDrawerTap(2);
              _selectedDrawerIndex = 2;
            },
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
            selected: _selectedDrawerIndex == 3 ? true : false,
            selectedColor: Colors.white,
            selectedTileColor: const Color.fromARGB(255, 169, 179, 203),
            leading: const Icon(Icons.outbound_outlined),
            title: const Text('CDT Training'),
            onTap: () {
              widget.onNavDrawerTap(3);
              _selectedDrawerIndex = 3;
            },
          ),
          // ListTile(
          //   contentPadding:
          //       const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
          //   selected: _selectedDrawerIndex == 4 ? true : false,
          //   selectedColor: Colors.white,
          //   selectedTileColor: const Color.fromARGB(255, 169, 179, 203),
          //   leading: const Icon(Icons.outbound_outlined),
          //   // title: const Text('SDP Session'),

          //   title: const Text('Placement Statistics'),
          //   onTap: () {
          //     widget.onNavDrawerTap(4);
          //     _selectedDrawerIndex = 4;
          //   },
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FilterSelectScreen(
                    userRole: widget.userRole,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: const Text('Filter'),
          ),
        ],
      ),
    );
  }
}
