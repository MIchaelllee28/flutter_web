import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/navbar_item.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColor.shadowColorLight,
      child: Container(
        margin: const EdgeInsets.all(10),
        constraints: const BoxConstraints(minHeight: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [
              MainColor.scaffoldBg,
              MainColor.bgLight1,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 600;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Logo section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      "MH",
                      style: GoogleTextStyle.fw500.copyWith(
                        color: MainColor.whitePrimary,
                      ),
                    ),
                  ),

                  // Navigation items
                  if (isSmallScreen)
                    // Hamburger menu for small screens
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        // Implement drawer or menu logic here
                        Scaffold.of(context).openEndDrawer();
                      },
                    )
                  else
                    // Navigation items for larger screens
                    Wrap(
                      spacing: 15,
                      children: navbarItem
                          .map(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                item,
                                style: GoogleTextStyle.fw300.copyWith(
                                  color: MainColor.whitePrimary,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
