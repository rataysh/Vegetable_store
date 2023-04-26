import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String uppercaseText(String? name) {
  return name?.toUpperCase() ?? "TITLE";
}

String? capitalizeText(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

int decrementCurrentQuantity(int currentQuantity) {
  final int result =
      currentQuantity == 1 || currentQuantity < 1 ? 1 : currentQuantity - 1;
  return result;
}

double currentCost(
  double price,
  int currentQuantity,
) {
  final double result = price * currentQuantity;
  return double.parse(result.toStringAsFixed(2));
}

dynamic createEachItemInCart(
  String? name,
  String? category,
  int? volume,
  double? price,
  String? images,
) {
  {
    return {
      "id": DateTime.now().toString(),
      "name": name,
      "category": category,
      "volume": volume,
      "price": price,
      "images": images
    };
  }
}

List<dynamic> severalCartItems(
  List<dynamic> localState,
  int currentQuantity,
  String? name,
  String? category,
  int volume,
  double price,
  String images,
) {
  print(currentQuantity);
  var result = [...localState];
  print(result);

  for (int i = 0; i < currentQuantity; i++) {
    result.add(createEachItemInCart(name, category, volume, price, images));
  }
  print(result);
  return result;
}

double? getTotal(List<dynamic> cartList) {
  double total = 0.0;
  for (var item in cartList) {
    total += item["price"];
  }
  return total;
}
