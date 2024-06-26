import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/custom_imge.dart';
import 'package:mobile/helpers/image_constant.dart';
import 'package:mobile/helpers/theme_helper.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgBasket,
      activeIcon: ImageConstant.imgBasket,
      type: BottomBarEnum.Basket,
    ),
    BottomMenuModel(
      icon: ImageConstant.chair,
      activeIcon: ImageConstant.chair,
      type: BottomBarEnum.Seat,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      type: BottomBarEnum.UserProfile,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: appTheme.black90001,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 22,
              width: 22,
              color: kBackgroundColor,
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 22,
              width: 22,
              color: theme.colorScheme.onPrimaryContainer,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onChanged?.call(bottomMenuList[index].type);
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Basket,
  Seat,
  UserProfile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
