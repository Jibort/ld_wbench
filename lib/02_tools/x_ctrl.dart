// Classe per a la gestió simplificada del registre de controladors.
// CreatedAt: 2025/02/08 ds. JIQ

class XCtrl implements Comparable {
  // MEMBRES --------------------------
  final Type   _type; // Tipus de la classe on pertant la instància enregistrada.
  final String _id;   // Identificador lògic segons el tipus.
  final String _tag;  // Identificador fet servir en el registre en GetX que conté
                      // el nom del tipus com a prefix.

  // CONSTRUCTORS ---------------------
  XCtrl({ required Type pType, String? pId })
    : _type = pType,
      _id = (pId != null)? pId: pType.toString(),
      _tag = (pId != null)
        ? "${pType.toString()}_$pId"
        : pType.toString();

  // GETTERS/SETTERS -------------------
  Type   get type => _type;
  String get id => _id;
  String get tag => _tag;
  
  // INTERFÍCIE 'Comparable' ----------
  @override
  int compareTo(pOther) {
    if (pOther.runtimeType is! XCtrl) { return -1_000_000; } 
    XCtrl xctrl = pOther as XCtrl;
    int diff;

    diff = type.toString().compareTo(xctrl.type.toString());
    if (diff == 0) { diff = id.compareTo(xctrl.id); }
    if (diff == 0) { diff = tag.compareTo(xctrl.tag); }

    return diff;
  }
}
