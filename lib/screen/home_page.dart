import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWith = 0;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    screenWith = MediaQuery.of(context).size.width - 20;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Container(
              height: 170,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Galaxy Products',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'samsung Phone',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            size: 28,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Storage",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '8.0/128 GB',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      child: const Text(
                    "upgrade",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  )),
                  // const Text(
                  //   "upgrade",
                  //   style: TextStyle(fontSize: 16, color: Colors.blue),
                  // )
                ],
              ),
            ),
            //
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  chartMethod("soucres", Colors.blue, 0.3),
                  const SizedBox(width: 6),
                  chartMethod("assets", Colors.purple, 0.3),
                  const SizedBox(width: 6),
                  chartMethod("docs", Colors.green, 0.3),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  const Text(
                    'Nabin',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      listItems("assets/images/typescript.png", "TS"),
                      const SizedBox(width: 12),
                      listItems("assets/images/flutter.png", ".dart"),
                      const SizedBox(width: 12),
                      listItems("assets/images/nodejs.png", "Node"),
                      const SizedBox(width: 12),
                      listItems("assets/images/django.png", "Django"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Products',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'create New',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  const Divider(height: 20),
                  const SizedBox(height: 10),

                  // documents Items
                  documentsItems(
                      "images", const Icon(Icons.folder), Colors.blue),
                  const SizedBox(height: 10),
                  documentsItems(
                      "docs", const Icon(Icons.picture_as_pdf), Colors.blue),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
            ],
            // shape: BoxShape.circle,
          ),
          // child: FloatingActionButton.extended(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20)),
          //     onPressed: () {},
          //     label: const Icon(Icons.add)),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            onTap: (value) => setState(
                  () {
                    _currentIndex = value;
                  },
                ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              // BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Time'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder), label: 'Folder'),
            ]),
      ),
    );
  }

  Widget documentsItems(String title, Icon icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Icon(icon.icon, color: color),
              const SizedBox(width: 10),
              Text(title)
            ],
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
        ],
      ),
    );
  }

  Widget listItems(String imgPath, String title) {
    return Column(
      children: [
        Container(
          width: screenWith * 0.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: Image.asset(
            // 'assets/images/typescript.png',
            imgPath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            // text: "Typescript",
            text: title,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Column chartMethod(String text, Color color, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWith * width,
          color: color,
          height: 4,
        ),
        Text(text)
      ],
    );
  }
}
