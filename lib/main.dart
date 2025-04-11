import 'package:flutter/material.dart';
import 'package:project_ui/pages/login.dart';
import 'package:project_ui/provider/filter_provider.dart';
import 'package:provider/provider.dart';
import 'provider/act_get_data_provider.dart';

import 'provider/cdt_get_data_provider.dart';
import 'provider/placement_records_get_data_provider.dart';
import 'provider/sdp_get_data_provider.dart';
import 'provider/student_details_get_data_provider.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ActGetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PlacementRecordsGetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StudentDetailsDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CdtGetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SdpGetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => FilterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: const Color.fromRGBO(90, 102, 128, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(127, 142, 175, 1),
          ),
        ),
        // home: HomePage( userRole: 'admin',),
        home: const LoginPage(),
      ),
    );
  }
}
