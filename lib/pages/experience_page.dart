import 'package:flutter/material.dart';


import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/text_style.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Professional Experience",
            style:mode? darkheaderTextStyle:headerTextStyle,
          ),
          _itemWidget("July 2022 - Dec 2022(Practice School)", "-Yakult India Pvt. Ltd(Delhi)\n-Aryan Clean Environment Technologies Pvt. Ltd.(Gurugram)\n-Hughes Systique Corporation Pvt. Ltd.(Delhi)"),
          _itemWidget("12th August 2022", "Worked on a website known as 'Travel Dial', which included: \nHTML\nCSS\nJava Script"),
          _itemWidget("Dec 2022 - Jan 2023", "Worked on a App known as 'Showper', which included:\nFlutter front UI and Ux \npractice purpose along with some function coding"),
          _itemWidget("1st Feb 2023", "Worked on a App known as 'DugOut', which included:\nFlutter front end and backEnd"),
          _itemWidget("29th May 2023", "Intern for 'Twidllr', which a tech based start-up which does:\nDigital Brading \nWeb development \nApp development  "),
          _itemWidget("1st May 2024-1st June 2024", "Freelanced for a client from american express for complete creation of a dating app on Flutter\nWith backend team using nodejs and postgress database"),
          const SizedBox(
            height: 10,
          ),
            ]
          )
      );
  }

  Widget _itemWidget(title, description) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                margin: const EdgeInsets.only(right: 10),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: mode?const Color.fromARGB(255, 31, 243, 197):Colors.grey),
              ),
              Text(
                title,
                style:mode? darksubHeaderTextStyle:subHeaderTextStyle,
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 6, top: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 2, color: mode?const Color.fromARGB(255, 31, 243, 197):Colors.grey))),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: mode ?darkcardBGColor:cardBGColor),
              child: Text(description,style: TextStyle(color: mode ?Colors.white:Colors.grey),),
            ),
          )
        ],
      ),
    );
  }
}

