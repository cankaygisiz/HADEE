import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DocumentReference> _Cart = [];
  List<DocumentReference> get Cart => _Cart;
  set Cart(List<DocumentReference> _value) {
    _Cart = _value;
  }

  void addToCart(DocumentReference _value) {
    _Cart.add(_value);
  }

  void removeFromCart(DocumentReference _value) {
    _Cart.remove(_value);
  }

  void removeAtIndexFromCart(int _index) {
    _Cart.removeAt(_index);
  }

  void updateCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Cart[_index] = updateFn(_Cart[_index]);
  }

  void insertAtIndexInCart(int _index, DocumentReference _value) {
    _Cart.insert(_index, _value);
  }

  double _total = 0;
  double get total => _total;
  set total(double _value) {
    _total = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
