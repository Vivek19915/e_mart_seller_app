import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/profile_controller.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/normal_text.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var profileController = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: purpleColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: 'Shop Settings',size: 20.0),
        actions: [
          Obx(
            ()=>TextButton(onPressed: () async {
              profileController.isloading(true);
              await profileController.updateShopDetails(
                shopaddress: profileController.shopAddressController.text,
                shopdesc: profileController.shopDescController.text,
                shopmobile: profileController.shopMobileController.text,
                shopname: profileController.shopnameController.text,
                shopwebsite: profileController.shopWebsiteController.text
              );
              VxToast.show(context, msg: "Shop details updated");
              profileController.isloading(false);
            } , child: profileController.isloading.value ? Center(child: loadingIndicator(color: white),)
                                                            :normalText(text: "Save" ,size: 18.0)),
          )
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            customTextField(label: "Shop Name" , hint: nameHint,icon: Icons.shopify_rounded,controller: profileController.shopnameController),
            customTextField(label: address , hint: shopAddressHint,icon: Icons.location_on,controller: profileController.shopAddressController),
            customTextField(label: mobile , hint: shopMobileHint,icon: Icons.phone,controller: profileController.shopMobileController),
            customTextField(label: website , hint: shopwebsiteHint,icon: Icons.web,controller: profileController.shopWebsiteController),

            // for desc part -->
            customTextField(label: description , hint: shopDescHint,icon: Icons.description, isDesc: true,controller: profileController.shopDescController),
          ],
        ).box.padding(EdgeInsets.all(10)).make(),
      ),
    );
  }
}
