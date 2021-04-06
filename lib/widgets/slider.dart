import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class CustomSlider extends StatefulWidget {
  double minVale, maxValue, increase;
  final double steps;
  final double linesNumber;
  final List<FlutterSliderHatchMarkLabel> labels;
  final ValueChanged<double> onChanged;

  CustomSlider(
      {Key key,
      @required this.minVale,
      @required this.maxValue,
      @required this.increase,
      @required this.onChanged,
      @required this.steps,
      @required this.linesNumber,
      @required this.labels})
      : super(key: key);
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      handler: customHandler(Icons.circle),
      values: [widget.minVale],
      step: FlutterSliderStep(step: widget.steps),
      max: widget.maxValue,
      min: widget.minVale,
      onDragging: (handlerIndex, lowerValue, upperValue) {
        widget.minVale = lowerValue;
        widget.maxValue = upperValue;
        setState(() {
          widget.minVale = widget.minVale + widget.increase;
          widget.onChanged(widget.minVale);
        });
      },
      trackBar: FlutterSliderTrackBar(
        activeTrackBarHeight: 6,
        inactiveTrackBarHeight: 1,
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
          border: Border.all(width: 3, color: Colors.blue),
        ),
        activeTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.blue),
      ),
      hatchMark: FlutterSliderHatchMark(
          displayLines: false,
          labelsDistanceFromTrackBar: 48,
          // disabled: true,
          density: widget.linesNumber, // means 50 lines, from 0 to 100 percent
          labels: widget.labels),
    );
  }

  customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        child: Container(
          margin: EdgeInsets.all(5),
          decoration:
              BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.black,
            size: 12,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
      ),
    );
  }
}
