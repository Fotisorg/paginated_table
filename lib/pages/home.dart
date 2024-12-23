import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/pages/colored_widget.dart';
import 'package:paginated_data_table_example/pages/data_table.dart';
import 'package:paginated_data_table_example/pages/socket.dart';
import 'package:paginated_data_table_example/pages/stream_test.dart';
import 'package:paginated_data_table_example/services/api.dart';
import 'package:paginated_data_table_example/state%20management/counter/counter_provider.dart';
import 'package:paginated_data_table_example/state%20management/counter/counter_status.dart';
import 'package:paginated_data_table_example/styles/colors.dart';
import 'package:paginated_data_table_example/styles/textstyles.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double turns = 0.0;
  bool change = false;
  final double size = 400;

  double changeSize(double size) {
    return Random().nextDouble() * size;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        _change();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      // child: Row(
      //   children: [
      //     SizedBox(
      // width: MediaQuery.of(context).size.width * .3,
      child:
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.teal[700],
          //       borderRadius: const BorderRadius.all(Radius.circular(5))),
          //   height: MediaQuery.of(context).size.height * .3,
          //   width: double.infinity,
          //   child: const StreamTest(),
          // ),
          // const Socket(),

          Center(
        child: ColoredWidget(
          color: change ? Colors.red : Colors.blue,
          color1: change ? Colors.blue : Colors.red,
          size: changeSize(size),
        ),
      ),

      // Text(context.watch<CounterProvider>().counterState.hint,
      //     style: StyleText().textstyle2),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     MaterialButton(
      //       color: Colors.red,
      //       onPressed: () =>
      //           context.read<CounterProvider>().subtract(),
      //       child: const Icon(Icons.exposure_minus_1),
      //     ),
      //     SizedBox(
      //       child: Consumer<CounterProvider>(
      //           builder: (context, value, child) {
      //         if (value.counterState.counterStatus ==
      //             CounterStatus.loading) {
      //           return const CircularProgressIndicator();
      //         }
      //         return Text(value.counterState.num.toString(),
      //             style: StyleText().textstyle1);
      //       }),
      //     ),
      //     MaterialButton(
      //       color: Colors.red,
      //       onPressed: () => context.read<CounterProvider>().add(),
      //       child: const Icon(Icons.plus_one),
      //     ),
      //   ],
      // ),
      //   ],
      // ),
      // ),
      // const Expanded(child: PaginatedTable()),
      // ],
      // ),
    );
  }

  void _change() {
    setState(() {
      change = !change;
      changeSize(size);
    });
  }
}
