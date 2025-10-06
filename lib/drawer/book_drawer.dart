import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:audiobookshelf_flutter/pages/downloads_page.dart';
import 'package:audiobookshelf_flutter/pages/download_queue_page.dart';
import 'package:flutter/material.dart';

enum SelectedItem { home, library, downloads, downloadQueue, series, authors, narrators }

class BookDrawer extends StatelessWidget {
  final SelectedItem selectedItem;
  final ServerSettings? serverSettings;

  const BookDrawer(
      {super.key, required this.selectedItem, required this.serverSettings});
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: selectedItem.index,
      onDestinationSelected: (index) {
        Navigator.pop(context);
        switch (index) {
          case 0:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const HomeScreen())));
            break;
          case 1:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => const BookshelfScreen())));
            break;
          case 2:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => const DownloadsPage())));
            break;
          case 3:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => const DownloadQueuePage())));
            break;
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Audiobookshelf',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.library_books_outlined),
          selectedIcon: Icon(Icons.library_books),
          label: Text('Library'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.download_outlined),
          selectedIcon: Icon(Icons.download),
          label: Text('Downloads'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.queue_outlined),
          selectedIcon: Icon(Icons.queue),
          label: Text('Download Queue'),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Server Info',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.dns,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          title: Text('Server: ${serverSettings?.version ?? 'Unknown'}'),
          subtitle: Text('App: 1.0.0'),
        ),
      ],
    );
  }
}
