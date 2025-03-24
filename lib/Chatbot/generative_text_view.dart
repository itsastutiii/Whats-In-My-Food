import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'generative_model_view_model.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChatView extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMessages = ref.watch(chatProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.white, // Adjusted color
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/bg2.png'), // Set the background image here
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.7), // Apply white opacity
              BlendMode.softLight,
            ),
          ),
        ),
        //color: Colors.white,

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  final isUserMessage = chatMessages[index].startsWith("You:");
                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: isUserMessage
                            ? Colors.lightBlue[100]
                            : Colors.deepPurple[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: MarkdownBody(
                        data: chatMessages[index],
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(
                            color: isUserMessage ? Colors.black : Colors.black,
                          ),
                          strong: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Type your message here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          ref
                              .read(chatProvider.notifier)
                              .sendMessage(_controller.text);
                          _controller.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
