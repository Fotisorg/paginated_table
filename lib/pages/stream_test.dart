import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/services/api.dart';
import 'package:paginated_data_table_example/styles/textstyles.dart';

class StreamTest extends StatefulWidget {
  const StreamTest({super.key});

  @override
  State<StreamTest> createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {
  final StreamController _controllerUser = StreamController.broadcast();
  @override
  void initState() {
    super.initState();

    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   getWind();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerUser.close();
  }

  void getWind() async {
    final Api api = Api();
    var wind = await api.getP();
    _controllerUser.add(wind);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: _controllerUser.stream,
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const CircularProgressIndicator();
          // }
          if (snapshot.hasError) {
            return const Text('Error');
          }
          return Text(
            'The wind of Patras is ${snapshot.data.toString()}',
            textAlign: TextAlign.center,
            style: StyleText().textstyle1,
          );
        },
      ),
    );
  }
}
