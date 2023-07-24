import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{


  @override
  void onInit() {
    super.onInit();
    getUsername();
    getOrdersCount();
  }

  var navIndex = 0.obs;

  var username = '';
  var count = 0;

  getUsername()async{
    var n = await firestore.collection(vendorsCollection).where('id',isEqualTo: currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['vendor_name'];
      }
    });

    username = n;
    print(username);
  }



  getOrdersCount() async {
     count = await firestore.collection(ordersCollection).where('vendors',arrayContains: currentUser!.uid).snapshots().length;
  }
}