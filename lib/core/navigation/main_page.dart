import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruhani_app/constants/language_constants.dart';
import 'package:ruhani_app/features/about_us/about_us.dart';
import 'package:ruhani_app/features/books/ui/books_page.dart';
import 'package:ruhani_app/features/faq/faq_page.dart';
import 'package:ruhani_app/features/home/screens/namaz_screen.dart';

class MainPage extends StatefulWidget {
  final UserCredential? userCredential;

  const MainPage({super.key, this.userCredential});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Widget> pages;

  @override
  void initState() {
    pages = [
      BooksPage(),
      // NamazScreen(),
      FAQPage(),
      AboutUsPage(),
    ];
    super.initState();
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),

        // body: pages[currentIndex],

        bottomNavigationBar: _BottomBars(
          onTap: onTap,
          currentIndex: currentIndex,
        ));

    // appBar: _appBar(context));
  }
}

class _BottomBars extends StatelessWidget {
  final Function(int index) onTap;
  final int currentIndex;

  const _BottomBars({
    required this.onTap,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = translation(context);

    List pageNames = [
      translations.menu1,
      translations.menu2,
      translations.menu3,
      translations.menu4,
    ];

    return BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedFontSize: 0,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedFontSize: 14,
        selectedLabelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: pageNames[0], icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: pageNames[1], icon: Icon(Icons.book)),
          BottomNavigationBarItem(
              label: pageNames[2], icon: Icon(Icons.question_answer)),
          BottomNavigationBarItem(label: pageNames[3], icon: Icon(Icons.info)),
        ]);
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    leading: IconButton(
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    title: const Text(
      "title",
    ),
    actions: [
      IconButton(
        tooltip: "t",
        icon: const Icon(
          Icons.favorite,
        ),
        onPressed: () {},
      ),
      IconButton(
        tooltip: 'i',
        icon: const Icon(
          Icons.search,
        ),
        onPressed: () {},
      ),
      Row(
        children: [
          Text('hello'),
        ],
      ),
      PopupMenuButton<Text>(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: Text(
                "first",
              ),
            ),
            const PopupMenuItem(
              child: Text(
                "first",
              ),
            ),
            const PopupMenuItem(
              child: Text(
                "first",
              ),
            ),
          ];
        },
      )
    ],
  );
}
