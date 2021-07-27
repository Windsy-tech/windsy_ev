import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windsy_ev/screens/main_screen.dart';
import 'themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
        return MaterialApp(
          title: 'Windsy EV ',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: MainScreen(),
        );
      });
}
