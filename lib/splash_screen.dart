
import 'package:e_mart_seller_app/views/auth_screen/login_screen.dart';
import 'package:e_mart_seller_app/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'const/const.dart';
import 'controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var authController = Get.put(AuthController());

  //creating ethod to change splash screen to login screen
  changeScreen(){
    //first we have to create delay for splash screen
    Future.delayed(Duration(seconds: 2),(){
      //check --->>>if user is already logwd in previously
      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=>LoginScreen());
        }
        else{
          //user is already logged in h -->then direct it to home page
          Get.to(()=>Home());
          // Get.to(()=>LoginScreen());
        }
      });
    });
  }


  //and this funtcion mjust be call as soon as this state start
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: purpleColor,
      body: Center(
          child: Column(
            children: [
              200.heightBox,
              Align(
                  alignment:Alignment.center,
                  child: Image.asset(icLogo,width: 300,)
              ),
              SizedBox(height: 20,),   // velocity -->20.heightBox

              10.heightBox,
              appname.text.bold.white.size(22).make() ,      // using velocity x
              10.heightBox,
              "Version 1.0.0".text.semiBold.white.make(),
              Spacer(),
              "@Vivek_Dev".text.bold.white.size(12).make(),
              30.heightBox,
            ],
          ),
        ),
      );

  }
}
