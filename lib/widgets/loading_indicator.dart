import 'package:e_mart_seller_app/const/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator({color = purpleColor}){
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(color),
  );
}