import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:windsy_ev/providers/charge_status_provider.dart';

class ChargingProgressIndicator extends StatefulWidget {
  @override
  _ChargingProgressIndicatorState createState() =>
      _ChargingProgressIndicatorState();
}

class _ChargingProgressIndicatorState extends State<ChargingProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _AnimatedLiquidCustomProgressIndicator(),
      ],
    );
  }
}

class _AnimatedLiquidCustomProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidCustomProgressIndicatorState();
}

class _AnimatedLiquidCustomProgressIndicatorState
    extends State<_AnimatedLiquidCustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late ChargingStatusProvider chargingStatusProvider;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    chargingStatusProvider = context.read<ChargingStatusProvider>();
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = chargingStatusProvider.chargingStatus ? 40 : 0;
    return Center(
      child: LiquidCustomProgressIndicator(
        value: percentage / 100,
        direction: Axis.vertical,
        backgroundColor: Colors.blueGrey.withOpacity(0.40),
        valueColor: chargingStatusProvider.chargingStatus
            ? AlwaysStoppedAnimation(Colors.green)
            : AlwaysStoppedAnimation(Colors.red),
        shapePath: _buildBoatPath(),
        center: Text(
          "${percentage.toStringAsFixed(0)}%",
          style: TextStyle(
            color: Colors.lightGreenAccent,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Path _buildBoatPath() {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(75, 0)
      ..lineTo(75, -10)
      ..lineTo(45, -10)
      ..lineTo(45, 0)
      ..lineTo(120, 0)
      ..lineTo(120, 200)
      ..lineTo(0, 200)
//      ..lineTo(0, 200)
      //..lineTo(120, 0)
      //..lineTo(120, 0)
      ..close();
  }
}
