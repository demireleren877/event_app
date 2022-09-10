import 'package:flutter/material.dart';

import '../../core/routes/route_constants.dart';

class MenuData {
  static List<Map<String, dynamic>> menuItems = [
    {
      "icon": const ImageIcon(
        AssetImage("assets/profile.png"),
        color: Colors.white,
      ),
      "title": "Profilim",
      "route": Routes.home,
    },
    {
      "icon": const Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      "title": "Abonelikler",
      "route": Routes.search,
    },
    {
      "icon": const Icon(
        Icons.credit_card,
        color: Colors.white,
      ),
      "title": "Ödeme Yöntemleri",
      "route": Routes.profile,
    },
    {
      "icon": const ImageIcon(
        AssetImage("assets/bill.png"),
        color: Colors.white,
      ),
      "title": "Fatura Bilgilerim",
      "route": Routes.init,
    },
    {
      "icon": const Icon(
        Icons.chat,
        color: Colors.white,
      ),
      "title": "Yorumlarım",
      "route": Routes.init,
    },
    {
      "icon": const Icon(
        Icons.notifications_sharp,
        color: Colors.white,
      ),
      "title": "Bildirim Ayarları",
      "route": Routes.init,
    },
    {
      "icon": const Icon(
        Icons.lock,
        color: Colors.white,
      ),
      "title": "Gizlilik Politikası",
      "route": Routes.init,
    },
    {
      "icon": const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.white,
      ),
      "title": "Şartlar ve Koşullar",
      "route": Routes.init,
    },
    {
      "icon": const ImageIcon(
        AssetImage("assets/kvkk.png"),
        color: Colors.white,
      ),
      "title": "KVKK Aydınlatma Metni",
      "route": Routes.init,
    },
    {
      "icon": const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ),
      "title": "Oturumu Kapat",
      "route": Routes.init,
    },
  ];
}
