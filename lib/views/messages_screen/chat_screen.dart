import 'package:e_mart_seller_app/const/const.dart';
import 'package:e_mart_seller_app/views/messages_screen/components/chat_bubble.dart';

import '../../widgets/normal_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Chats",size: 16.0,color: purpleColor),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [


            //message section--->
            Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return chatBubble();
                    })
            ),
            10.heightBox,


            //message sending area----->
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                        hintText: "Enter Message",
                        border: OutlineInputBorder(borderSide: BorderSide(color: purpleColor)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: purpleColor)),
                    ),
                  ).expand(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send ,color: purpleColor,))
                ],
              ).box.height(50).make(),
            )
          ],
        ),
      ),
    );
  }
}
