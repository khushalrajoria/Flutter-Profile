import 'package:flutter/material.dart';
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
          _itemWidget("Email","rajoriakhushal@gmail.com"),
          _itemWidget("Mobile","+91 8112202713"),
          // ignore: prefer_const_constructors
          SizedBox(height: 275,),
          Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset('assets/message.json')),
        ],
      ),
    );
  }
  Widget _itemWidget(title,value){
    return Container(
      margin: const EdgeInsets.only(top:15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style:mode? darksubHeaderTextStyle:subHeaderTextStyle,),
          Text(value, style:mode? darksubHeaderTextStyle:subHeaderTextStyle,),
        ],
      ),
    );
  }
}
