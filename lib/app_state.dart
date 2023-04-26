import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _volumeList =
        prefs.getStringList('ff_volumeList')?.map(int.parse).toList() ??
            _volumeList;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _goodsQuantity = 0;
  int get goodsQuantity => _goodsQuantity;
  set goodsQuantity(int _value) {
    _goodsQuantity = _value;
  }

  List<int> _volumeList = [1, 5, 10, 20];
  List<int> get volumeList => _volumeList;
  set volumeList(List<int> _value) {
    _volumeList = _value;
    prefs.setStringList(
        'ff_volumeList', _value.map((x) => x.toString()).toList());
  }

  void addToVolumeList(int _value) {
    _volumeList.add(_value);
    prefs.setStringList(
        'ff_volumeList', _volumeList.map((x) => x.toString()).toList());
  }

  void removeFromVolumeList(int _value) {
    _volumeList.remove(_value);
    prefs.setStringList(
        'ff_volumeList', _volumeList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromVolumeList(int _index) {
    _volumeList.removeAt(_index);
    prefs.setStringList(
        'ff_volumeList', _volumeList.map((x) => x.toString()).toList());
  }

  int _choiceVolume = 0;
  int get choiceVolume => _choiceVolume;
  set choiceVolume(int _value) {
    _choiceVolume = _value;
  }

  String _currentImage = '';
  String get currentImage => _currentImage;
  set currentImage(String _value) {
    _currentImage = _value;
  }

  int _currentVolume = 0;
  int get currentVolume => _currentVolume;
  set currentVolume(int _value) {
    _currentVolume = _value;
  }

  double _currentPrice = 0;
  double get currentPrice => _currentPrice;
  set currentPrice(double _value) {
    _currentPrice = _value;
  }

  int _currentQuntity = 1;
  int get currentQuntity => _currentQuntity;
  set currentQuntity(int _value) {
    _currentQuntity = _value;
  }

  bool _showTogleQuant = false;
  bool get showTogleQuant => _showTogleQuant;
  set showTogleQuant(bool _value) {
    _showTogleQuant = _value;
  }

  List<dynamic> _cartList = [];
  List<dynamic> get cartList => _cartList;
  set cartList(List<dynamic> _value) {
    _cartList = _value;
  }

  void addToCartList(dynamic _value) {
    _cartList.add(_value);
  }

  void removeFromCartList(dynamic _value) {
    _cartList.remove(_value);
  }

  void removeAtIndexFromCartList(int _index) {
    _cartList.removeAt(_index);
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
