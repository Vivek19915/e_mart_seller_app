import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/profile_controller.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';
import 'package:e_mart_seller_app/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../widgets/normal_text.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  var profileController = Get.find<ProfileController>();
  @override
  void initState() {
    profileController.nameController.text = widget.username!;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: 'Edit Profile',size: 20.0),
          actions: [
            profileController.isloading.value ? Center(child: loadingIndicator(color: white),)
            : TextButton(onPressed: () async {

              profileController.isloading(true);
              if(profileController.profilrIMgPath.value.isNotEmpty){
                //means user change the profile image
                await profileController.uploadProfileImage();
              }
              else {
                //if user dont change the profile image --- then give it previosu fprofile image
                profileController.profileImageLink = profileController.snapshotData['imageUrl'];
              }


              //if old password matches then update the new password
              if(profileController.oldpassController.text == profileController.snapshotData['password']){
                await profileController.changeAuthPassword(
                    email: profileController.snapshotData['email'],
                    oldpass: profileController.oldpassController.text,
                    newpass: profileController.newpassController.text
                );

                await profileController.updateProfile(
                    imgUrl: profileController.profileImageLink ,
                    name: profileController.nameController.text ,
                    password: profileController.newpassController.text
                );

                VxToast.show(context, msg: "Updated");
              }

              //if user only want to update image then we should not ask it for old pass
              if(profileController.oldpassController.text.length == 0 && profileController.newpassController.text.length==0 ){
                await profileController.updateProfile(
                    imgUrl: profileController.profileImageLink ,
                    name: profileController.nameController.text,
                    password: profileController.snapshotData['password']
                );
                VxToast.show(context, msg: "Updated");
              }

              else if(profileController.oldpassController.text != profileController.snapshotData['password']){
                VxToast.show(context, msg: "Enter correct old password");
                profileController.isloading(false);
              }


            } , child: normalText(text: "Save" ,size: 18.0)).box.padding(EdgeInsets.all(5)).make()
          ],
        ),

        body:Column(
            children: [


              //if data image url and controller path is empty
              profileController.snapshotData['imageUrl']=='' && profileController.profilrIMgPath.isEmpty
                  ? Image.asset(imgProduct,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).width(80).make()
              //if data image url is not empty and controller path is empty
                  : profileController.snapshotData['imageUrl']!='' && profileController.profilrIMgPath.isEmpty
                  ? Image.network(profileController.snapshotData['imageUrl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
              //both are not empty
                  : Image.file(File(profileController.profilrIMgPath.value),width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),


              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: (){
                    profileController.changeImage(context);
                  },
                  child: normalText(text: "Change Image",color: purpleColor)
              ),
              10.heightBox,
              Divider(color: Colors.white,),
              customTextField(label: name , hint: nameHint,icon: Icons.person,controller: profileController.nameController),
              20.heightBox,
              Align(alignment:Alignment.centerLeft,child: boldText(text: "Change Password").box.padding(EdgeInsets.symmetric(horizontal: 10)).make()),
              5.heightBox,
              customTextField(label: "Enter Old Password",hint: passHint,icon: Icons.remove_red_eye,controller: profileController.oldpassController),
              5.heightBox,
              customTextField(label: "Enter New Password"  ,hint: passHint,icon: Icons.remove_red_eye,controller: profileController.newpassController),


            ],
          ).box.padding(EdgeInsets.all(8)).make(),

      ),
    );
  }
}
