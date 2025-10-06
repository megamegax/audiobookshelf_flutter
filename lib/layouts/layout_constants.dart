/// Layout constants for responsive design
class LayoutConstants {
  /// Breakpoint for switching from mobile to tablet layout (width)
  static const double tabletBreakpoint = 600.0;

  /// Breakpoint for switching from tablet to desktop layout (width)
  static const double desktopBreakpoint = 900.0;

  /// Sidebar width for master-detail layout on wide screens
  static const double sidebarWidth = 280.0;

  /// Minimum content width for detail panel
  static const double minContentWidth = 400.0;

  /// Check if current width is mobile
  static bool isMobile(double width) => width < tabletBreakpoint;

  /// Check if current width is tablet
  static bool isTablet(double width) =>
      width >= tabletBreakpoint && width < desktopBreakpoint;

  /// Check if current width is desktop (wide screen)
  static bool isDesktop(double width) => width >= desktopBreakpoint;

  /// Check if screen should use master-detail layout
  static bool shouldUseMasterDetail(double width) =>
      width >= desktopBreakpoint && (width - sidebarWidth) >= minContentWidth;
}
