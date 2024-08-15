import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:khushal/firebase_options.dart';
import 'pages/contact_page.dart';
import 'pages/experience_page.dart';
import 'pages/home_page.dart';
import 'pages/portfolio_page.dart';
import 'pages/team_page.dart';
import 'utils/AppColors.dart';
import 'utils/AppIcons.dart';
import 'widgets/navigation_menu_widget.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
bool mode=false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:AnimatedSplashScreen(
        duration: Duration.microsecondsPerMillisecond,
      splash: 'assets/logo.png',
      nextScreen: const MyHomePage(),
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 250,
      backgroundColor: Colors.white,
    ),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldkey =  GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: mode?backgrounddark :backgroundLight,
        body: Container(
          margin: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onLongPress: (){},
                      child: Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FullScreenWidget(
                          disposeLevel: DisposeLevel.Low,
                          backgroundColor: mode?backgrounddark :backgroundLight,
                          backgroundIsTransparent: true,
                          child: CircleAvatar(child: Image.asset("assets/Untitled.png"))),
                      ),
                    ),
                    NavigationMenu(navHome,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 0, onClick: () {
                      _tabController.animateTo(0,duration:const Duration(milliseconds: 500) );
                    }),
                    NavigationMenu(navTime,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 1, onClick: () {
                      _tabController.animateTo(1,duration:const Duration(milliseconds: 500) );
                    }),
                    NavigationMenu(navPortfolio,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 2, onClick: () {
                      _tabController.animateTo(2,duration:const Duration(milliseconds: 500) );
                    }),
                    NavigationMenu(navGroup,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 3, onClick: () {
                      _tabController.animateTo(3,duration:const Duration(milliseconds: 500) );
                    }),
                    NavigationMenu(navContact,
                        height: iconSize,
                        width: iconSize,
                        isSelected: selectedMenuIndex == 4, onClick: () {
                      _tabController.animateTo(4,duration:const Duration(milliseconds: 500) );
                    }),
                    IconButton(
                      onPressed:(){
                       mode=!mode;
                       setState(() {
                       });

                      },
                      icon: mode? const Icon(Icons.dark_mode):const Icon(Icons.light_mode),
                      color: mode? const Color.fromARGB(255, 33, 252, 233):Colors.grey,
                      )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const HomePage(),
                    const ExperiencePage(),
                    const PortfolioPage(),
                    TeamPage(),
                    const ContactPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
