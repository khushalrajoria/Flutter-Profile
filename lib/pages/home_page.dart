import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';
import '../widgets/app_shimmer_effect.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mode? backgrounddark :backgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                // future: FirebaseController().getFullName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("snapshot.data.toString()", style:mode? darkheaderTextStyle:headerTextStyle);
                  }
                  return AppShimmer(
                    child: Text("Khushal Rajoria", style:mode? darkheaderTextStyle:headerTextStyle),
                  );
                }, future: null,),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: FutureBuilder(
                  // future: FirebaseController().getDesignation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text("snapshot.data.toString()", style:mode? darkheaderTextStyle:headerTextStyle);
                    }
                    return AppShimmer(
                      child: Text("Btech CSE underGradudate", style:mode? darkheaderTextStyle:headerTextStyle),
                    );
                  }, future: null,),
            ),
            FutureBuilder(
                // future: FirebaseController().getDescription(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("snapshot.data.toString()", style:mode? darkbodyTextStyle:bodyTextStyle);
                  }
                  return AppShimmer(
                    child: Text("Student/Intern",style:mode? darkheaderTextStyle:headerTextStyle),
                  );
                }, future: null,),
            Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Text(title2, style:mode? darkheaderTextStyle:headerTextStyle)),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                description1,
                style:mode? darkbodyTextStyle:bodyTextStyle,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: Text(title3, style:mode? darkheaderTextStyle:headerTextStyle)),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20),
              child: Text(
                description2,
                style:mode? darkbodyTextStyle:bodyTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
