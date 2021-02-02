import 'package:get/get.dart';
import 'Controllers/FirebaseController.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }

}