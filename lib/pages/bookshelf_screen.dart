import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
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
  const BookshelfScreen({super.key});

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
          return FutureBuilder<Uint8List?>(
            future: fetchCover(ref, mediaProgress?.libraryItemId ?? ""),
            builder: (BuildContext context,
                AsyncSnapshot<Uint8List?> coverSnapshot) {
              if (coverSnapshot.connectionState == ConnectionState.waiting) {
                return const ListTile(leading: CircularProgressIndicator());
              } else if (coverSnapshot.hasError) {
                print(coverSnapshot.error);
                return const ListTile(leading: Icon(Icons.error));
              } else {
                return FutureBuilder(
                  future:
                      fetchLibraryItem(ref, mediaProgress?.libraryItemId ?? ""),
                  builder: (context, snapshot) {
                    LibraryItemEntity? item = snapshot.data;
                    return ListTile(
                      leading: coverSnapshot.data == null
                          ? Container(color: Colors.red)
                          : Image.memory(coverSnapshot.data!),
                      title: Text(item?.relPath ?? "-"),
                      subtitle: Text(
                          "Progress: ${mediaProgress?.currentTime.toString() ?? ""}"),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
