import 'package:anty_rower/parsers.dart';
import 'package:anty_rower/providers/bike_pos_provider.dart';
import 'package:anty_rower/providers/gps_pos_provider.dart';
import 'package:anty_rower/udp_server.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  final BikePosProvider bikePosProvider = BikePosProvider();
  final GpsPosProvider gpsPosProvider = GpsPosProvider();

  UdpServer udpServer = UdpServer(
    12345,
    onMessage: (String message) {
      (int, int) gpsPos = Parsers.parsePositionForGps(message);
      (int, int) bikerPos = Parsers.parsePositionForBike(message);

      bikePosProvider.setPosition(bikerPos);
      gpsPosProvider.setPosition(gpsPos);
    },
  );

  udpServer.run();

  runApp(
    App(
      bikePosProvider: bikePosProvider,
      gpsPosProvider: gpsPosProvider,
    ),
  );
}
