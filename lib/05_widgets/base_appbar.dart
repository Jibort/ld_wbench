// Emcapsulament de la barra de capçalera de les pàgines.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: prefer_final_fields, must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/01_01_view_tools/index.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:ld_wbench/05_widgets/index.dart';

class BaseAppBar extends AppBar {
  // MEMBRES --------------------------
  // final BaseController _pageCtrl;
  // final String _title;
  // final List<Widget>? _actions;
  // final Widget? _leading;
  // final double _elevation;
  // Color _bgColor;
  // Color _fgColor;
  // bool _centerTitle;

  // CONSTRUCTORS ---------------------
  BaseAppBar({
    super.key,
    required BuildContext pCxt,
    required LdViewController pViewCtrl,
    required String pTitle,
    String? pSubTitle,
    List<LdActionIcon>? pActions,
    LdActionIcon? pLeading,
    double? pElevation,
    Color? pBgColor,
    Color? pFgColor,
    bool? centerTitle,
  }) : super(
            elevation: pElevation ?? 30.h,
            shadowColor: Theme.of(pCxt).appBarTheme.shadowColor,
            backgroundColor: pBgColor ?? Theme.of(pCxt).scaffoldBackgroundColor,
            titleTextStyle: txsAppBarTitleStyle(pCxt: pCxt),
            title: GetBuilder(
              id: WidgetKey.appBar.idx,
              init: pViewCtrl,
              builder: (LdViewController pCtrl) {
                return Column(children: [
                  (pCtrl.state.isLoaded)
                      ? _TitleWidget(pTitle, pLeading,
                          pSubTitle: pSubTitle,
                          pFgColor: pFgColor ?? Theme.of(pCxt).primaryColor,
                          pActions: pActions)
                      : _ProgressTitleWidget(
                          pCxt: pCxt,
                          pCtrl,
                          pBgColor: pBgColor ?? Theme.of(pCxt).scaffoldBackgroundColor,
                          pFgColor: pFgColor ?? Theme.of(pCxt).primaryColor,
                        )
                ]);
              },
            ));
}

class _ProgressTitleWidget extends GetWidget {
  // MEMBRES --------------------------
  final LdViewController _viewCtrl;
  final String _title;
  final Color _fgColor;

  // CONSTRUCTORS ---------------------
  _ProgressTitleWidget(this._viewCtrl, {required BuildContext pCxt, String? pTitle, Color? pBgColor, Color? pFgColor})
      : _title = pTitle ?? "Carregant...",
        _fgColor = pFgColor ?? Theme.of(pCxt).appBarTheme.foregroundColor?? Colors.black;

  // WIDGET ---------------------------
  @override
  Widget build(BuildContext pCxt) {
    return GetBuilder<LdViewController>(
        id: WidgetKey.appBarProgress.idx,
        init: _viewCtrl,
        builder: (context) {
          int length, dids;
          double? ratio;
          (length, dids, ratio) = _viewCtrl.state.stats;
          if (_viewCtrl.state.isPreparing) {
            return SizedBox(
              width: null,
              height: 2.h,
              child: LinearProgressIndicator(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                minHeight: 2.h,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                value: ratio,
              ),
            );
          } else if (_viewCtrl.state.isLoading) {
            return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                  "$_title: ${(isNotNull(ratio)) ? "${(ratio! * 100.0).toStringAsFixed(2)}%" : "..."}",
                  style: txsAppBarProgressionTitleStyle(pCxt:pCxt,  pFgColor: _fgColor)),
              Text(
                "$dids de $length",
                style: txsAppBarProgressionSubtitleStyle(pCxt: pCxt, pFgColor: _fgColor),
              ),
              SizedBox(
                width: null,
                height: 2.h,
                child: LinearProgressIndicator(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  minHeight: 2.h,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                  value: ratio,
                ),
              ),
            ]);
          } else {
            return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text("Unknown State!", style: txsAppBarProgressionTitleStyle(pCxt: pCxt, pFgColor: _fgColor)),
              SizedBox(
                width: null,
                height: 2.h,
                child: LinearProgressIndicator(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  minHeight: 2.h,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(_fgColor),
                  value: null,
                ),
              ),
            ]);
          }
        });
  }
}

class _TitleWidget extends GetWidget {
  // MEMBRES --------------------------
  final String _title;
  final String? _subTitle;
  final LdActionIcon? _leading;
  final List<LdActionIcon>? _actions;
  final Color _fgColor;
  // CONSTRUCTORS ---------------------
  const _TitleWidget(String pTitle, LdActionIcon? pLeading,
      {String? pSubTitle, List<LdActionIcon>? pActions, Color? pFgColor})
      : _title = pTitle,
        _subTitle = pSubTitle,
        _leading = pLeading,
        _actions = pActions,
        _fgColor = pFgColor ?? Colors.black;

  // WIDGET ---------------------------
  @override
  Widget build(BuildContext pCxt) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (isNotNull(_leading)) ? _leading! : const SizedBox(),
        (isNull(_subTitle))
            ? Text(_title, style: txsAppBarMainTitleStyle(pCxt: pCxt, pFgColor: _fgColor))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_title, style: txsAppBarTitleStyle(pCxt: pCxt, pFgColor: _fgColor)),
                  Text(_subTitle!, style: txsAppBarSubtitleStyle(pCxt: pCxt, pFgColor: _fgColor))
                ],
              ),
        (_actions != null)
          ? Row(
            children: [
              for (var action in _actions) action,
            ])
          : Container()
      ],
    );
  }
}
