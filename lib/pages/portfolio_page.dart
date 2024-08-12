// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:flutterprofile/utils/AppIcons.dart';

import '../main.dart';
import '../utils/AppColors.dart';
import '../utils/common_string.dart';
import '../utils/text_style.dart';
// ignore: use_key_in_widget_constructors
class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}
bool show =false;
class _PortfolioPageState extends State<PortfolioPage> {
    List<String> Pincklist=["Pinkcity App","Logo","Card payment","login","Change address","individual item","floating action button"];
  List<String> Pincklist2=["assets/pinkcity.jpg","assets/pinkcity69.jpg","assets/pinkcity1.jpg","assets/pinkcity6.jpg","assets/pinkcity2.jpg","assets/pinkcity3.jpg","assets/pinkcity5.jpg"];
  List<Color> Pincklist3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];

  List<String> Dugoutlist=["Dugout App","Logo","Player Score Prediction","Score Page","Win prediction"];
  List<String> Dugoutlist2=["assets/dugout.jpg","assets/dugout4.jpg","assets/dugout1.jpg","assets/dugout3.jpg","assets/dugout2.jpg"];
  List<Color> Dugoutlist3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];

  List<String> Notechatlist=["NoteChat App","HomeScreen","Check notes page","Note Created page"];
  List<String> Notechatlist2=["assets/notechat.png","assets/notechat2.jpg","assets/notechat1.jpg","assets/notechat3.jpg"];
  List<Color> Notechatlist3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];

  List<String> movielist=["Movie Recommendations","search"];
  List<String> movielist2=["assets/movie.png","assets/movie2.png"];
  List<Color> movielist3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];

  List<String> travellist=["TravelDial website","home","another page"];
  List<String> travellist2=["assets/travel.png","assets/travelhome.png","assets/travel1.png",];
  List<Color> travellist3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];

  List<String> Cataloglist=["Catalog App","Individual item","Login page"];
  List<String> Cataloglist2=["assets/catalog.png","assets/catalo1.png","assets/catalog2.png"];
  List<Color> Cataloglistt3=[const Color.fromARGB(255, 193, 193, 193),Colors.white60];


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Portfolio", style: mode? darkheaderTextStyle:headerTextStyle),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(description, style: mode? darkbodyTextStyle:bodyTextStyle),
          ),
          const SizedBox(height: 3,),
          Text("Click to see projects", style: mode? darkbodyTextStyle:bodyTextStyle),
          Row(
            children: [
             _itemWidget(context,"PINKCITY\nFlutter app",Pincklist3,Pincklist,Pincklist2,width,"Pink city is a Indian mouth Freshener company that makes various kinds of wet and dry mouth fresheners, right now they are only focusing on wholesale purchases of their products hence this project is to make the their products reachable for retails.\nThe project has:\n\nGoogle maps \n   :inegration \n   :Location tracking\n   :Google suggestions\n   :Automatic camera tracing\nFirebase authentication\nover 20 screens\nCustom logo from figma\nSplash screen\nOTP\nforget Password option\nThe app is still under progess as it has to get extensive communication with the clients.\n\n\n"),
                _itemWidget(context,"CATALOG\nFlutter app",Cataloglistt3,Cataloglist,Cataloglist2,width,"A shopping app where you add items to your cart also remove them and you will have you cart Total added as per the items added in you cart,\nIt was made using Flutter, plugins like velocityX.\nThe project have:\n\nNight and light mode \nLogin and password verification\nNative Animations\nUsed Json files to get data\n\nThe project is not made into an APK as I want ot increase it further by myself rightnow\n\n\n"),
                _itemWidget(context,"DUGOUT\nFlutter app",Dugoutlist3,Dugoutlist,Dugoutlist2,width,"Dugout is sports media App which has very detailed and extensive use of Flutter and Json file implentation which The app has various different section and 20 screen made with very organized work.\nThe app has\n\nJson files\nMachine learning projects:\n      -Win Prediction Model.\n      -Team Score Predection Model.\n       -Player Score Prediction Model.\nAlso shows history of matches and live score interface ready,but the app is limited due to lack of Score Fetching API as they are paid and this is a student project without funding,The app is a group project team is mentioned in teams section on the navbar Please cheack as your curosity\n\n\n"),
            ],
          ),
          Row(
            children: [
                _itemWidget(context,"TRAVEL DIAL\nWebsite",travellist3,travellist,travellist2,width,"It is a travelling website,Where user to search for there desired location to travel and also travel advisor can add thier packages to the site so traveller can check the details and book the desired package they want to,\nThe Project was made using :\n\nHTML\nCSS\nJAVASCRIPT\nDatabse in MongoDB\n\nThe project is incomplete and is hosted on GitHub.\n\n\n"),
                _itemWidget(context,"MRS\nML model",movielist3,movielist,movielist2,width,"Movie recommendation system is a machine learning model which can advice movies to the user according to the movie they liked,\nIt use Cosine similarity model to decide the recommendations on the various tag like the director,actors,genre and title to recommend movies to the user,top 5 movie's Images are shown using API from the 'TheMovieDatabase' site,which can be generated on the site Itself and the system have around 5000 movies data with 18columns out of which I have used 8 columns and their indexes.\nCurently the site is only on local host\nThe project was made by watching a video on Youtube,but my concepts on Consine similitry are very adequate\n\n\n"),
                _itemWidget(context,"NOTECHAT\nFlutter app",Notechatlist3,Notechatlist,Notechatlist2,width,"This have 2 parts \n'notes':As it is a notes app\n'chat':As it uses 'chatGPT' so bascially the app is a note making app where user can have chatGPT support as an voice assistant\nThe project has \n\nOpenAI's api for DALL-E and chatGPT along with controllers\nAniamations using Plugins\nFirebase setup\nFireStore\nCRUD funtionality\nSpeech to text\nText to speech Plugins\nGetX\nThe app has a splash screen as well as welcome screen which have GetX animations on them\n\n\n"), 
          
            ],
          ),
        ],
      ),
    );
  }
