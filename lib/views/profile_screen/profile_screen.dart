import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/views/messages_screen/messages_screen.dart';
import 'package:e_mart_seller_app/views/profile_screen/edit_profile_screen.dart';
import 'package:e_mart_seller_app/views/shop_screen/shop_setting_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../widgets/normal_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings,size: 20.0),
        actions: [
          IconButton(onPressed: (){Get.to(()=>EditProfileScreen());}, icon: Icon(Icons.edit)),
          TextButton(onPressed: (){} , child: normalText(text: "Logout" ,size: 18.0))
        ],
      ),


      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProduct).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(text:"Vender name"),
            subtitle: normalText(text: "vedndoremail@gmail.com"),
          ),

          Divider(),
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
      ),
    );

  }
}
