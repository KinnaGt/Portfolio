import 'package:flutter/material.dart';
import 'package:portfolio/helpers/responsive_app.dart';
import 'package:portfolio/util/keys.dart';
import 'package:portfolio/util/sizing_info.dart';
import 'package:portfolio/widgets/MobileComponents/about_me_small.dart';
import 'package:portfolio/widgets/MobileComponents/image_small.dart';
import 'package:portfolio/widgets/MobileComponents/shop_appbar.dart';
import 'package:portfolio/widgets/MobileComponents/shop_drawer.dart';
import 'package:portfolio/widgets/WebComponents/Body/about_me_large.dart';
import 'package:portfolio/widgets/WebComponents/Body/image_large.dart';
import 'package:portfolio/widgets/WebComponents/Footer/footer.dart';
import 'package:portfolio/widgets/WebComponents/Header/header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;
  var selectedSlide;
  double _scrollPosition = 0;
  double _opacity = 0;

  int loadedWidgets = 1;

  late AutoScrollController autoScrollController;
  bool _isVisible = false;
  late ResponsiveApp responsiveApp;

  _scrollListener() {
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }
 List allSlides = [
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
    {'widget': Widget, 'selected': false},
  ];

  changeSelector() {
    var maxScrollVal = scrollController.position.maxScrollExtent;

    var divisor = (maxScrollVal / allSlides.length) + 20;

    var scrollValue = scrollController.offset.round();
    var slideValue = (scrollValue / divisor).round();

    // var currentSlide = allSlides.indexWhere((slide) => slide['selected']);
  
    setState(() {
      //allSlides[currentSlide]['selected'] = false;
      selectedSlide = allSlides[slideValue];
      selectedSlide['selected'] = true;
    });
  }


  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController()..addListener(changeSelector);
    setState(() {
      selectedSlide = allSlides[0];
      selectedSlide['selected'] = true;
    });
  }
  


  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    allSlides[0]['widget'] = presentation();
    allSlides[1]['widget'] = aboutMe();
    allSlides[2]['widget'] = footer();
    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {
              autoScrollController.scrollToIndex(0)},
            child:  const Icon(Icons.arrow_upward),
          ),
        ),
        appBar: 
      isMobile(context)
            ? ShopAppBar(_opacity)
            : isZero(_opacity) ? null : Header(_opacity),
        drawer: ShopDrawer(),


        body:  ListView(
              controller: scrollController,
              children: allSlides.map((element) {
                  return getCards(element);
              }).toList(),
            ),
        
         
        
    );
  }
  Widget getCards(slide) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: AnimatedCrossFade(
        firstChild: slide['widget'],
        duration: Duration(seconds: 1),
        secondChild: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
        ),
        crossFadeState: slide['selected']
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }

  bool isZero(opacity) => opacity == 0;
  Widget presentation(){
      return isMobile(context)
            ? ImageSmall()
            : ImageLarge();
  }
  Widget aboutMe(){
    return isMobile(context)
            ? AboutMeSmall()
            : AboutMeLarge();
  }
  Widget footer(){
    return isMobileAndTablet(context) ? const SizedBox.shrink() : Footer();
  }
}

