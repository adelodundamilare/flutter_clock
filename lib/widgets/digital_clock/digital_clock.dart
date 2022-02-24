import 'package:flutter/material.dart';
import 'package:flutter_clock_sample/utils/base_widget.dart';
import 'package:flutter_clock_sample/widgets/digital_clock/digital_clock_vm.dart';

class DigitalClock extends StatelessWidget {
  const DigitalClock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DigitalClockVM>(
        model: DigitalClockVM(),
        onInitState: (model) => model.initState(),
        builder: (context, model, child) {
          return Center(
            child: Text(
              model.getSystemTime(),
              style: const TextStyle(
                  color: Color(0xff2d386b),
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
          );
        });
  }
}
