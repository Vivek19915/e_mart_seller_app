import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController{

  var ordersLIst = [];
  var total_amount = 0.0;


  var confirmed = false.obs;
  var onDelievery = false.obs;
  var delievered = false.obs;



  getOrders(data){
    ordersLIst.clear();        //so that list dont contain previous orders
    for(var item in data['orders']){
      if(item['vendor_id'] == currentUser!.uid){
        //if that order belong to our product then we able to see only that not someone else product order
        ordersLIst.add(item);
      }
    }
    print(ordersLIst);
  }

  getOrdersTotalAmount(data){
    total_amount = 0 ;
    for(var item in data['orders']){
      if(item['vendor_id'] == currentUser!.uid){
        //if that order belong to our product then we able to see only that not someone else product order
        total_amount = total_amount + double.parse(item['total_price'].toString());
      }
    }
  }




  //change status of products
  changeOrderStatus({title,status,docId})async{
    var store = firestore.collection(ordersCollection).doc(docId);
    await store.set({
      title:status
    },SetOptions(merge: true));
  }
}