// Aplicació pel desenvolupament i proves de widgets i pàgines de 'Sabina'.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ld_wbench/02_tools/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ld_wbench/06_theme/app_theme.dart';

import '01_pages/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.isLogEnable = kDebugMode;
  LdImageController.inst;

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const Application(true),
    ),
  );
}

const Size iPhone8PlusSize = Size(414.0, 736.0);

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class Application extends StatelessWidget {
  // MEMBERS -------------------------
  final bool secure;

  const Application(bool pSecure, {super.key}): secure = pSecure;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
        ensureScreenSize: true,
        designSize: iPhone8PlusSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,

            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: Locale("ca", "ES"),
            fallbackLocale: Locale("en", ""),
          
            theme: LdTheme.lightTheme,
            darkTheme: LdTheme.darkTheme,
            themeMode: themeProvider.mode,
  
            getPages: appPages,
            initialRoute: rtWidgetsView,
          );
        });
  }
}