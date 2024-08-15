import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/text_style.dart';

class TeamPage extends StatelessWidget {
  var descriptions =
      "Team DugOut was extensive project with 10 members which included Survery and feedback team, degign and storyborading team , App front end and backEnd team and Machine learning model Team,check more about the app in the portfolio";
  var descriptions1 =
      "Fling was made as a freelance projects it was made togther with Aditya bansal @aditya.bansal.22cse@bmu.edu.in";
  var descriptions2 =
      "Travel Dial was created by 3 students group who collectively worked on HTML ,CSS , JavaScript and monogDB database";
  var descriptions3 =
      "Hanuman Traders was a first industry ready project with I made with Prakhar Maheshawri (prakharm2003@gmail.com) on word press";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Our Team",
            style:mode? darkheaderTextStyle:headerTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "I have worked on both college project as a group and as well as an individual also during my internShip I have worked with an indurstrial firm and communicated with real world clients and had their feedback reflected and made successful statisfying projects ",
            style:mode? darkbodyTextStyle:bodyTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          _itemWidget("DugOut Team", "assets/avtar1.png", descriptions),
          _itemWidget("FlingTeam", "assets/avtar2.png", descriptions1),
          _itemWidget("TravelDial Team", "assets/avtar3.png", descriptions2),
          _itemWidget("Hanuman Traders Team", "assets/avtar4.png", descriptions3),
        ],
      ),
    );
  }

  Widget _itemWidget(name, image, description) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: mode ?darkcardBGColor:cardBGColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style:mode? darksubHeaderTextStyle:subHeaderTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style:mode? darkbodyTextStyle:bodyTextStyle,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
