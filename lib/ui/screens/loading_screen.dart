import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:notflix/repositories/data_repository.dart';
import 'package:notflix/utils/constant.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class LoadingSreen extends StatefulWidget {
  const LoadingSreen({Key? key}) : super(key: key);

  @override
  _LoadingSreenState createState() => _LoadingSreenState();
}

class _LoadingSreenState extends State<LoadingSreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    // appel api
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    // on initialise nos différentes listes de movies
    await dataProvider.initData();
    // ensuite on va sur HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/netflix_logo_1.png'),
        SpinKitRipple(
          color: kPrimaryColor,
          size: 30,
        )
      ]),
    );
  }
}
