import 'package:flutter/material.dart';
import 'package:store/Screens/Home_page.dart';
import 'package:store/Screens/Update_page.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id:(context)=>HomePage(),
        UpdatePage.id:(context)=>UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
