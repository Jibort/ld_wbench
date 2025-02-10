// Definició de totes les rutes de l'aaplicació.
// CreatedAt: 2025/01/18 ds. JIQ

import 'package:get/get.dart';
import 'package:ld_wbench/01_pages/widgets_view/view.dart';

// Noms de totes les pàgines.
const String rtWidgetsView = "/widgetsView";

// Llistat de totes les rutes.
List<GetPage<dynamic>> appPages = [
  // Pnatalla de Welcome --------------
  GetPage(
    name: rtWidgetsView,
    binding: WidgetsViewBindings(),
    page: () => WidgetsView(),
  ),
];

