// Eines de gestió d'al·leatorietat.
// CreatedAt: 2024-10-18 dv. JIQ

import 'dart:math';

import 'package:ld_wbench/02_tools/index.dart';

// Genera una llista de caràcters ASCII amb una longitud específica.
//              0         1         2         3         4         5         6         7         8         9       10       11       12       13       14       15       16       17       18       19       20       21       22       23       24       25       26       27       28       29       30       31
//              0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
const _chars =
    'ijkdefNOPQlmnopqrstuvwxyzABCDEFGÍïòÒóHIJKLMUVRSTghZ123456€&¬/(öÖùÙúWXYabcÚü)¿?¿¡!+-*<>{}[]àÀáÁäÄèÈéÉëËì7890@·#~%ÌíÓÜ'
    'tuvwST5678FGHIJKjklmLMabcdefghiUVWXYZíÍïòÒóNOìÌéÉënopqrsÓöÖùPQR90@·\\\$¬/()¿xyzABCDE?¿¡!+-*<>{}[]àÀáÁäÄèÈ1234ËÙúÚüÜ#~%€&'
    'wxyzABCÒóHIJKLMUVRS123456€&¬/(öÖùMabcdefghiUVW';

Random? _random;
Random get random {
  if (isNull(_random)) _random = Random.secure();
  return _random!;
}

// Genera un número al·leatori amb min <= n < max.
int randomBetween(int min, int max) => (0 <= min) ? random.nextInt(max - min) + min : 0;

String randomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => _chars.codeUnitAt(randomBetween(0, _chars.length))));

String newPasswordLen(int pLength) => randomString(pLength);

String newPassword(String pBase, int pLength) {
  StringBuffer sb = StringBuffer();

  var last = pBase.length - 1;
  for (int idx = 0; idx < pLength; idx += 1) {
    var cid = randomBetween(0, last);
    sb.write(pBase[cid]);
  }

  return sb.toString();
}
