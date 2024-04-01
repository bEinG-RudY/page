import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page/model/lessons_model.dart';
import 'package:page/model/program_model.dart';
import 'package:page/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isLoading = true;
  var programDataFromAPI;
  var lessonDataFromAPI;

  ProgramQueryModel program = ProgramQueryModel();
  LessonQuaryModel lesson = LessonQuaryModel();

  setupData() async {
    programDataFromAPI = await program.getPrograms();

    lessonDataFromAPI = await lesson.getLessons();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[50],
        leading: const Icon(
          Icons.menu,
          size: 32,
          color: Colors.grey,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.question_answer_outlined,
              size: 32,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Learn",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view,
                color: Colors.black54,
              ),
              label: "Hub",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: "chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: "profile",
            ),
          ]),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Home(
              sw: sw,
              program: programDataFromAPI,
              lesson: lessonDataFromAPI,
            ),
    );
  }
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
