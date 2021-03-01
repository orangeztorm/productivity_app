import 'package:flutter/material.dart';
import 'package:productivity_app/TimerModel.dart';
import 'package:productivity_app/settings.dart';
import 'package:productivity_app/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

import './Timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimerHompage(),
    );
  }
}

class TimerHompage extends StatelessWidget {
  final double defaultPadding = 5.0;

  final CountDownTimer timer = CountDownTimer();

  void goToSettings(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> menuItems = List<PopupMenuItem<String>>();
    menuItems
      ..add(PopupMenuItem(
        value: 'Settings',
        child: Text('Settings'),
      ));
    timer.startWork();
    return Scaffold(
        appBar: AppBar(
          title: Text("productivity app"),
          actions: [
            PopupMenuButton<String>(itemBuilder: (context) {
              return menuItems.toList();
            }, onSelected: (s) {
              if (s == 'Settings') {
                goToSettings(context);
              }
            })
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double availableWidth = constraints.maxWidth;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            color: Color(0xff009688),
                            text: "Work",
                            onPressed: emptyMethod)),
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
                        initialData: '00:00',
                        stream: timer.stream(),
                        builder: (context, snapshot) {
                          TimerModel timer = (snapshot.data == '00:00')
                              ? TimerModel('00:00', 1)
                              : snapshot.data;
                          return CircularPercentIndicator(
                            radius: availableWidth / 2,
                            lineWidth: 10.0,
                            percent: timer.percent,
                            center: Text(timer.time,
                                style: Theme.of(context).textTheme.headline4),
                            progressColor: Color(0xff009688),
                          );
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
                            onPressed: () => timer.startWork())),
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }
}

void emptyMethod() {}
