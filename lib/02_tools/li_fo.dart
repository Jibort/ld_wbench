// Classe per a la gestió de cues LiFo.
// createdAt: 24/10/17 dj. JIQ

// ignore_for_file: unused_field

class LiFo<T> {
  // MEMBRES --------------------------
  final List<T> _list = <T>[];
  
  // CONSTRUCTORS ---------------------
  LiFo();

  // GETTERS i SETTERS ----------------
  int get length => _list.length;
  List<T> get list => _list.toList(growable: false);

  // GESTIÓ DE LA CUA -----------------
  void push(T pItem) => _list.add(pItem);
  T? pop() => (_list.isEmpty) ? null : _list.removeLast();
  T? peek() => (_list.isEmpty) ? null : _list.last;

  void sneak(T pItem) => _list.insert(0, pItem);
  T? heap() => _list.removeAt(0);

  bool remove(T pItem) {
    bool exists = _list.contains(pItem);
    if (exists) { _list.remove(pItem); }
    return exists;
  }
  void clear() {
    _list.clear();
  }
}
