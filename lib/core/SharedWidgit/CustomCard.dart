import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AnimatedGauge extends StatefulWidget {
  final double value;
  final double minValue;
  final double maxValue;

  AnimatedGauge({
    required this.value,
    this.minValue = 0,
    this.maxValue = 100,
  });

  @override
  _AnimatedGaugeState createState() => _AnimatedGaugeState();
}

class _AnimatedGaugeState extends State<AnimatedGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: widget.minValue,
      end: widget.value,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
      setState(() {
        _currentValue = _animation.value;
      });
    });

    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _animation = Tween<double>(
        begin: _currentValue,
        end: widget.value,
      ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      )..addListener(() {
        setState(() {
          _currentValue = _animation.value;
        });
      });
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: widget.minValue,
          maximum: widget.maxValue,
          pointers: <GaugePointer>[
            NeedlePointer(value: _currentValue),
          ],
          ranges: <GaugeRange>[
            GaugeRange(startValue: widget.minValue, endValue: widget.minValue + 30, color: Colors.red),
            GaugeRange(startValue: widget.minValue + 30, endValue: widget.minValue + 70, color: Colors.orange),
            GaugeRange(startValue: widget.minValue + 70, endValue: widget.maxValue, color: Colors.green),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Charging capacity",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${_currentValue.toStringAsFixed(0)}${widget.maxValue == 50 ? ' PSI' : '%'}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
