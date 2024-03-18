import 'package:get/get.dart';
import 'package:salesfokuz_mt/Controller/network_controller.dart';

class DependencyInjection{


  static void init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}