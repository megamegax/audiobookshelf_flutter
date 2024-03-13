import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SelectedItem { home, library, series, authors, narrators }

class BookDrawer extends StatelessWidget {
  final SelectedItem selectedItem;
  final ServerSettings? serverSettings;

  const BookDrawer(
      {super.key, required this.selectedItem, required this.serverSettings});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Audiobookshelf'),
          ),
        ),
        ListTile(
          tileColor: selectedItem == SelectedItem.home
              ? Theme.of(context).primaryColorDark
              : null,
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const HomeScreen())));
          },
        ),
        ListTile(
          tileColor: selectedItem == SelectedItem.library
              ? Theme.of(context).primaryColorDark
              : null,
          title: const Text('Library'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => const BookshelfScreen())));
          },
        ),
        ListTile(
          tileColor: selectedItem == SelectedItem.series
              ? Theme.of(context).primaryColorDark
              : null,
          title: const Text('Series'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: selectedItem == SelectedItem.authors
              ? Theme.of(context).primaryColorDark
              : null,
          title: const Text('Authors'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: selectedItem == SelectedItem.narrators
              ? Theme.of(context).primaryColorDark
              : null,
          title: const Text('Narrators'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          "Server: ${serverSettings?.version ?? 'Unknown'}",
          textAlign: TextAlign.center,
        ),
        const Text(
          "App: 1.0.0",
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20)
      ],
    ));
  }
}
