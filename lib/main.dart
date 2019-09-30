import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:vmihalachi_flutter/project.dart';

void main() => runApp(App());

const _kSpace = 12.0;
const _kPrimaryColor = Color(0xFF0269FF);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)))),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Spacer(),
            ConstrainedBox(constraints: BoxConstraints(maxWidth: 500), child: _Headline()),
            SizedBox(width: 100),
            ConstrainedBox(constraints: BoxConstraints(maxWidth: 500), child: _Projects()),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class _Projects extends StatelessWidget {
  static const _kProjects = [
    Project(
        title: 'Beatpulse - Globl Agency',
        description: 'Producer-owned beat streaming and licensing platform.',
        url: 'https://beatpulse.co'),
    Project(
        title: 'Nyam - Docode OÜ',
        description: 'Complete platform for restaurants that do not want to compromise.',
        url: 'https://docode.it/nyam'),
    Project(
        title: 'Task Runner - Globl Agency',
        description: "You API's best friend. Run your periodic and scheduled tasks with ease.",
        url: 'https://taskrunner.run'),
    Project(
        title: 'Turbo Client',
        description: "Sleek, intuitive and powerful Android FTP & SFTP client.",
        url: 'https://play.google.com/store/apps/details?id=turbo.client'),
    Project(
        title: 'Turbo Editor',
        description: "Simple, powerful and Open Source text editor for Android.",
        url: 'https://play.google.com/store/apps/details?id=com.maskyn.fileeditor'),
    Project(
        title: 'Just Quote It',
        description: "Get inspired everyday with this delightful mobile app.",
        url: 'https://play.google.com/store/apps/details?id=com.vmihalachi.justquoteit'),
  ];

  const _Projects({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (final project in _kProjects)
        ...[
          FlatButton(
            padding: EdgeInsets.all(16),
            color: Colors.grey[800],
            onPressed: () {
              html.window.open(project.url, '_blank');
            },
            child: SizedBox(
                width: double.infinity,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    project.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    project.description,
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                ])),
          ),
          SizedBox(height: _kSpace)
        ]
    ]);
  }
}

class _Headline extends StatelessWidget {
  const _Headline({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Vlad Mihalachi",
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 2,
      ),
      SizedBox(height: _kSpace),
      Text(
        "Full-Stack developer, App developer, Server Guy. Special care for design architectures & code reusability. "
        "Freelancer and co-founder of Globl Agency and Docode OÜ.",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
      ),
      SizedBox(height: _kSpace * 2),
      RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        color: _kPrimaryColor,
        child: Text('Hire Vlad'.toUpperCase()),
        onPressed: () {
          html.window.open('mailto:vmihalachi@outook.com', '_blank');
        },
      )
    ]);
  }
}
