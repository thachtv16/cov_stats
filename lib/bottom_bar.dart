import 'package:cov_stats/app_color.dart';
import 'package:cov_stats/app_styles.dart';
import 'package:cov_stats/app_svg.dart';
import 'package:cov_stats/discovery/discovery_screen.dart';
import 'package:cov_stats/home/home_screen.dart';
import 'package:cov_stats/map/map_screen.dart';
import 'package:cov_stats/tool/tool_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  Widget _homeScreen = HomeScreen();
  Widget _mapScreen = MapScreen();
  Widget _discoveryScreen = DiscoveryScreen();
  Widget _toolScreen = ToolScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this._buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColor.colorBoxShadow,
              offset: Offset(2, 3),
              blurRadius: 3)
        ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          backgroundColor: AppColor.colorBackground,
          items: [
            BottomNavigationBarItem(
                icon: this.selectedIndex == 0
                    ? SvgPicture.asset(AppSvg.SVG_HOME_SELECTED)
                    : SvgPicture.asset(AppSvg.SVG_HOME_UNSELECTED),
                label: "Home"),
            BottomNavigationBarItem(
                icon: this.selectedIndex == 1
                    ? SvgPicture.asset(AppSvg.SVG_MAP_SELECTED)
                    : SvgPicture.asset(AppSvg.SVG_MAP_UNSELECTED),
                label: "Map"),
            BottomNavigationBarItem(
                icon: this.selectedIndex == 2
                    ? SvgPicture.asset(AppSvg.SVG_DISCOVERY_SELECTED)
                    : SvgPicture.asset(AppSvg.SVG_DISCOVERY_UNSELECTED),
                label: "Discovery"),
            BottomNavigationBarItem(
                icon: this.selectedIndex == 3
                    ? SvgPicture.asset(AppSvg.SVG_TOOL_SELECTED)
                    : SvgPicture.asset(AppSvg.SVG_TOOL_UNSELECTED),
                label: "Tool")
          ],
          selectedLabelStyle: AppStyles.bottom_bar,
          unselectedItemColor: AppColor.colorTextSecondary,
          selectedItemColor: AppColor.colorTextRed,
          onTap: (int index) {
            onTabHandler(index);
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (this.selectedIndex == 0) {
      return this._homeScreen;
    } else if (this.selectedIndex == 1) {
      return this._mapScreen;
    } else if (this.selectedIndex == 2) {
      return this._discoveryScreen;
    } else {
      return this._toolScreen;
    }
  }

  void onTabHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
