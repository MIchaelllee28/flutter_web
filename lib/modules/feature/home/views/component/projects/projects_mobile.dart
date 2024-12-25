import 'package:flutter/widgets.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/projects.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class ProjectsMobile extends StatelessWidget {
  final double screenWidth;
  const ProjectsMobile({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColor.scaffoldBg,
      height: 1200,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Projects",
            style: GoogleTextStyle.fw400.copyWith(
              color: MainColor.whitePrimary,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.25),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 350,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: MainColor.bgLight2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.asset(
                              projectsItem[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  projectsItem[index]['name'],
                                  style: GoogleTextStyle.fw500.copyWith(
                                    fontSize: 16,
                                    color: MainColor.whitePrimary,
                                  ),
                                ),
                                Text(
                                  projectsItem[index]['description'],
                                  style: GoogleTextStyle.fw500.copyWith(
                                    fontSize: 12,
                                    color: MainColor.whitePrimary,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: MainColor.hintDark,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Available in: ',
                                          style: GoogleTextStyle.fw500.copyWith(
                                            fontSize: 13,
                                            color: MainColor.yellowPrimary,
                                          ),
                                        ),
                                        Image.asset(
                                          "lib/assets/images/icons/gitlab.png",
                                          width: 30,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
