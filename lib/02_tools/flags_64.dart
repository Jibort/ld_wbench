// Representació de 64 flags booleans sobre un Int64 de fixnum.
// createdAt: 24/10/17 dj. JIQ

import 'package:fixnum/fixnum.dart' as $fixn;

final _one = $fixn.Int64(1);

class Flags64 {
  // MEMBRES --------------------------
  late $fixn.Int64 _flags;

  // CONSTRUCTORS ---------------------
  Flags64.fromFixNum($fixn.Int64 pFlags) {
     _flags = pFlags;
  }

  Flags64.empty(): this.fromFixNum($fixn.Int64(0));
  
  // GETTERS ----------------------------
  $fixn.Int64 get int64 => _flags;

  // METHODS ----------------------------
  // Obtenir el valor del bit a la posició especificada
  bool getFlag(int pPos) {
    if (pPos < 0 || pPos > 63) {
      throw ArgumentError("La posició ha de ser entre 0 i 63");
    }
    // Shiftem el bit cap a la dreta i mirem si és 1
    return (_flags >> pPos & _one) == _one;
  }

  // Establir el valor del bit a la posició especificada
  void setFlag(int pPos, bool pBool) {
    if (pPos < 0 || pPos > 63) {
      throw ArgumentError("La posició ha de ser entre 0 i 63");
    }
    if (pBool) {
      // Estableix el bit a 1
      _flags |= (_one << pPos);
    } else {
      // Estableix el bit a 0
      _flags &= ~(_one << pPos);
    }
  }
}