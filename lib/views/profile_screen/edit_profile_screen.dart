import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/custom_textfield.dart';

import '../../widgets/normal_text.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: 'Edit Profile',size: 20.0),
        actions: [
          TextButton(onPressed: (){} , child: normalText(text: "Save" ,size: 18.0))
        ],
      ),

      body: Column(
        children: [
          Image.asset(imgProduct,width: 150,).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: (){},
              child: normalText(text: "Change Image",color: purpleColor)
          ),
          10.heightBox,
          Divider(color: Colors.white,),
          customTextField(label: name , hint: nameHint,icon: Icons.person),
          5.heightBox,
          customTextField(label: password,hint: passHint,icon: Icons.remove_red_eye),
          5.heightBox,
          customTextField(label: "Confirm Passord"  ,hint: passHint,icon: Icons.remove_red_eye),


        ],
      ).box.padding(EdgeInsets.all(8)).make(),
    );
  }
}