Widget _itemWidget(context,inde,List<Color>colo,List<String>titl,List<String>image,width,desc) {
    return  Expanded(
                flex: 1,
                  child: InkWell(
                    onTap: (){
                      show=true;
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
                    mainAxisSize: MainAxisSize.min, // Change to min to avoid taking infinite height
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 250, // Adjust the height based on your requirements
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: titl.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: width,
                                      alignment: Alignment.center,
                                      child: Image.asset(image[index], fit: BoxFit.contain),
                                    ),
                                    Positioned(top:5,right: 5,child: Container(height: 20,width: 40,decoration: BoxDecoration(color: const Color.fromARGB(123, 0, 0, 0),borderRadius: BorderRadius.circular(30)),child: Center(child: Text("${index+1}/${titl.length}",style: const TextStyle(color: Colors.white),),),),)
                                  ],
                                ),
                                const SizedBox(height: 10,),
                               SizedBox(
                                width: width,
                                child: Center(child: Text(titl[index], style: mode ? darksubHeaderTextStyle : subHeaderTextStyle))),

                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 5),
                        child: Text(desc, style: mode ? darkbodyTextStyle : bodyTextStyle),
                      ),
                    ],
    ),
  ),
);
            },
          ); // showmodal bottom sheet
                    },
                    child: Container(
                        // decoration: BoxDecoration(color: mode?Colors.blue.shade200:Colors.amber.shade300),
                        margin: const EdgeInsets.all(3),
                        // color: mode? darkcardBGColor:cardBGColor,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                           colors: colo,
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight,
                )
                        ),
                        height: 100, // this needs to be relaced by a logo or by name 
                        alignment: Alignment.center,

                        child: Text(inde,style: mode? darkbodyTextStyle:bodyTextStyle,),
                      ),
                  )
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
