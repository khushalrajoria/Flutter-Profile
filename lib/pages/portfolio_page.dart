import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';
import '../widgets/skeleton.dart'; 

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('portfolio').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Skeleton(height: 30, width: double.infinity), 
                const SizedBox(height: 20),
                const Skeleton(height: 20, width: double.infinity), 
                const SizedBox(height: 20),
                Wrap(
                  children: List.generate(5, (index) => PortfolioItemSkeleton(width: width)).toList(),
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error fetching portfolio items"));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No portfolio items found"));
        }

        final portfolioDocs = snapshot.data!.docs;

        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Portfolio", style: mode ? darkheaderTextStyle : headerTextStyle),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(description, style: mode ? darkbodyTextStyle : bodyTextStyle),
              ),
              const SizedBox(height: 3),
              Text("Click to see projects", style: mode ? darkbodyTextStyle : bodyTextStyle),
              Wrap(
                children: portfolioDocs.map<Widget>((doc) {
                  List<Color> colors = (doc['colors'] as List<dynamic>).map((colorString) {
                    int? colorValue = int.tryParse(colorString);
                    return colorValue != null ? Color(colorValue) : Colors.grey;
                  }).toList();
                  List<String> titles = List<String>.from(doc['titles'] ?? []);
                  List<String> images = List<String>.from(doc['images'] ?? []);
                  String title = doc['title'] ?? 'No Title';
                  String description = doc['description'] ?? 'No Description';
                  String githubLink = doc['githubLink'] ?? '';

                  return _itemWidget(
                    context,
                    title,
                    colors,
                    titles,
                    images,
                    width,
                    description,
                    githubLink,
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _itemWidget(
    BuildContext context,
    String title,
    List<Color> colors,
    List<String> titles,
    List<String> images,
    double width,
    String description,
    String githubLink,
  ) {
    return InkWell(
      onTap: () {
        show = true;
        showModalBottomSheet<void>(
          barrierColor: const Color.fromARGB(180, 158, 158, 158),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          elevation: .5,
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                height: 650,
                color: mode ? backgrounddark : backgroundLight,
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: titles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    width: width,
                                    alignment: Alignment.center,
                                    child: Image.network(images[index], fit: BoxFit.contain),
                                  ),
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Container(
                                      height: 20,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(123, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${index + 1}/${titles.length}",
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: width,
                                child: Center(
                                  child: Text(
                                    titles[index],
                                    style: mode ? darksubHeaderTextStyle : subHeaderTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(description, style: mode ? darkbodyTextStyle : bodyTextStyle),
                    ),
                    if (githubLink.isNotEmpty) 
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5),
                        child: InkWell(
                          onTap: () {
                            _launchUrl(githubLink);
                          },
                          child: const Text(
                            '\nView GitHub',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: colors.isNotEmpty ? colors : [Colors.grey, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: 100,
        alignment: Alignment.center,
        child: Text(title, style: mode ? darkbodyTextStyle.copyWith(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 18) : bodyTextStyle.copyWith(fontWeight: FontWeight.w800,color: Colors.white,fontSize: 18)),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}

class PortfolioItemSkeleton extends StatelessWidget {
  final double width;

  const PortfolioItemSkeleton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade300,
      ),
      height: 100,
      // width: (width / 2) - 30,
      width: double.infinity,
      child: const Skeleton(height: 100, width: double.infinity),
    );
  }
}


/*
  So what i have done to integrate firebase is to first make a project in firebase with flutter option
  then i have created a collection in the database and then i have used the following code to get
  the data from the database and display it in the card widget

  the commands I have used are
  firebase login
  flutter pub global activate flutterfire_cli
  flutterfire configure
  
  then I made changed main.dart 
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  added this line to my main function and made it async


  then I used future builder/ stream builder to fetch and show the data in my card
 */