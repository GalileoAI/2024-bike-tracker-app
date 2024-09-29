import 'dart:io';

class UdpServer {
  final InternetAddress address =
      InternetAddress.tryParse("192.0.0.4") ?? InternetAddress.anyIPv4;
  final int port;
  void Function(String)? onMessage;

  UdpServer(this.port, {this.onMessage});

  void run() async {
    // Define the IP address and port for the server
    var port = 12345;

    // Bind the server to the address and port
    var rawDatagramSocket = await RawDatagramSocket.bind(address, port);
    print('UDP server listening on ${rawDatagramSocket.address.address}:$port');

    // Listen for incoming datagrams
    rawDatagramSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        // Receive the datagram
        Datagram? dg = rawDatagramSocket.receive();

        if (dg != null) {
          String message = String.fromCharCodes(dg.data);
          if (onMessage != null) {
            onMessage!(message);
          }
        }
      }
    });
  }
}
