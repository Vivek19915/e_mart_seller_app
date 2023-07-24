import 'package:e_mart_seller_app/const/const.dart';

class StoreServices{

  static getProfile(){
    return firestore.collection(vendorsCollection).where('id',isEqualTo: currentUser!.uid).get();
  }
  
  static getMessages(uid){
    return firestore.collection(chatsCollection).where('toId',isEqualTo: uid).snapshots();
  }


  static getOrders(uid){
    return firestore.collection(ordersCollection).where('vendors',arrayContains: uid).snapshots();   //arrayContains--> since vendors is list of ids
  }


  static getProducts(){
    return firestore.collection(productsCollection).where('vendor_id',isEqualTo: currentUser!.uid).snapshots();   //arrayContains--> since vendors is list of ids
  }


  static getPopularProducts(){
    //so whatever product have more value wishlist will be the popular product ---> as more suer like that product
    return firestore.collection(productsCollection).where('vendor_id',isEqualTo: currentUser!.uid).orderBy('p_wishlist'.length);
  }

}