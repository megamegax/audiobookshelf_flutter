import 'package:flutter/material.dart';
import 'package:audiobookshelf_flutter/layouts/layout_constants.dart';
import 'package:audiobookshelf_flutter/layouts/mobile_layout.dart';
import 'package:audiobookshelf_flutter/layouts/desktop_layout.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_navigation_drawer.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';

/// Responsive layout that switches between mobile drawer and desktop master-detail
/// based on screen width
class ResponsiveLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final PreferredSizeWidget? appBar;
  final SelectedItem selectedDrawerItem;
  final ServerSettings? serverSettings;
  final List<Widget>? appBarActions;

  const ResponsiveLayout({
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        if (LayoutConstants.shouldUseMasterDetail(screenWidth)) {
          // Use desktop master-detail layout for wide screens
          return DesktopLayout(
            body: body,
            title: title,
            appBar: appBar,
            selectedDrawerItem: selectedDrawerItem,
            serverSettings: serverSettings,
            appBarActions: appBarActions,
          );
        } else {
          // Use traditional mobile layout with drawer overlay
          return MobileLayout(
            body: body,
            title: title,
            appBar: appBar,
            selectedDrawerItem: selectedDrawerItem,
            serverSettings: serverSettings,
            appBarActions: appBarActions,
          );
        }
      },
    );
  }
}
