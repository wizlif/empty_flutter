
import 'package:empty_flutter/src/controllers/default.dart';
import 'package:get/get.dart';

class DefaultBind extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DefaultController>(() => DefaultController());
  }

}