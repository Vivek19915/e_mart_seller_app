import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/views/home_screen/home.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:e_mart_seller_app/widgets/our_button.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox,
            normalText(text: welcome,size: 18.0),
            20.heightBox,
            Row(
              children: [
                Image.asset(icLogo,width: 70,height: 70,).box.border(color: Colors.white).rounded.padding(EdgeInsets.all(8)).make(),
                10.widthBox,
                boldText(text: appname,size: 22.0),
              ],
            ),
            60.heightBox,
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail,color: purpleColor,),
                    border: InputBorder.none,
                    hintText: emailHint,

                  ),
                ),
                10.heightBox,
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: purpleColor,),
                    border: InputBorder.none,
                    hintText: passHint,

                  ),
                ),
                10.heightBox,
                Align(alignment:Alignment.centerRight,child: TextButton(onPressed: (){}, child: normalText(text: forgotPassword,color: purpleColor))),
                20.heightBox,
                ourButton(title: login,onPress: (){Get.to(()=>Home());}).box.width(context.screenWidth-100).make()
              ],
            ).box.white.rounded.outerShadowMd.padding(EdgeInsets.all(8)).make(),

            10.heightBox,
            Center(child: normalText(text: anyProblem,color: lightGrey)),
            Spacer(),
            boldText(text: credit).box.makeCentered(),
            20.heightBox

          ],
        ).box.padding(EdgeInsets.all(12)).make(),
      ),

    );
  }
}
