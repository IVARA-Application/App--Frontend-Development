import 'package:get/get.dart';
import 'package:ivara_app/Controllers/EBooksController.dart';
import 'Controllers/FirebaseController.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FirebaseController>(() => FirebaseController());
    Get.put(EBooksController());
  }

}