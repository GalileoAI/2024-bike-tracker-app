import 'package:anty_rower/providers/bike_pos_provider.dart';
import 'package:anty_rower/providers/gps_pos_provider.dart';
import 'package:anty_rower/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final BikePosProvider bikePosProvider;
  final GpsPosProvider gpsPosProvider;

  const App({
    super.key,
    required this.bikePosProvider,
    required this.gpsPosProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => bikePosProvider,
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => gpsPosProvider,
          ),
        ],
        child: Consumer2<BikePosProvider, GpsPosProvider>(
          builder: (BuildContext context, BikePosProvider bikePosProvider,
              GpsPosProvider gpsPosProvider, Widget? child) {
            return const MainScreen();
          },
        ),
      ),
    );
  }
}
