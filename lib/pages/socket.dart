import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Socket extends StatefulWidget {
  const Socket({
    super.key,
  });

  @override
  State<Socket> createState() => _SocketState();
}

class _SocketState extends State<Socket> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  late StreamSubscription _subscription;
  final ScrollController _scrollController = ScrollController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://10.0.2.2:8080'),
  );

  void _sendMessage() {
    final message = _controller.text;
    if (message.isNotEmpty) {
      _channel.sink.add(message);
      _addMessage(message, true);
      _controller.clear();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  void _addMessage(String text, bool isSent) {
    setState(() {
      _messages.add({"text": text, "isSent": isSent});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void initState() {
    super.initState();
    _subscription = _channel.stream.listen((data) {
      if (data is Uint8List) {
        _addMessage(utf8.decode(data), false);
      } else if (data is String) {
        _addMessage(data, false);
      }
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    _subscription.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        final isSent = message['isSent'];

                        return Align(
                          alignment: isSent
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(maxWidth: 250),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                    style: BorderStyle.solid),
                                color: isSent ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: !isSent
                                      ? Radius.zero
                                      : const Radius.circular(15),
                                  bottomRight: !isSent
                                      ? const Radius.circular(15)
                                      : Radius.zero,
                                  topLeft: const Radius.circular(15),
                                  topRight: const Radius.circular(15),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 5)
                                ]),
                            child: Text(
                              message['text'],
                              softWrap: true,
                              style: TextStyle(
                                color: isSent ? Colors.white : Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                // StreamBuilder(
                //     stream: _channel.stream,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         final data = snapshot.data;

                //         if (data is Uint8List) {
                //           _messages.add(
                //               {"text": utf8.decode(data), "isSent": false});
                //         } else if (data is String) {
                //           _messages.add({"text": data, "isSent": false});
                //         }
                //       }
                //       if (snapshot.hasError) {
                //         return Text('Error: ${snapshot.error}');
                //       }
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const Center(child: CircularProgressIndicator());
                //       }

                //       return ListView.builder(
                //           shrinkWrap: true,
                //           itemCount: _messages.length,
                //           itemBuilder: (context, index) {
                //             final message = _messages[index];
                //             final isSent = message['isSent'];

                //             return Align(
                //               alignment: isSent
                //                   ? Alignment.centerRight
                //                   : Alignment.centerLeft,
                //               child: Text(message['text']),
                //             );
                //           });
                //     }),
                const SizedBox(height: 20),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            labelText: 'Send a message',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _sendMessage,
                          icon: const Icon(Icons.send, color: Colors.blue))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
