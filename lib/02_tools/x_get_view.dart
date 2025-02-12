


import 'package:flutter/widgets.dart';
import 'package:ld_wbench/02_tools/x_find.dart';

abstract class XGetView extends StatelessWidget {
  final String tag;

  const XGetView(this.tag, { super.key });

  dynamic get controller => XFind.findByTag(tag);

  @override
  Widget build(BuildContext context);
}