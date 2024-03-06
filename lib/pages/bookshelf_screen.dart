import 'package:audiobookshelf_flutter/provider/bookshelf_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Book {
  final String title;
  final String author;

  Book({required this.title, required this.author});
}

class BookshelfScreen extends ConsumerWidget {
  BookshelfScreen({Key? key}) : super(key: key);

  // Egy példa lista könyvekkel
  final List<Book> books = [
    Book(title: 'Book 1', author: 'Author 1'),
    Book(title: 'Book 2', author: 'Author 2'),
    Book(title: 'Book 3', author: 'Author 3'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userModelNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Könyvespolc'),
      ),
      body: ListView.builder(
        itemCount: userModel?.mediaProgress?.length ?? 0,
        itemBuilder: (context, index) {
          final mediaProgress = userModel!.mediaProgress?[index];
          return FutureBuilder<Uint8List>(
            future: fetchCover(ref, mediaProgress?.libraryItemId ?? ""),
            builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Betöltés közbeni widget
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return const Icon(Icons.error); // Hiba esetén megjelenő widget
              } else {
                return ListTile(
                  leading: Image.memory(snapshot.data!),
                  title: Text(mediaProgress?.libraryItemId ?? ""),
                  subtitle: Text(mediaProgress?.currentTime.toString() ?? ""),
                  // A könyvre kattintva történő eseménykezelőt itt adhatod meg
                );
              }
            },
          );
        },
      ),
    );
  }
}
