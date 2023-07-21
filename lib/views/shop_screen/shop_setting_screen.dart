import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';

import '../../widgets/normal_text.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: 'Shop Settings',size: 20.0),
        actions: [
          TextButton(onPressed: (){} , child: normalText(text: "Save" ,size: 18.0))
        ],
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            customTextField(label: "Shop Name" , hint: nameHint,icon: Icons.shopify_rounded),
            customTextField(label: address , hint: shopAddressHint,icon: Icons.location_on),
            customTextField(label: mobile , hint: shopMobileHint,icon: Icons.phone),
            customTextField(label: website , hint: shopwebsiteHint,icon: Icons.web),

            // for desc part -->
            customTextField(label: description , hint: shopDescHint,icon: Icons.description, isDesc: true),
          ],
        ).box.padding(EdgeInsets.all(10)).make(),
      ),
    );
  }
}
