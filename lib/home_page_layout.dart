import 'package:flutter/material.dart';
import 'package:mobiledevcollege/mylocation.dart';

class HomePageLayout extends StatelessWidget {
  const HomePageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Your geolocation:',
          ),
          FutureBuilder(
            future: getLocation(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(
                        " latitude: ${snapshot.data!.lat.toString()}\n longtitude:${snapshot.data!.long.toString()}"),
                    Text(
                        "\n Your approximate adress:\n ${snapshot.data!.address.toString()}"),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
