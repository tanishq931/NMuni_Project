import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:lottie/lottie.dart';
import 'package:nmuni_project/Themes/Colors.dart';
import 'package:nmuni_project/Themes/TextStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chatStarted = false;
  TextEditingController searchQuery = TextEditingController();
  Color btnColor = AppColors.btnColor;
  Color btnTextColor = AppColors.backgroundColor;
  final apiKey = 'AIzaSyAXHSAAudhwLnHWsKjiZcoRYzKKdLZSRJ8';
  List<Map<String, dynamic>> messages = [
  ];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('NMuni',
                  style: GoogleFonts.montserrat().copyWith(
                      fontSize: 20,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold)),
              backgroundColor: AppColors.backgroundColor,
              elevation: 0,
              centerTitle: true,
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                        child: messages.length > 0
                            ? Container(
                                child: ListView.builder(
                                    reverse: true,
                                    itemCount: messages.length,
                                    itemBuilder: (context, index) {
                                      int msgIndex =
                                          messages.length - index - 1;
                                      String? msgRole =
                                          messages[msgIndex]['role'];
                                      String? msg =
                                          messages[msgIndex]['content'];
                                      return Row(
                                        textDirection: msgRole == 'user'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 300, minWidth: 0),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: msgRole == 'user'
                                                    ? AppColors.background2
                                                    : AppColors.background1,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              '${msg}',
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20),
                                      height: 150,
                                      width: 150,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(75),
                                          child: Image.asset(
                                            'assets/images/nmuniLogo.png',
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 25),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1, color: AppColors.white),
                                        ),
                                        child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'namaskar',
                                              style: hindiFont(
                                                  size: 15,
                                                  color: AppColors.lightBlue),
                                            ),
                                            TextSpan(
                                              text: '  !  How can I help you?',
                                              style: title(
                                                  size: 16,
                                                  color: AppColors.lightBlue),
                                            ),
                                          ]),
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('I can help you with :',
                                          style: heading(
                                            size: 20,
                                            color: AppColors.title,
                                          )),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(top: 20),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.background1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.background2),
                                      child: Text(
                                          'Searching and getting infomation about anything',
                                          style: title(
                                              size: 15, color: AppColors.text)),
                                    ),
                                  ],
                                ),
                              )),
                    loading
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.background1,
                                  borderRadius: BorderRadius.circular(5)),
                              child: ClipRect(
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  heightFactor:
                                      0.5, // Adjust this value to control the amount of cropping from the top
                                  child: Align(
                                      alignment: Alignment.bottomCenter,
                                      heightFactor:
                                          0.8, // Adjust this value to control the amount of cropping from the bottom
                                      child: Container(
                                        child: Lottie.asset(
                                            'assets/lottie/loading.json',
                                            height: 100),
                                      )),
                                ),
                              ),
                            ),
                          )
                        :Container(),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 50,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            chatStarted
                                ? Expanded(
                                    flex: 1,
                                    child: TextField(
                                      controller: searchQuery,
                                      style: heading(size: 15),
                                      onTapOutside: (_) {
                                        if (messages.length == 0 &&
                                            searchQuery.text.length == 0 &&
                                            chatStarted) {
                                          setState(() {
                                            chatStarted = false;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          hintText: 'Enter anything to start',
                                          hintStyle: heading(size: 15),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: AppColors.cream,
                                                  width: 1)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: AppColors.text,
                                                  width: 1))),
                                    ),
                                  )
                                : Container(),
                            chatStarted
                                ? SizedBox(
                                    width: 10,
                                  )
                                : Container(),
                            Expanded(
                              flex: chatStarted ? 0 : 1,
                              child: GestureDetector(
                                onTap: () async {
                                  if (chatStarted &&
                                      searchQuery.text.length > 1) {
                                    messages.add({
                                      'role': 'user',
                                      'content': searchQuery.text
                                    });
                                    setState(() {
                                      loading=true;
                                      searchQuery.text = '';
                                    });

                                    chatGPTAPI();
                                  } else {
                                    setState(() {
                                      chatStarted = true;
                                    });
                                  }
                                },
                                onTapDown: (_) {
                                  setState(() {
                                    btnColor =
                                        AppColors.btnColor.withOpacity(0.5);
                                    btnTextColor = AppColors.title;
                                  });
                                },
                                onTapUp: (_) {
                                  setState(() {
                                    btnColor = AppColors.btnColor;
                                    btnTextColor = AppColors.backgroundColor;
                                  });
                                },
                                child: chatStarted
                                    ? Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: btnColor),
                                        child: Center(
                                          child: Icon(
                                            Icons.send,
                                            color: AppColors.text,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.background2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.btnColor),
                                        child: Center(
                                          child: Text('Get Started   🚀',
                                              style: title(
                                                  size: 16,
                                                  color: AppColors
                                                      .backgroundColor)),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )));
  }
  Future chatGPTAPI() async{
    final gemini = GoogleGemini(
      apiKey: apiKey,
    );
    await gemini
        .generateFromText(messages[messages.length - 1]['content'])
        .then((value) {
      var response = {
        'role': 'assistant',
        'content': value.text
      };
       setState(() {
         loading=false;
         messages.add(response);
       });
    }).onError((error, stackTrace) {
      setState(() {
        loading=false;
      });
    });
  }
}
