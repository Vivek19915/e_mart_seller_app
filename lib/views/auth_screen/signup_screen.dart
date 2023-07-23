import 'package:e_mart_seller_app/const/const.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/normal_text.dart';
import '../../widgets/our_button.dart';
import '../home_screen/home.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();


    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  controller: authController.nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: purpleColor,),
                    border: InputBorder.none,
                    hintText: "eg : vednor name",

                  ),
                ),
                10.heightBox,
                TextFormField(
                  controller: authController.emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded,color: purpleColor,),
                    border: InputBorder.none,
                    hintText: emailHint,
                  ),
                ),
                10.heightBox,
                TextFormField(
                  controller: authController.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: purpleColor,),
                    border: InputBorder.none,
                    hintText: passHint,
                  ),
                ),
                10.heightBox,
                Obx(
                      ()=> authController.isloading.value ? Center(child: loadingIndicator(),)
                      :ourButton(
                      title: "Sign Up",
                      onPress: ()async{

                          try {
                            await authController.signupMethod(context: context,
                                useremail: authController.emailController.text,
                                userpassword: authController.passwordController.text)
                                .then((value) {
                              // jese hi signup hojaye database me info store kar lege
                              return authController.storeUserData(
                                  email: authController.emailController.text,
                                  name: authController.nameController.text,
                                  password: authController.passwordController.text);
                            }).then((value) {
                              // ab databse ,me stre hone ke baad jab return hoga then go to home screen
                              VxToast.show(context, msg: "Logged in Succesfully");
                              Get.offAll(() => const Home());
                            });
                          }
                          catch (e) {
                            authController.isloading(false);
                            //and by chance koi error aata h toh signout karva dege user ko
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }

                      }).box.width(context.screenWidth-100).make(),
                )
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
