import 'package:eternal_calander_new/core/extensions/context-extensions.dart';
import 'package:eternal_calander_new/core/themes/themedata.dart';
import 'package:eternal_calander_new/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [context.primaryColor, context.secondaryHeaderColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: txt("Islamic Calendar", e: St.bold16),
              accountEmail: const Text("The best use of time is to spend it\nin the remembrance of Allah."),
              currentAccountPicture: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Icon(
                  Icons.brightness_3, // Crescent moon icon
                  size: 50,
                  color: lightClr.goldColor, // Gold color
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            _createDrawerItem(
              context,
              icon: MdiIcons.databaseSearch,
              text: 'Year',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              context,
              icon: Icons.calendar_month,
              text: 'Month',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              context,
              icon: MdiIcons.themeLightDark,
              text: 'Moon Phase',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white70),
            ListTile(
              title: const Text('About', style: TextStyle(color: Colors.white)),
              leading: Icon(Icons.info, color: context.secondaryHeaderColor),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(BuildContext context,
      {required IconData icon, required String text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Text(text, style: const TextStyle(color: Colors.white)),
      leading: Icon(icon, color: context.secondaryHeaderColor),
      onTap: onTap,
    );
  }
}
