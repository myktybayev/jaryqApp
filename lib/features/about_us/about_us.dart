import 'package:flutter/material.dart';
import 'package:ruhani_app/constants/language_constants.dart';
import 'package:ruhani_app/main.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  var kzText = 'Kaz Language';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () async {
              setState(() {
                kzText = 'Kaz changed';
              });

              // Locale _locale = await setLocale('kk');
              // MyApp.setLocale(context, _locale);
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                kzText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () async {
              Locale _locale = await setLocale('ru');
              MyApp.setLocale(context, _locale);
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                'Rus Language',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
