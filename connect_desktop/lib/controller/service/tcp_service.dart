import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

class TcpService extends GetxService {
  var message = ''.obs;

  Future<TcpService> init() async {
    initServer();
    return this;
  }

  /// 初始化tcp服务端
  void initServer() async {
    final server = await ServerSocket.bind('127.0.0.1', 4040);
    log('Listening on ${server.address.host}:${server.port}');

    await for (Socket client in server) {
      client
          .transform(StreamTransformer<Uint8List, String>.fromHandlers(
              handleData: (data, sink) => sink.add(
                    String.fromCharCodes(data),
                  )))
          .listen(
        (data) {
          log('Received from client: $data');
          client.write('Echo: $data');
        },
        onError: (error) {
          log(error);
          client.close();
        },
        onDone: () {
          log('Client disconnected');
          client.close();
        },
      );
    }
  }
}
