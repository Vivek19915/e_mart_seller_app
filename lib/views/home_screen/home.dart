import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/controllers/home_controllers.dart';
import 'package:e_mart_seller_app/views/home_screen/home_screen.dart';
import 'package:e_mart_seller_app/views/orders_screen/orders_screen.dart';
import 'package:e_mart_seller_app/views/products_screen/product_screen.dart';
import 'package:e_mart_seller_app/views/profile_screen/profile_screen.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var homeController = Get.put(HomeController());

    var navScreens = [
      HomeScreen(),
      ProductsScreen(),
      OrdersScreen(),
      ProfileScreen(),
    ];


    var bottomNavbar = [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: dashboard),
        BottomNavigationBarItem(icon: Image.asset (icProducts,color: darkGrey,width: 24,),label: products),
        BottomNavigationBarItem(icon: Image.asset (icOrders,color: darkGrey,width: 24,),label: orders),
        BottomNavigationBarItem(icon: Image.asset (icGeneralSettings,color: darkGrey,width: 24,),label: settings),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
          ()=> BottomNavigationBar(
          onTap: (index){
            homeController.navIndex.value = index;
          },
            currentIndex: homeController.navIndex.value,
          type: BottomNavigationBarType.fixed,
          items: bottomNavbar,
          selectedItemColor: purpleColor,
          unselectedItemColor:darkGrey,
        ),
      ),
      body: Column(
        children: [
          Obx(()=> Expanded(child: navScreens.elementAt(homeController.navIndex.value)))
        ],
      ),
    );
  }
}
