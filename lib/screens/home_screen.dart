import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:loan_calculator/style/app_colors.dart';
import 'package:loan_calculator/widgets/default_button.dart';
import 'package:loan_calculator/widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gradient gradient = LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.topLeft,
    stops: [0.1, 0.8],
    colors: [
      AppColors.blue,
      AppColors.lightBlue,
    ],
  );
  TextStyle headStyle = TextStyle(color: Colors.white, fontSize: 16);
  TextStyle bodyStyle = TextStyle(color: AppColors.grey, fontSize: 12);
  double monthlyPayment = 0.00;
  double totalCost = 0.0;
  int loanAmount = 0;
  double maxValue = 19000.0;
  double minValue = 0.0;
  int terms = 0;
  double minTerms = 0.0;
  double maxTerms = 60.0;
  int credit = 0;
  double minCredit = 0.0;
  double maxCredit;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double containerHeight = (height * 2) / 3;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Text('Loan Calculator'),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              showMonthlyContainer(
                  '\$' + monthlyPayment.toStringAsFixed(2), height / 5, width - 64),
              SizedBox(height: 24),
              showLaonContainer(containerHeight)
            ],
          ),
        ),
      ),
    );
  }

  Widget showMonthlyContainer(
      String monthlyPayment, double height, double width) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              monthlyPayment,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              "Est. Monthly Payment",
              style: bodyStyle,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Est. Interest Rate',
                  style: bodyStyle,
                ),
                Text(
                  '6.0%',
                  style: bodyStyle,
                )
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Est. Cost of Loan',
                  style: bodyStyle,
                ),
                Text(
                  '\$' + totalCost.toStringAsFixed(2),
                  style: TextStyle(color: AppColors.grey),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget showLaonContainer(double height) {
    return Container(
      height: height,
      color: AppColors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Loan Amount",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "\$" + loanAmount.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            /* CustomSlider(
              minVale: 0.0,
              maxValue: 19000.0,
              increase: 1000.0,
              onChanged: (value) {
            loanAmount = value;
          },
              steps: 19,
              linesNumber: 0.02,
              labels: [
                FlutterSliderHatchMarkLabel(
                    percent: 0,
                    label: Text(
                      '-',
                      style: TextStyle(color: Colors.grey),
                    )),
                FlutterSliderHatchMarkLabel(
                    percent: 15,
                    label: Text(
                      '3,000',
                      style: TextStyle(color: Colors.grey),
                    )),
                FlutterSliderHatchMarkLabel(
                    percent: 100,
                    label: Text(
                      '20,000',
                      style: TextStyle(color: Colors.grey),
                    )),
              ],
            )
           */
            FlutterSlider(
              handler: customHandler(Icons.circle),
              values: [minValue],
              step: FlutterSliderStep(step: 19),
              max: 19000.0,
              min: 0.0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                minValue = lowerValue;
                maxValue = upperValue;
                setState(() {
                  minValue = minValue + 1000;
                  loanAmount = minValue.toInt();
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
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              hatchMark: FlutterSliderHatchMark(
                displayLines: false,
                labelsDistanceFromTrackBar: 48,
                // disabled: true,
                density: 0.02, // means 50 lines, from 0 to 100 percent
                labels: [
                  FlutterSliderHatchMarkLabel(
                      percent: 0,
                      label: Text(
                        '-',
                        style: TextStyle(color: Colors.grey),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 15,
                      label: Text(
                        '\$3,000',
                        style: TextStyle(color: Colors.grey),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 100,
                      label: Text(
                        '\$20,000',
                        style: TextStyle(color: Colors.grey),
                      )),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text('Interested in a different amount?',
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline)),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: headStyle,
                    children: <TextSpan>[
                      TextSpan(text: 'Loan Term  '),
                      TextSpan(
                        text: '(Months)',
                        style: bodyStyle,
                      )
                    ],
                  ),
                ),
                Text(
                  terms.toString(),
                  style: headStyle,
                ),
              ],
            ),
            FlutterSlider(
              handler: customHandler(Icons.circle),
              values: [minTerms, maxTerms],
              jump: true,
              max: 60.0,
              min: 0.0,
              step: FlutterSliderStep(
                step: 1, // default
                isPercentRange:
                    true, // ranges are percents, 0% to 20% and so on... . default is true
                rangeList: [
                  FlutterSliderRangeStep(from: 0, to: 20, step: 12),
                  FlutterSliderRangeStep(from: 20, to: 40, step: 12),
                  FlutterSliderRangeStep(from: 40, to: 60, step: 12),
                  FlutterSliderRangeStep(from: 60, to: 80, step: 12),
                  FlutterSliderRangeStep(from: 80, to: 100, step: 12),
                ],
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                minTerms = lowerValue;
                maxTerms = upperValue;
                setState(() {
                  terms = minTerms.toInt();
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
                    borderRadius: BorderRadius.circular(4), gradient: gradient),
              ),
              hatchMark: FlutterSliderHatchMark(
                displayLines: false,
                labelsDistanceFromTrackBar: 48,
                // disabled: true,
                density: 0.06, // means 50 lines, from 0 to 100 percent
                labels: [
                  FlutterSliderHatchMarkLabel(
                      percent: 0,
                      label: Text(
                        '-',
                        style: TextStyle(color: Colors.grey),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 20,
                      label: Text(
                        '12',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 40,
                      label: Text(
                        '24',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 60,
                      label: Text(
                        '36',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 80,
                      label: Text(
                        '48',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 100, label: Text('60', style: bodyStyle)),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'FICO Credit Score ',
                      style: headStyle,
                    ),
                    Icon(Icons.info_outline_rounded,color:AppColors.grey,size: 16,),
                  ],
                ),
                Text(
                  credit.toString(),
                  style: headStyle,
                ),
              ],
            ),
            FlutterSlider(
              handler: customHandler(Icons.circle),
              values: [minCredit, maxCredit],
              step: FlutterSliderStep(step: 6),
              max: 800.0,
              min: 0.0,
              onDragging: (handlerIndex, lowerValue, upperValue) {
                minCredit = lowerValue;
                maxCredit = upperValue;
                setState(() {
                  credit = minCredit.toInt();
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
                    borderRadius: BorderRadius.circular(4), gradient: gradient),
              ),
              hatchMark: FlutterSliderHatchMark(
                displayLines: false,
                labelsDistanceFromTrackBar: 48,
                // disabled: true,
                density: 0.06, // means 50 lines, from 0 to 100 percent
                labels: [
                  FlutterSliderHatchMarkLabel(
                      percent: 0,
                      label: Text(
                        '-',
                        style: TextStyle(color: Colors.grey),
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 20,
                      label: Text(
                        '<579',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 40,
                      label: Text(
                        '580',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 60,
                      label: Text(
                        '670',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 80,
                      label: Text(
                        '740',
                        style: bodyStyle,
                      )),
                  FlutterSliderHatchMarkLabel(
                      percent: 100, label: Text('800+', style: bodyStyle)),
                ],
              ),
            ),
            SizedBox(height: 32),
            DefaultButton(
              press: () {
                setState(() {
                  monthlyPayment = showLoanAmount(loanAmount, terms);
                  totalCost = monthlyPayment + loanAmount;
                });
              },
              text: 'Start Your Application',
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
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

  double showLoanAmount(int amount, int term) {
    double r = 0.06;
    double p = amount * (r / term);
    print(p.toString());
    return p;
  }
}
