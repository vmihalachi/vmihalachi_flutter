import 'dart:ui';

import 'package:flutter/foundation.dart';

class Project {
  final String title;
  final String description;
  final String url;
  final Color color;

  const Project({@required this.title, @required this.description, @required this.url, @required this.color});
}
