import 'package:flutter/material.dart';
import 'package:productivity_app/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './Timer.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import './widgets.dart';
import './timermodel.dart';
import './settings.dart';
import 'models/userModel.dart';
import 'models/workModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(UserModelAdapter())
    ..registerAdapter(WorkModelAdapter());
  var box = await Hive.openBox('userBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    menuItems.add(PopupMenuItem(
      value: 'Settings',
      child: Text('Settings'),
    ));
    timer.startWork();
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Work Timer'),
            actions: [
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return menuItems.toList();
                },
                onSelected: (s) {
                  if (s == 'Settings') {
                    goToSettings(context);
                  }
                },
              )
            ],
          ),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final double availableWidth = constraints.maxWidth;
            return Column(children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xff009688),
                          text: "Work",
                          onPressed: () => timer.startWork())),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xff607D8B),
                          text: "Short Break",
                          onPressed: () => timer.startBreak(true))),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xff455A64),
                          text: "Long Break",
                          onPressed: () => timer.startBreak(false))),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              ),
              Expanded(
                  child: StreamBuilder(
                      initialData: TimerModel('00:00', 1),
                      stream: timer.stream(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        TimerModel timer = snapshot.data;
                        return Container(
                            child: CircularPercentIndicator(
                          radius: availableWidth / 2,
                          lineWidth: 10.0,
                          percent: (timer.percent == null) ? 1 : timer.percent,
                          center: Text(
                              (timer.time == null) ? '00:00' : timer.time,
                              style: Theme.of(context).textTheme.headline4),
                          progressColor: Color(0xff009688),
                        ));
                      })),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xff212121),
                          text: 'Stop',
                          onPressed: () => timer.stopTimer())),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          color: Color(0xff009688),
                          text: 'Restart',
                          onPressed: () => timer.startTimer())),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              )
            ]);
          })),
    );
  }

  void emptyMethod() {}
  void goToSettings(BuildContext context) {
    print('in gotoSettings');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }
}
