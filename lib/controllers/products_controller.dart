import 'dart:io';

import 'package:e_mart_seller_app/const/const.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/category_model.dart';

class ProductsController extends GetxController{

  //text editing controller;
  var pnameController = TextEditingController();
  var ppriceController = TextEditingController();
  var pdescController = TextEditingController();
  var pquantityController = TextEditingController();

  //lists--->
  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];            //list of category model ----->>>>>>
  var pImagesList = List<dynamic>.generate(3, (index) => null).obs;

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

}