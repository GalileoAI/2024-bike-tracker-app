import 'package:anty_rower/providers/bike_pos_provider.dart';
import 'package:anty_rower/providers/driver_screen_provider.dart';
import 'package:anty_rower/ui/driver/driver_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/gps_pos_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bike tracker"),
      ),
      body: ChangeNotifierProxyProvider2<GpsPosProvider, BikePosProvider,
          DriverScreenProvider>(
        create: (BuildContext context) {
          return DriverScreenProvider();
        },
        update: (
          BuildContext context,
          GpsPosProvider gpsPosProvider,
          BikePosProvider bikePosProvider,
          DriverScreenProvider? driverScreenProvider,
        ) {
          if (driverScreenProvider != null) {
            driverScreenProvider.setBikerPos(bikePosProvider.pos);
            driverScreenProvider.setGpsPos(gpsPosProvider.pos);

            return driverScreenProvider;
          }

          return DriverScreenProvider();
        },
        child: Consumer<DriverScreenProvider>(
          builder: (context, provider, child) {
            return DriverScreen(
              driverScreenProvider: provider,
            );
          },
        ),
      ),
    );
  }
}
