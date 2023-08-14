import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.selectScreen});

  final void Function(String identifier) selectScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Welcome to Recipe Book'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              selectScreen('about');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filter'),
            onTap: () {
              selectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
