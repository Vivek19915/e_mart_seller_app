import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/widgets/normal_text.dart';
import 'package:get/get.dart';

import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Messages",size: 16.0,color: purpleColor),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) {
              return ListTile(
                onTap: (){
                  Get.to(()=>ChatScreen());
                },
                leading: CircleAvatar(backgroundColor:Colors.white,child: Icon(Icons.person,color: purpleColor,)),
                title: boldText(text: "Username"),
                subtitle: normalText(text: "Last Message"),
                trailing: normalText(text: "10:45 PM"),
              ).box.color(purpleColor).margin(EdgeInsets.all(5)).roundedSM.make();
            }),
          ),
        ),
      ),
    );
  }
}
