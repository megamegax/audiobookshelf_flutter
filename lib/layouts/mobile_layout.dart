import 'package:flutter/material.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';

/// Mobile layout with traditional drawer overlay
class MobileLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final PreferredSizeWidget? appBar;
  final SelectedItem selectedDrawerItem;
  final ServerSettings? serverSettings;
  final List<Widget>? appBarActions;

  const MobileLayout({
    super.key,
    required this.body,
    required this.title,
    required this.selectedDrawerItem,
    required this.serverSettings,
    this.appBar,
    this.appBarActions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: Text(title),
            actions: appBarActions,
          ),
      drawer: MorphingNavigationDrawer(
        selectedItem: selectedDrawerItem,
        serverSettings: serverSettings,
      ),
      body: body,
    );
  }
}
