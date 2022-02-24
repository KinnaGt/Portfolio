import 'package:flutter/material.dart';
import 'package:myportfolio/screens/main/components/side_menu.dart';

import '../../components/on_hover_button.dart';
import '../../constants/constants.dart';
import '../../responsive.dart';
import '../home/components/presentation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // We hide the appbar on desktop
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            ),
      drawer: const SideMenu(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Responsive.isMobile(context) ? 10 : 20),
                      child: const SideMenu(),
                    )),
              const SizedBox(width: defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                        _setUpPresentationScreen(size,context,controller),
                      ...children,
                      // our footer
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpPresentationScreen(Size size,BuildContext context,ScrollController controller){
    return Stack(
                        children: [
                          Positioned(
                              right: 0,
                              bottom: Responsive.isTablet(context)
                                  ? Responsive.isMobile(context)
                                      ? 150
                                      : size.height / 10
                                  : -100,
                              child: Image(
                                  fit: BoxFit.contain,
                                  height: Responsive.isTablet(context)
                                      ? Responsive.isMobile(context)
                                          ? 200
                                          : size.height * 0.6
                                      : size.height,
                                  image: const AssetImage(
                                    "assets/images/fondo.png",
                                  ))),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: Responsive.isMobile(context) ? 5 : 25),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height / 5,
                                    ),
                                    const Presentation(),
                                    OnHoverButton(
                                      controller: controller,
                                    ),
                                    SizedBox(
                                      height: Responsive.isMobile(context)
                                          ? 200
                                          : 200,
                                    )
                                  ])),
                        ],
                      );
  }
}
