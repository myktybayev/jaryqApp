import 'package:flutter/material.dart';
import 'package:ruhani_app/comman_widgets/app_large_text.dart';
import 'package:ruhani_app/comman_widgets/app_text.dart';
import 'package:ruhani_app/comman_widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "walp3.jpeg",
    "walp4.jpeg",
    "walp3.jpeg",
    "walp3.jpeg",
  ];

  List<String> titles = [
    "Рухани",
    "Кітаптар",
    "Сұрақ/жауап",
    "Видео/фото",
  ];

  List<String> desc = [
    "бағыт",
    "тізімі",
    "жеке сұрақтар",
    "статьялар",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: titles[index]),
                          AppText(text: desc[index], size: 30),
                          SizedBox(height: 20),
                          Container(
                            width: 250,
                            child: AppText(
                              text: "Welcome!",
                              color: const Color.fromARGB(137, 119, 119, 119),
                              size: 14,
                            ),
                          ),
                          SizedBox(height: 40),
                          ResponsiveButton(),
                        ],
                      ),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? const Color.fromARGB(255, 12, 43, 97)
                                  : const Color.fromARGB(255, 12, 43, 97)
                                      .withOpacity(0.2),
                            ),
                          );
                        }),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
