import 'package:flutter/material.dart';
import 'package:interface_responsiva/breakpoints.dart';
import 'package:interface_responsiva/pages/home/widgets/app_bar/mobile_app_bar.dart';
import 'package:interface_responsiva/pages/home/widgets/app_bar/web_app_bar.dart';
import 'package:interface_responsiva/pages/home/widgets/sections/top_section.dart';

import 'widgets/sections/advantages_section.dart';
import 'widgets/sections/courses_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: constraints.maxWidth < mobileBreakPoint
              ? PreferredSize(
                  child: MobileAppBar(),
                  preferredSize: Size(double.infinity, 56),
                )
              : PreferredSize(
                  child: WebAppBar(), preferredSize: Size(double.infinity, 72)),
          drawer: constraints.maxWidth < mobileBreakPoint ? Drawer() : null,
          body: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1400),
                child: ListView(
                  children: [
                    TopSection(),
                    AdvantagesSection(),
                    CoursesSection(),
                  ],
                ),
              )),
        );
      },
    );
  }
}
