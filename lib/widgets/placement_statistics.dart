// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class PlacementStats extends StatefulWidget {
  const PlacementStats({Key? key}) : super(key: key);

  @override
  State<PlacementStats> createState() =>
      _PlacementStatsState();
}

class _PlacementStatsState extends State<PlacementStats> {
  ImageProvider sdp_attendance = NetworkImage(
       'http://127.0.0.1:5000/static/sdp_attendance.png?timestamp=${DateTime.now().millisecondsSinceEpoch}');
  int _current = 0;
  final List<String> _tabs = ['Attendance', 'Category'];

  // Future<void> refreshImages() async {
  //   final response =
  //       await http.get(Uri.parse('http://127.0.0.1:5000/get_sdp_image'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       sdp_attendance = NetworkImage(
  //           'http://127.0.0.1:5000/static/sdp_attendance.png?timestamp=${DateTime.now().millisecondsSinceEpoch}');
  //       sdp_category = NetworkImage(
  //           'http://127.0.0.1:5000/static/sdp_category.png?timestamp=${DateTime.now().millisecondsSinceEpoch}');
  //     });
  //   } else {
  //     debugPrint(
  //         'Failed to fetch image with status code: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _tabs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 80,
                              height: 45,
                              decoration: BoxDecoration(
                                color: _current == index
                                    ? Colors.white70
                                    : Colors.white54,
                                borderRadius: _current == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: _current == index
                                    ? Border.all(
                                        color: Colors.grey[200]!,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  _tabs[index],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _current == index,
                            child: Container(
                              width: 80,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.grey[500]!,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                // IconButton(
                //   onPressed: refreshImages,
                //   icon: Icon(Icons.refresh, color: Colors.grey[500]),
                // ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    _current == 0
                        ? Image(
                            image: sdp_attendance,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('Failed to load image');
                            },
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
