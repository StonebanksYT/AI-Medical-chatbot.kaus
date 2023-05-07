import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'chatmessage.dart';
import 'languageControl/languaugeController.dart';
import 'languageControl/selectLanguage.dart';
import 'threedots.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

Future<String> makeRequest(String input) async {
  var apiKey = "448f21b7-5674-475b-a4bf-1f487fc1234d";
  var url = "https://api.oneai.com/api/v0/pipeline";

  var headers = {"api-key": apiKey, "content-type": "application/json"};

  var payload = {
    "input": input,
    "input_type": "article",
    "output_type": "json",
    "multilingual": {"enabled": true},
    "steps": [
      {"skill": "gpt"}
    ]
  };

  final response = await http.post(Uri.parse(url),
      headers: headers, body: json.encode(payload));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);
    print(data['output'][0]['contents'][0]['utterance']);
    String output = data['output'][0]['contents'][0]['utterance'];
    return output;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    String errorCode = 'Request failed with status: ${response.statusCode}.';
    return errorCode;
  }
}

GoogleTranslator translator = GoogleTranslator();

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  LanguageController languageController = Get.put(LanguageController());

  final List<ChatMessage> _messages = [];
  final List<ChatMessage> _uimessages = [];

  bool _isTyping = false;
  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    String translatedText = await translateText(_controller.text);
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isImage: false,
    );
    ChatMessage uimessage = ChatMessage(
      text: translatedText,
      sender: "user",
      isImage: false,
    );
    print("uimessage.text ${uimessage.text}");
    setState(() {
      _messages.insert(0, message);
      _uimessages.insert(0, uimessage);

      _isTyping = true;
    });
    _controller.clear();
    String response = await makeRequest(message.text);
    insertNewData(response);
  }

  void insertNewData(String response) async {
    String translatedText = await translateText(response);
    ChatMessage botMessage = ChatMessage(
      text: translatedText,
      sender: "bot",
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
      _uimessages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Question/description"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),
            LanguageDialogBox()
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AI Medical Assistant"),
          centerTitle: true,
          leading: const Icon(Icons.chat_bubble_outline_outlined),
          backgroundColor: Colors.blueAccent,
          elevation: 15,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _uimessages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }

  Future<String> translateText(String input) async {
    print("languageController.language.value ${languageController.language.value}");
    Translation translatedText = await translator.translate(input,
        to: languageController.language.value);
    return translatedText.text;
  }
}
