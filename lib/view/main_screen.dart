import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourth_project/resources/custom_tab_indicator.dart';

import '../resources/app_styles.dart';
import '../resources/size_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: kBackgroundColor,
                padding: const EdgeInsets.only(top: 52, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "All Inboxes",
                              style: kJakartaHeading1.copyWith(
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * kHeading1,
                                color: kDarkColor,
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_rounded,
                              size: SizeConfig.blockSizeHorizontal! * kHeading3,
                            )
                          ],
                        ),
                        Text(
                          "Total 2500 Messages, 3 Unread",
                          style: kJakartaBodyMedium.copyWith(
                              color: kParagraphColor,
                              fontSize:
                                  SizeConfig.blockSizeHorizontal! * kBody1),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      // radius is half of the diameter, here diameter is 52, so radius will be 26
                      maxRadius: 26.r,
                      backgroundImage:
                          const AssetImage('assets/images/avatar1.jpg'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 28.h,
                color: kBackgroundColor,
              ),
              Container(
                color: kBackgroundColor,
                child: SizedBox(
                  height: 98.h,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: index == 0 ? 24 : 0,
                          right: index == 10 - 1 ? 24 : 8, // itemCount - 1
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  maxRadius: 36.r,
                                  backgroundColor: kWhiteColor,
                                  foregroundImage: const AssetImage(
                                      "assets/images/google.png"),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.h,
                                      horizontal: 8.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: kPrimaryColor,
                                    ),
                                    child: IntrinsicWidth(
                                      child: Text(
                                        "12",
                                        style: kJakartaBodyBold.copyWith(
                                          color: kWhiteColor,
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  kBody2,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Google",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: kJakartaBodyMedium.copyWith(
                                color: kParagraphColor,
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * kBody1,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 48,
                color: kBackgroundColor,
              ),
              Container(
                height: 30.h,
                transform: Matrix4.translationValues(0, -24, 0),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 36.h),
                transform: Matrix4.translationValues(0, -36, 0),
                height: 30.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: DefaultTabController(
                          length: 3,
                          child: TabBar(
                            labelPadding: const EdgeInsets.only(
                              right: 24,
                            ),
                            indicatorWeight: 8,
                            isScrollable: true,
                            labelColor: kDarkColor,
                            labelStyle: kJakartaBodyBold.copyWith(
                              fontSize:
                                  SizeConfig.blockSizeHorizontal! * kBody1,
                            ),
                            unselectedLabelColor: kDark40Color,
                            indicator: RoundedRectangleTabIndicator(
                              color: kPrimaryColor,
                              weight: 4,
                              width: 24.w,
                              padding: 12.0,
                            ),
                            splashFactory: NoSplash.splashFactory,
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return states.contains(MaterialState.focused)
                                    ? null
                                    : Colors.transparent;
                              },
                            ),
                            tabs: const [
                              Tab(text: "Primary"),
                              Tab(text: "Social"),
                              Tab(text: "Forums"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 19.5.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.more_horiz,
                            color: kDark40Color,
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            "Edit",
                            style: kJakartaBodyBold.copyWith(
                              color: kDark40Color,
                              fontSize:
                                  SizeConfig.blockSizeHorizontal! * kBody1,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                transform: Matrix4.translationValues(0, -36, 0),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 116.h,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(
                        bottom: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBackgroundColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 24.r,
                            backgroundColor: Colors.transparent,
                            foregroundImage:
                                const AssetImage("assets/images/avatar2.png"),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shahzain Ahmed',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kJakartaBodyMedium.copyWith(
                                    color: kParagraphColor,
                                    fontSize: SizeConfig.blockSizeHorizontal! *
                                        kBody1,
                                  ),
                                ),
                                Text(
                                  'Congratulations!',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kJakartaHeading4.copyWith(
                                    color: kDarkColor,
                                    fontSize: SizeConfig.blockSizeHorizontal! *
                                        kHeading4,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  'You just win the Email client challenge 2022.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: kJakartaBodyMedium.copyWith(
                                    color: kParagraphColor,
                                    fontSize: SizeConfig.blockSizeHorizontal! *
                                        kBody1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          SizedBox(
                            height: 58.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '57 m',
                                  style: kJakartaBodyBold.copyWith(
                                    color: kDark40Color,
                                    fontSize: SizeConfig.blockSizeHorizontal! *
                                        kBody2,
                                  ),
                                ),
                                Container(
                                  height: 8.h,
                                  width: 8.w,
                                  decoration: const BoxDecoration(
                                    color: kSecondaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
