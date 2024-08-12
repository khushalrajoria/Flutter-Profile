import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';

class PortfolioPage extends StatefulWidget {
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
          return const Center(child: CircularProgressIndicator());
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
                  List<Color> colors = (doc['colors'] as List<dynamic>)
                      .map((colorString) => Color(int.parse(colorString)))
                      .toList();

                  List<String> titles = List<String>.from(doc['titles']);
                  List<String> images = List<String>.from(doc['images']);
                  String title = doc['title'];
                  String description = doc['description'];

                  return _itemWidget(
                    context,
                    title,
                    colors,
                    titles,
                    images,
                    width,
                    description,
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
  ) {
    return Expanded(
      flex: 1,
      child: InkWell(
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
                  height: 720,
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
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 100,
          alignment: Alignment.center,
          child: Text(title, style: mode ? darkbodyTextStyle : bodyTextStyle),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../main.dart';
// import '../utils/AppColors.dart';
// import '../utils/common_string.dart';
// import '../utils/text_style.dart';

// class PortfolioPage extends StatefulWidget {
//   @override
//   _PortfolioPageState createState() => _PortfolioPageState();
// }

// class _PortfolioPageState extends State<PortfolioPage> {
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Portfolio'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('portfolio').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           var projects = snapshot.data!.docs;
//           return SingleChildScrollView(
//             padding: EdgeInsets.only(left: 20, right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text("Portfolio", style: mode ? darkheaderTextStyle : headerTextStyle),
//                 Container(
//                   child: Text(description, style: mode ? darkbodyTextStyle : bodyTextStyle),
//                   margin: EdgeInsets.only(top: 20, bottom: 10),
//                 ),
//                 SizedBox(height: 3,),
//                 Text("Click to see projects", style: mode ? darkbodyTextStyle : bodyTextStyle),
//                 GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: projects.length,
//                   itemBuilder: (context, index) {
//                     var project = projects[index];
//                     return itemWidget(
//                       context,
//                       project['Title'],
//                       [Color.fromARGB(255, 193, 193, 193), Colors.white60],
//                       [project['Title']],
//                       [project['image']],
//                       width,
//                       project['description'],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// Widget itemWidget(BuildContext context, String title, List<Color> colors, List<String> titl, List<String> image, double width, String desc) {
//   return Expanded(
//     flex: 1,
//     child: InkWell(
//       onTap: () {
//         showModalBottomSheet<void>(
//           barrierColor: const Color.fromARGB(180, 158, 158, 158),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(23),
//           ),
//           elevation: .5,
//           context: context,
//           builder: (BuildContext context) {
//             return SingleChildScrollView(
//               child: Container(
//                 height: 720,
//                 color: mode ? backgrounddark : backgroundLight,
//                 width: width,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 20),
//                     Container(
//                       height: 250,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: titl.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: [
//                               Stack(
//                                 children: [
//                                   Container(
//                                     height: 200,
//                                     width: width,
//                                     alignment: Alignment.center,
//                                     child: Image.network(image[index], fit: BoxFit.contain),
//                                   ),
//                                   Positioned(
//                                     top: 5,
//                                     right: 5,
//                                     child: Container(
//                                       height: 20,
//                                       width: 40,
//                                       decoration: BoxDecoration(
//                                         color: Color.fromARGB(123, 0, 0, 0),
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "${index + 1}/${titl.length}",
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 10),
//                               SizedBox(
//                                 width: width,
//                                 child: Center(
//                                   child: Text(titl[index], style: mode ? darksubHeaderTextStyle : subHeaderTextStyle),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child: Text(desc, style: mode ? darkbodyTextStyle : bodyTextStyle),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.all(3),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           gradient: LinearGradient(
//             colors: colors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         height: 100,
//         child: Center(
//           child: Text(
//             title,
//             style: mode ? darkbodyTextStyle : bodyTextStyle,
//           ),
//         ),
//       ),
//     ),
//   );
// }
