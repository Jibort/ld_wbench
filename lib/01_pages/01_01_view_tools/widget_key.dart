// Enumeració de GetBuilder's per a la seva actualització.
// createdAt: 24/07/18 dj. JIQ

// Enumeració de widgets a actualitzar.
enum WidgetKey implements Comparable<WidgetKey> {
// Widget principal d'una pàgina.
  scaffold(pId: 10, pName: 'scaffold'),
  // Widget de la barra superior d'una pàgina.
  appBar(pId: 20, pName: 'appBar'),
  // Widget de la barra superior de progrés.
  appBarProgress(pId: 30, pName: 'appBarProgress'),
  // Widget del cos d'una pàgina.
  pageBody(pId: 40, pName: 'pageBody'),
  // Widget de la barra inferior d'una pàgina.
  bottomBar(pId: 50, pName: 'bottomBar'),
  // Widget del menú lateral d'una pàgina.
  drawer(pId: 60, pName: 'drawer'),
  // Widget del botó flotant d'una pàgina.
  floatingActionButton(pId: 70, pName: 'floatingActionButton'),
  // Widget de la barra inferior d'una pàgina que mostra missatges breus.
  snackbar(pId: 80, pName: 'snackbar'),
  // Widget de diàleg modal que mostra informació o demana una decisió a l'usuari.
  dialog(pId: 90, pName: 'dialog'),
  // Widget que s'obre des de la part inferior de la pantalla i mostra informació o opcions addicionals.
  bottomSheet(pId: 100, pName: 'bottomSheet'),
  // Widget que mostra informació en un format compacte i visualment atractiu.
  card(pId: 110, pName: 'card'),
  // Widget que mostra informació en una fila amb un ícone, un títol i una subtítol opcionals.
  listTile(pId: 120, pName: 'listTile'),
  // Widget que representa una etiqueta o un element seleccionable en una llista o un formulari.
  chip(pId: 130, pName: 'chip'),
  // Widget que permet a l'usuari navegar entre diferents seccions o pàgines d'una aplicació.
  tabBar(pId: 140, pName: 'tabBar'),
  // Widget que mostra el contingut associat a una pestanya seleccionada en un TabBar.
  tabBarView(pId: 150, pName: 'tabBarView'),

  // Índex de l'entrada a partir de la qual fer widgets custom.
  custom(pId: 1000, pName: 'custom');

  final int _idx;
  final String _name;

  const WidgetKey({required int pId, required String pName})
      : _idx = pId,
        _name = pName;

  @override
  String toString() => "WidgetKey[$_idx: '$_name']";

  int get idx => _idx;
  String get name => _name;

  @override
  int compareTo(WidgetKey other) => _idx.compareTo(other._idx);
}
