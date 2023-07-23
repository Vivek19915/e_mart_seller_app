import 'package:e_mart_seller_app/const/const.dart';

class StoreServices{

  static getProfile(){
    return firestore.collection(vendorsCollection).where('id',isEqualTo: currentUser!.uid).get();
  }
  
  static getMessages(uid){
    return firestore.collection(chatsCollection).where('toId',isEqualTo: uid).snapshots();
  }


}