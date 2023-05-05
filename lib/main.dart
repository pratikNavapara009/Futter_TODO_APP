import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helpers/themehelpers.dart';
import 'package:to_do_app/screens/task_screen.dart';
import 'models/task_data.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:to_do_app/db/db.dart';

void main() {
  Storage();
  TaskData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => TaskData(),
        builder: (context,_){
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: (Provider.of<ThemeProvider>(context).theme.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],
            home: Tasks_Screen(),
          );
        }
      ),
    );
  }
}
