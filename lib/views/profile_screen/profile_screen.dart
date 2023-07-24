import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/auth_controller.dart';
import 'package:e_mart_seller_app/controllers/profile_controller.dart';
import 'package:e_mart_seller_app/services/store_services.dart';
import 'package:e_mart_seller_app/splash_screen.dart';
import 'package:e_mart_seller_app/views/auth_screen/login_screen.dart';
import 'package:e_mart_seller_app/views/messages_screen/messages_screen.dart';
import 'package:e_mart_seller_app/views/profile_screen/edit_profile_screen.dart';
import 'package:e_mart_seller_app/views/shop_screen/shop_setting_screen.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../widgets/normal_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    var profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings,size: 20.0),
        actions: [
          IconButton(onPressed: (){Get.to(()=>EditProfileScreen(
            username: profileController.snapshotData['vendor_name'],
          ));}, icon: Icon(Icons.edit)),
          TextButton(onPressed: () async {

            await Get.find<AuthController>().signoutMethod(context);
            Get.offAll(()=>SplashScreen());
            } , child: normalText(text: "Logout" ,size: 18.0))
        ],
      ),



      body: FutureBuilder(
        future: StoreServices.getProfile(),
        builder: (BuildContext context , AsyncSnapshot<QuerySnapshot>snapshot){
          if(snapshot.hasData == false){
            return Center(child: loadingIndicator(color: white),);
          }
          else {

            var data = snapshot.data!.docs[0];
            profileController.snapshotData = snapshot.data!.docs[0];        //so that we can use these values on next screen also

            return Column(
              children: [
                ListTile(
                  leading: data['imageUrl'] == null ?  Image.network(profileController.snapshotData['imageUrl'],width:100,fit: BoxFit.fitHeight,).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.asset(imgProduct,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  title: boldText(text:"${data['vendor_name']}"),
                  subtitle: normalText(text: data['email'].toString()),
                ),

                Divider(color: Colors.white,),
                10.heightBox,

                Column(
                  children: List.generate(profileButtonsIcons.length, (index) {
                    return ListTile(
                      onTap: (){
                        if(index == 0)Get.to(()=>ShopSettingsScreen());
                        if(index == 1)Get.to(()=>MessagesScreen());
                      },
                      leading: Icon(profileButtonsIcons[index],color: Colors.white,),
                      title: normalText(text: profileButtonsTitles[index]),

                    );
                  }),
                ).paddingAll(8)

              ],
            );

          }
        },
      ),

    );

  }
}
