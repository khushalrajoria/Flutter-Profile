import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../utils/text_style.dart';
import 'package:lottie/lottie.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Contact Details",style:mode? darkheaderTextStyle:headerTextStyle,),
          const SizedBox(height: 20,),
          _itemWidget("https://mail.google.com/mail/u/0/#inbox","Email","rajoriakhushal@gmail"),
          _itemWidget("tel:8112202713","Mobile","Dial Here"),
          _itemWidget("https://github.com/khushalrajoria","Github","@KhushalRajoria"),
          _itemWidget("https://www.linkedin.com/in/khushal-rajoria-cse/","Linkdin","@KhushalRajoriaCse"),
          const SizedBox(height: 170,),
          Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset('assets/message.json')),
        ],
      ),
    );
  }
  Widget _itemWidget(link,name,id){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       const SizedBox(height: 15,),
          Text(name,style:mode? darksubHeaderTextStyle:subHeaderTextStyle.copyWith(fontSize: 18),),
          InkWell(
            onTap: (){
              String url =link;
              final Uri uri = Uri.parse(url);
              launchUrl(uri);
            },
            child: Text(id,style:const TextStyle(fontSize: 18,color: Colors.blue),)),
      ],
    );
  }

 
}
