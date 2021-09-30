import 'dart:async';

import 'package:cov_stats/app_color.dart';
import 'package:cov_stats/app_styles.dart';
import 'package:cov_stats/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    Welcome()
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              flex: 7,
              child: Container(
                alignment: Alignment.topCenter,
                // height: size.height* 5 / 8,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: size.height* 1/2,
                      child: Container(
                        child: SvgPicture.asset('assets/svg/ic_frame.svg'),
                      ) ,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: size.height* 1 / 4,
                      child: Text('COVSTATS',
                          style: AppStyles.t28),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Text('© Copyright COVSTATS 2020. All rights reserved',
                  style: TextStyle(fontSize: 14))
          ),
        ],

      ),
    );
  }
}
