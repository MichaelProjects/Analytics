import 'package:coolicons/coolicons.dart';
import 'package:dashboard/screens/overlay/components/sidebar_button.dart';
import 'package:dashboard/screens/overlay/components/sidebar_container.dart';
import 'package:flutter/material.dart';

class DataSidebar extends StatelessWidget {
  const DataSidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
        child: Column(
      children: [
        SidebarButton(
            deactivated: false,
            label: "Dashboard",
            icon: Coolicons.bar_chart,
            onPressed: () {}),
        SidebarButton(
            deactivated: true,
            label: "Events",
            icon: Coolicons.check_all_big,
            onPressed: () {}),
        SidebarButton(
            deactivated: true,
            label: "Crashes",
            icon: Coolicons.settings_future,
            onPressed: () {}),
        SidebarButton(
            deactivated: false,
            label: "Explore",
            icon: Coolicons.bar_chart_circle,
            onPressed: () {}),
      ],
    ));
  }
}
