import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color.fromARGB(255, 54, 51, 51),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 246, 243, 243),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Background',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Resepi Che Nom is the online Malaysian recipe collection portal where use can share their own recipe, received a review and rating, comment to published recipes and interact with other user.\nWhile english is our primary language, we aslo support do support multilanguage, current Malay are supported as a multilanguage.',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 138, 125, 86),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Our Objective',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),
              const Text(
                'Our objective is to create a Malaysia best recipe collection database based on user input and user trial experience.\nTo create expert cooking and food interest online group',
                style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 138, 125, 86)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.video_collection_rounded),
                        ),
                        const Text('Youtube'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.video_collection_rounded),
                        ),
                        const Text('Instagram'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.video_collection_rounded),
                        ),
                        const Text('Youtube'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Please give us your support throught this App !'),
            ],
          ),
        ),
      ),
    );
  }
}
