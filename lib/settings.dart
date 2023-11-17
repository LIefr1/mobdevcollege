import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black38),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<dynamic>(
              stream: gyroscopeEvents,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  var values = snapshot.data;
                  var x = values.x;
                  var y = values.y;
                  var z = values.z;
                  return Text('Gyroscope:\n x:$x,\n y: $y,\n z: $z \n');
                } else {
                  return const Text("no data");
                }
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<dynamic>(
              stream: accelerometerEvents,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  var values = snapshot.data;
                  const double G = 9;
                  num x = values.x;
                  var y = values.y;
                  var z = values.z;

                  if (G <= x.abs().floorToDouble()) {
                    if (x.isNegative) {
                      return Text(
                          'Горизонтально вправо \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                    }
                    return Text(
                        'Горизонтально влево \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                  }
                  if (G <= y.abs()) {
                    if (y.isNegative) {
                      return Text(
                          'Экраном от себя \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                    }
                    return Text(
                        'Экраном перед собой \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                  }
                  if (G <= z.abs()) {
                    if (z.isNegative) {
                      return Text(
                          'Экраном вниз \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                    }
                    return Text(
                        'Экраном вверх \n Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                  }

                  return Text('Accelerometr:\n x:$x,\n y: $y,\n z: $z \n');
                } else {
                  return const Text('no data');
                }
              }),
        ),
      ],
    );
  }
}
