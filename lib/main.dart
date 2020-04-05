import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vmihalachi_flutter/project.dart';
import 'package:vmihalachi_flutter/responsive_layout.dart';

const _kSpace = 12.0;
const _kPrimaryColor = Color(0xFF0269FF);

void main() => runApp(_App());

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          // fontFamily: 'circular',
          accentColor: _kPrimaryColor,
          primaryColor: _kPrimaryColor,
          buttonTheme: ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ),
        home: Scaffold(
          backgroundColor: Colors.black,
          body: ResponsiveLayout(
            largeScreen: _HomePageLarge(),
            // mediumScreen: _HomePage(),
            smallScreen: _HomePage(),
          ),
        ));
  }
}

class _HomePageLarge extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Row(
        children: [
          Spacer(),
          ConstrainedBox(constraints: BoxConstraints(maxWidth: 500), child: _Headline()),
          SizedBox(width: 100),
          ConstrainedBox(constraints: BoxConstraints(maxWidth: 500), child: _Projects()),
          Spacer(),
        ],
      );
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ListView(
        padding: EdgeInsets.all(_kSpace * 2),
        children: [
          SizedBox(height: _kSpace * 4),
          _Headline(),
          SizedBox(height: _kSpace * 4),
          _Projects(),
        ],
      );
}

class _Headline extends StatelessWidget {

  static const textStyleLink = TextStyle(color: _kPrimaryColor, decoration: TextDecoration.underline, fontFamily: 'circular');

  @override
  Widget build(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Vlad Mihalachi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'circular'),
        ),
        SizedBox(height: _kSpace),
        Text.rich(
          TextSpan(
            text:
            "Full-Stack developer, App developer, Server Guy. Special care for design architectures & code reusability. "
                "Software Engineer at Microsoft and co-founder of ",
            children: [
              TextSpan(
                  text: 'Docode OÜ',
                  style: textStyleLink,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => html.window.open('https://docode.it', '_blank')),
              /*TextSpan(text: ' and '),
              TextSpan(
                  text: 'Globl Agency',
                  style: TextStyle(color: _kPrimaryColor, decoration: TextDecoration.underline, fontFamily: 'circular'),
                  recognizer: TapGestureRecognizer()..onTap = () => html.window.open('https://globl.agency', '_blank')),*/
            ],
          ),
          style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'circular'),
        ),
        SizedBox(height: _kSpace),
        GestureDetector(
            child: Text('@GitHub', style: textStyleLink),
            onTap: () => html.window.open('https://github.com/vmihalachi', '_blank')),
        SizedBox(height: _kSpace),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
          color: _kPrimaryColor,
          child: Text('Hire Vlad (already hired :P)'.toUpperCase(), style: TextStyle(fontFamily: 'circular'),),
          onPressed: null /*() {
            html.window.open('mailto:vmihalachi@outook.com', '_blank');
          }*/,
        )
      ]);
}

class _Projects extends StatelessWidget {
  static final _kGloblAgencyColor = Colors.green[700];
  static const _kDocodeColor = Color(0xFF0092FF);

  static final _kProjects = [
    Project(
      title: 'Beatpulse - Docode OÜ',
      description: 'Producer-owned beat streaming and licensing platform.',
      url: 'https://beatpulse.co',
      color: _kDocodeColor,
    ),
    Project(
        title: 'Nyam - Docode OÜ',
        description: 'Complete platform for restaurants that do not want to compromise.',
        url: 'https://docode.it/nyam',
        color: _kDocodeColor),
    Project(
        title: 'Task Runner - Docode OÜ',
        description: "Your API's best friend. Run your periodic and scheduled tasks with ease.",
        url: 'https://taskrunner.run',
        color: _kDocodeColor),
    Project(
      title: 'TheCharts - Docode OÜ',
      description: 'Industry quality, radio ready beats and instrumentals that will take any artist to the next level. Together we’ll give them music to talk about.',
      url: 'https://thecharts.com',
      color: _kDocodeColor,
    ),
    Project(
        title: 'Turbo Client & Turbo Editor',
        description: "Sleek, intuitive and powerful Android FTP & SFTP client. Comes with Rich and Open Source text editor.",
        url: 'https://play.google.com/store/apps/details?id=turbo.client',
        color: _kPrimaryColor),
    Project(
        title: 'Just Quote It',
        description: "Get inspired everyday with this delightful mobile app.",
        url: 'https://play.google.com/store/apps/details?id=com.vmihalachi.justquoteit',
        color: _kPrimaryColor),
  ];

  @override
  Widget build(BuildContext context) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final project in _kProjects) ...[
            OutlineButton(
              padding: EdgeInsets.all(_kSpace * 2),
              color: Colors.grey[900],
              borderSide: BorderSide(color: project.color, width: 4),
              splashColor: project.color,
              onPressed: () {
                html.window.open(project.url, '_blank');
              },
              child: SizedBox(
                  width: double.infinity,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      project.title,
                      style: TextStyle(fontSize: 18, fontFamily: 'circular'),
                    ),
                    SizedBox(height: _kSpace / 3),
                    Text(
                      project.description,
                      style: TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'circular'),
                    ),
                  ])),
            ),
            SizedBox(height: _kSpace)
          ]
        ],
      );
}
