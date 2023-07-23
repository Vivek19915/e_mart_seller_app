import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../const/firebase_consts.dart';

class AuthController extends GetxController{

  var isloading = false.obs;


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  //login method ----->>>>>>>
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;
    //try and catch code
    try{
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }






  //signup method
  Future<UserCredential?> signupMethod({useremail,userpassword,context}) async{
    UserCredential? userCredential;
    try{
      userCredential =  await auth.createUserWithEmailAndPassword(email: useremail, password: userpassword);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }


  //storing data on firebase store
  // here one collection is made on firestore of name userCollection where with particular userid we set some things relted to that user
  storeUserData({name,password,email})async{
    DocumentReference store = await firestore.collection(vendorsCollection).doc(currentUser!.uid);  ////or we can wrire -->FirebaseFirestore.instance.collection("users")
    store.set({
      'vendor_name' : name,
      'password' : password,
      'email' : email,
      'imageUrl' : '',
      'id' : currentUser!.uid,
    });
  }


  //signout method
  signoutMethod(context)async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }

}