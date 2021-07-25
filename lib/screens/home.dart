import 'dart:io';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:windsy_ev/providers/charge_status_provider.dart';
import 'package:windsy_ev/widgets/progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ChargingStatusProvider(),
        builder: (context, _) {
          final chargingStatus =
              Provider.of<ChargingStatusProvider>(context, listen: true);
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;

          return SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ChargingProgressIndicator(),
                        chargingStatus.chargingStatus
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Charging"),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Connect charger"),
                              ),
                      ],
                    ),
                  ),
                  FlutterSwitch(
                    key: key,
                    duration: Duration(milliseconds: 500),
                    width: screenWidth / 2.5,
                    height: 80,
                    valueFontSize: 30.0,
                    toggleSize: 60.0,
                    value: chargingStatus.chargingStatus,
                    borderRadius: 20.0,
                    padding: 16.0,
                    //showOnOff: true,
                    onToggle: (value) {
                      setState(() {
                        chargingStatus.toggleCharging(value);
                      });
                    },
                    toggleColor: Colors.white54,
                    inactiveColor: Colors.red,
                    activeColor: Colors.green,
                    inactiveIcon: Icon(Icons.power_off_outlined),
                    activeIcon: Icon(Icons.power_outlined),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        },
      );
}

//TEST
/*Container(
  child: SleekCircularSlider(
    onChangeStart: (double value) {},
    onChangeEnd: (double value) {},
    //innerWidget: viewModel.innerWidget,
    appearance: CircularSliderAppearance(
      infoProperties: InfoProperties(
        */ /* */ /* topLabelStyle: TextStyle(
              //color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          topLabelText: 'Elapsed Time',*/ /* */ /*
        bottomLabelStyle: TextStyle(
            //color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400),
        bottomLabelText: 'Charging',
        mainLabelStyle: TextStyle(
            //color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w600),
        */ /* */ /*modifier: (double value) {
            final time =
                printDuration(Duration(seconds: value.toInt()));
            return '$time';
          },*/ /* */ /*
      ),
      customWidths: CustomSliderWidths(
        progressBarWidth: 20,
        //trackWidth: 10,
        handlerSize: 0,
        //shadowWidth: 50,
      ),
      size: screenWidth - 50,
      customColors: _chargingStatus
          ? CustomSliderColors(
              shadowColor: Colors.lightGreen,
              progressBarColors: [
                Colors.green,
                //Colors.greenAccent,
                Colors.lightGreen,
                //Colors.lightGreenAccent,
              ],
            )
          : CustomSliderColors(
              shadowColor: Colors.redAccent,
              progressBarColor: Colors.red,
            ),
    ),
    min: 0,
    max: 100,
    initialValue: _chargingStatus ? 60 : 0,
  ),
),*/