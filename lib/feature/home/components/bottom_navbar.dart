import 'package:event_app/feature/home/components/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/home_viewmodel.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required HomeVM homeVM,
  })  : _homeVM = homeVM,
        super(key: key);

  final HomeVM _homeVM;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (a) => BottomNavigationBar(
        backgroundColor: const Color(0xFF242323),
        onTap: _homeVM.onTabChange,
        currentIndex: _homeVM.selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30.sp,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
              const AssetImage("assets/featured.png"),
              color: Colors.pink.shade600,
            ),
            icon: const ImageIcon(
              AssetImage("assets/featured.png"),
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.pink.shade600,
            ),
            icon: const Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.calendar_today_outlined,
              color: Colors.pink.shade600,
            ),
            icon: const Icon(Icons.calendar_today_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
              const AssetImage("assets/tickets.png"),
              color: Colors.pink.shade600,
            ),
            icon: const ImageIcon(
              AssetImage("assets/tickets.png"),
              color: Colors.white,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: AppBarProfileImage(),
            label: "",
          ),
        ],
      ),
    );
  }
}
