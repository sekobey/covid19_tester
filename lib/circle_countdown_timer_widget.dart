import 'dart:math' as math;
import 'package:coronavirustester/localizations.dart';
import 'package:coronavirustester/question_after_countdown.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inSeconds}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionAfterCountdown()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).title_breathing_status),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10), child: Icon(Icons.favorite))
        ],
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        child: Text(
                            AppLocalizations.of(context).breathing_info,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                            textAlign: TextAlign.justify)),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 90),
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: themeData.accentColor,
                                    )),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        timerText(themeData),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        child: Text(
                            AppLocalizations.of(context).breathing_info2,
                            textAlign: TextAlign.justify,
                        style: themeData.textTheme.bodyText1))
                  ],
                ),
              ],
            );
          }),
    );
  }

  Widget timerText(ThemeData themeData) {
    if (controller.isAnimating) {
      return Text(
        timerString,
        style: TextStyle(fontSize: 70.0, color: themeData.accentColor),
      );
    } else {
      return GestureDetector(
          onTap: () {
            if (controller.isAnimating)
              controller.stop();
            else {
              controller.reverse(
                  from: controller.value == 0.0 ? 1.0 : controller.value);
            }
          },
          child: Text(
            AppLocalizations.of(context).start,
            style: TextStyle(fontSize: 70.0, color: themeData.accentColor),
          ));
    }
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
