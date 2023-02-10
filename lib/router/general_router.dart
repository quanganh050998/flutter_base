import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralRouter {
  static pop<T>({T? result}) {
    Get.back(result: result);
  }
  static closeManyRoute({ required int times}) {
    Get.close(times);
  }

  static popAndPush<T>({
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAndToNamed(
      '$T',
      arguments: arguments,
      parameters: parameters,
    );
  }

  static Future<dynamic> push<T>({
    dynamic arguments,
  }) {
    return Navigator.pushNamed(
      Get.context!,
      '$T',
      arguments: arguments,
    );
  }

  static Future<dynamic> pushName(String routeId) {
    return Navigator.pushNamed(
      Get.context!,
      routeId,
    );
  }

  static Future<dynamic> pushSpecial(Widget child) {
    return Navigator.push(
      Get.context!,
      MaterialPageRoute(builder: (context) {
        return child;
      }),
    );
  }

  static pushForResult<T>({
    dynamic arguments,
    Map<String, String>? parameters,
  }) async {
    return await Get.toNamed(
      '$T',
      arguments: arguments,
      parameters: parameters,
    );
  }

  static pushAndRemoveUntil<T>({
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAllNamed(
      '$T',
      arguments: arguments,
      parameters: parameters,
    );
  }

  static popAndRemoveUntil<T>() {
    Get.until((route) => route.settings.name == '$T');
  }
}

