import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/navbar_item.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({Key? key}) : super(key: key);

  // Helper method to get icon for each menu item
  IconData _getIconForItem(String item) {
    switch (item.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'about':
        return Icons.info;
      case 'services':
        return Icons.design_services;
      case 'portfolio':
        return Icons.work;
      case 'contact':
        return Icons.contact_mail;
      case 'blog':
        return Icons.article;
      default:
        return Icons.circle; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MainColor.scaffoldBg,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MainColor.scaffoldBg,
                    MainColor.bgLight1,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: MainColor.whitePrimary,
                        size: 24,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Center(
                    child: Text(
                      'MH',
                      style: GoogleTextStyle.fw500.copyWith(
                        color: MainColor.whitePrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: navbarItem
                    .map((item) => ListTile(
                          leading: Icon(
                            _getIconForItem(item),
                            color: MainColor.whitePrimary,
                            size: 22,
                          ),
                          title: Text(
                            item,
                            style: GoogleTextStyle.fw300.copyWith(
                              color: MainColor.whitePrimary,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          hoverColor: MainColor.bgLight1.withValues(alpha: 0.2),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
