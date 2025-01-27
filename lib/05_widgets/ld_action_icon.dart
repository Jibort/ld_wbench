// Widget 'ActionIcon'.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ld_wbench/05_widgets/index.dart';



/// LdIconAction: Un ActionButton estilitzat per al projecte, basat en LdWidget.
/// Pot mostrar una icona basada en [IconData] o en un asset.
class LdActionIcon extends LdWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String? assetIcon;
  final double? _size;
  final Color? color;
  final Color? backgroundColor;
  final bool isCircular;

  LdActionIcon({
    super.key,
    required super.id,
    super.pLabel,
    required this.onPressed,
    this.icon,
    this.assetIcon,
    double? size,
    this.color,
    this.backgroundColor,
    this.isCircular = true,
  }): _size = size?? 30.0.h;

  @override
  Widget buildContent(BuildContext context) {
return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(isCircular ? _size! / 2 : 8.0),
          child: Container(
            width: _size,
            height: _size,
            decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).primaryColor,
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Center(
              child: icon != null
                  ? Icon(icon, size: _size! * 0.6, color: color ?? Colors.white)
                  : Image.asset(assetIcon!, width: _size! * 0.6, height: _size * 0.6),
            ),
          ),
        ),
        if (label != "?") ...[
          SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(fontSize: 12.0, color: color ?? Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
  
  @override
  void dispose() {
    // Aquest widget no requereix alliberar recursos explícitament.
  }
}
