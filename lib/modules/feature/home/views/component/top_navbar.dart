import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/navbar_item.dart';
import 'package:getx_template/modules/feature/home/controllers/home_controller.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "MH",
                        style: GoogleTextStyle.fw500.copyWith(
                          color: MainColor.whitePrimary,
                        ),
                      ),
                    ),
                  ),

                  // Navigation items
                  if (isSmallScreen)
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    )
                  else
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: navbarItem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: MouseRegion(
                              onEnter: (_) => HomeController.to
                                  .updateHoverState(index, true),
                              onExit: (_) => HomeController.to
                                  .updateHoverState(index, false),
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  HomeController.to.scrollToItem(index);
                                },
                                child: Obx(
                                  () => Text(
                                    navbarItem[index],
                                    style: GoogleTextStyle.fw300.copyWith(
                                        color:
                                            HomeController.to.isHovered(index)
                                                ? MainColor.whitePrimary
                                                : MainColor.whiteSecondary),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
