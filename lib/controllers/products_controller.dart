import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/home_controllers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../models/category_model.dart';

class ProductsController extends GetxController{


  late dynamic productsnapshot;


  var isloading = false.obs;

  //text editing controller;
  var pnameController = TextEditingController();
  var ppriceController = TextEditingController();
  var pdescController = TextEditingController();
  var pquantityController = TextEditingController();

  //lists--->
  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];            //list of category model ----->>>>>>
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);
  var pImagesLinks = [];

  //variable
  var categoryvalue= ''.obs;
  var subcategoryvalue= ''.obs;
  var selectedColorIndex= 0.obs;





  getCategories() async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }


  populateCategoryList() {
    categoryList.clear();
    for (var item in category) {
        categoryList.add (item.name);
    }
  }


  populateSubcategory(cat) {
    subcategoryList.clear();
    var data = category.where((element) => element .name == cat).toList();
    for (var i = 0; i < data.first.subcategories.length; i++) {
      subcategoryList.add(data.first.subcategories[i]);
    }
  }

  pickImage(index,context)async{
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 80);
      if(img == null){
        return;
      }
      else {
        pImagesList[index] = File(img.path);
      }
    }
    catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }




  ///to upload 3 products images
  uploadProductImages()async{
    pImagesLinks.clear();
    for(var item in pImagesList){
      if(item != null){
        var filename  = basename(item.path);
        var destination  = 'images/vendors/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLinks.add(n);
      }
    }
  }







  uploadProductDetails(context)async {
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      'p_featured': false,
      'p_category':categoryvalue.value,
      'p_colors': FieldValue.arrayUnion([Colors.red.value,Colors.black.value,Colors.white.value]),
      'p_desc': pdescController.text.toString(),
      'p_imgs': FieldValue.arrayUnion(pImagesLinks),
      'p_name': pnameController.text.toString(),
      'p_price':ppriceController.text.toString(),
      'p_quantity':pquantityController.text.toString(),
      'p_rating':"5.0",
      'p_seller':Get.find<HomeController>().username,
      'p_subcategory':subcategoryvalue.value,
      'p_wishlist':FieldValue.arrayUnion([]),
      'vendor_id':currentUser!.uid,
      'featured_id':''
    });

    VxToast.show(context, msg: "Product Uploaded");
  }


  //add or remove product from featured product

  addFeatured(docId)async{
    await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': currentUser!.uid,
      'p_featured': true
    },SetOptions(merge: true));
  }


  removeFeatured(docId)async{
    await firestore.collection(productsCollection).doc(docId).set({
      'featured_id': '',
      'p_featured': false
    },SetOptions(merge: true));
  }




  //to remove product from firebase
  removeProduct(docId)async{
    await firestore.collection(productsCollection).doc(docId).delete();
  }



}