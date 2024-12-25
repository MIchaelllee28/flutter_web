import 'package:flutter/widgets.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/skill_items.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColor.bgLight1,
      height: 360,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "What I can do",
            style: GoogleTextStyle.fw500.copyWith(
              color: MainColor.whitePrimary,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 4,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: MainColor.bgLight2,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: MainColor.bgLight1,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          deviceItems[index]['icon'],
                          size: 20,
                          color: MainColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        deviceItems[index]['skill'],
                        style: GoogleTextStyle.fw500.copyWith(
                          fontSize: 14,
                          color: MainColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          // Skills Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 30,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: MainColor.bgLight2,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        skillItems[index]['image'],
                        width: 15,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        skillItems[index]['skill'],
                        style: GoogleTextStyle.fw500.copyWith(
                          fontSize: 12,
                          color: MainColor.whitePrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
