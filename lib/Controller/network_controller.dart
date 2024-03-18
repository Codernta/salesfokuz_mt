import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkController extends GetxController{

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit(){
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult){
    if(connectivityResult == ConnectivityResult.none){
      Get.rawSnackbar(
          messageText:Text('Please enable internet connection',style: TextStyle(color: Colors.white),),
          duration: const Duration(days: 1),
          backgroundColor: Colors.redAccent,
          snackStyle: SnackStyle.GROUNDED,
          icon: Icon(Icons.signal_wifi_connected_no_internet_4,color: Colors.white,),
          isDismissible: false);
    }else{
      if(Get.isSnackbarOpen){
        Get.closeCurrentSnackbar();
      }
    }
  }
}