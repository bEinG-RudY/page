import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
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
      body: CustomScrollView(
        slivers: [
          customSliverAppBar(
            sw: sw / 2 - 30,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Programs for you",
                        style: TextStyle(fontSize: 24),
                      ),
                      customButton()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  width: sw,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                // color: Colors.blue[50],
                              ),
                              height: 300,
                              width: 340,
                              child: buildCard()),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Events and Experiences",
                        style: TextStyle(fontSize: 24),
                      ),
                      customButton()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  width: sw,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: buildCard()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lessons for you",
                        style: TextStyle(fontSize: 24),
                      ),
                      customButton()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  width: sw,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: buildCard()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container customButton() {
    return Container(
      child: Row(
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

  SliverAppBar customSliverAppBar({required double sw}) {
    return SliverAppBar(
      backgroundColor: Colors.blue[50],
      leading: const Icon(
        Icons.menu,
        size: 32,
        color: Colors.grey,
      ),
      floating: false,
      pinned: true,
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello, Priya!",
                    style: TextStyle(fontSize: 30, fontFamily: ''),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "what do you wanna learn today?",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customContainer(
                          sw: sw, icon: Icons.book, text: "Program"),
                      const SizedBox(
                        width: 10,
                      ),
                      customContainer(
                          sw: sw,
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
                          sw: sw, icon: Icons.menu_book_sharp, text: "Learn"),
                      const SizedBox(
                        width: 10,
                      ),
                      customContainer(
                          sw: sw,
                          icon: Icons.book_online_rounded,
                          text: "DD Tracker")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Container customContainer(
      {required double sw, required IconData icon, required var text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
        SizedBox(
          width: 15,
        ),
        Text(
          "${text}",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        )
      ]),
    );
  }
}

Card buildCard() {
  var heading = 'BABYCARE';
  var subheading = 'Understanding of human behaviour';
  var cardImage =
      NetworkImage('https://source.unsplash.com/random/800x600?house');
  // var supportingText =
  //     'Beautiful home to rent, recently refurbished with modern appliances...';
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      child: Column(
        children: [
          Container(
            height: 200.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  heading,
                  style: TextStyle(color: Colors.lightBlue),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subheading,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("3 min"),
                    IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {/* ... */},
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ));
}
