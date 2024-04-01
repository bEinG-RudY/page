import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page/model/program_model.dart';

class Home extends StatelessWidget {
  var sw;
  var program;
  var lesson;
  Home(
      {super.key,
      required this.sw,
      required this.program,
      required this.lesson});

  // var isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.blue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello, Priya!",
                style: TextStyle(fontSize: 30, fontFamily: ''),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "what do you wanna learn today?",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customContainer(
                    sw: sw / 2 - 30,
                    icon: Icons.book,
                    text: "Program",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customContainer(
                      sw: sw / 2 - 30,
                      icon: CupertinoIcons.question_circle_fill,
                      text: "Get help")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customContainer(
                      sw: sw / 2 - 30,
                      icon: Icons.menu_book_sharp,
                      text: "Learn"),
                  const SizedBox(
                    width: 10,
                  ),
                  customContainer(
                      sw: sw / 2 - 30,
                      icon: Icons.book_online_rounded,
                      text: "DD Tracker")
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Programs for you",
                      style: TextStyle(fontSize: 24),
                    ),
                    customButton()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 380,
                width: sw,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 350,
                        child: customProgramCard(context,
                            program['items'][index], "lessons", "lesson"));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Events and Exercises",
                      style: TextStyle(fontSize: 24),
                    ),
                    customButton()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: sw,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lesson['items'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 350,
                        child: customProgramCard(
                            context, lesson['items'][index], "", "duration"));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lessons for you",
                      style: TextStyle(fontSize: 24),
                    ),
                    customButton()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: sw,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: lesson['items'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(left: 20),
                        width: 350,
                        child: customProgramCard(context,
                            lesson['items'][index], "mins", "duration"));
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

Container customButton() {
  return Container(
    child: const Row(
      children: [
        Text(
          "View all",
          style: TextStyle(fontSize: 17, color: Colors.black54),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(CupertinoIcons.arrow_right)
      ],
    ),
  );
}

Container customContainer(
    {required double sw, required IconData icon, required var text}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(15)),
    height: 70,
    width: sw,
    child: Row(children: [
      Icon(
        icon,
        color: Colors.blueAccent,
      ),
      const SizedBox(
        width: 15,
      ),
      Text(
        "${text}",
        style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      )
    ]),
  );
}

Widget customProgramCard(context, news, text, text1) {
  var news1 = news["name"];
  var now = DateTime.parse(news['createdAt']);
  var time = DateFormat.yMMMd().format(now);
  return InkWell(
    onTap: () {
      // Navigator.push(
      //     context,
      // MaterialPageRoute(
      //     builder: (BuildContext context) => HomePage(
      //           // newsImg: news['urlToImage'],
      //           newsHead: news['name'],
      //           newsName: news1,
      //           newsDes: news['category'],
      //           date: time,
      //         )));
    },
    child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(14), topStart: Radius.circular(14)),
                child: Container(
                  height: 200,
                  width: 300,
                  child: Image.asset(
                    "assets/yoga.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
                // Image.network("${news['urlToImage']}"),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${news['category']}",
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "${news['name']}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${news[text1]} ${text}",
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.lock,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )),
  );
}
