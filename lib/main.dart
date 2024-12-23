import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/pages/home.dart';
import 'package:paginated_data_table_example/state%20management/counter/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(),
        )
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        );
      }),
    );
  }
}
