import 'package:flutter/material.dart';

class MenuData {
  static List<Map<String, dynamic>> menuItems = [
    {
      "icon": const ImageIcon(
        AssetImage("assets/profile.png"),
        color: Colors.white,
      ),
      "title": "Profilim",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.favorite,
        color: Colors.white,
      ),
      "title": "Abonelikler",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.credit_card,
        color: Colors.white,
      ),
      "title": "Ödeme Yöntemleri",
      "function": () {},
    },
    {
      "icon": const ImageIcon(
        AssetImage("assets/bill.png"),
        color: Colors.white,
      ),
      "title": "Fatura Bilgilerim",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.chat,
        color: Colors.white,
      ),
      "title": "Yorumlarım",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.notifications_sharp,
        color: Colors.white,
      ),
      "title": "Bildirim Ayarları",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.lock,
        color: Colors.white,
      ),
      "title": "Gizlilik Politikası",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.white,
      ),
      "title": "Şartlar ve Koşullar",
      "function": (context) {
        Navigator.pop(context);
      },
    },
    {
      "icon": const ImageIcon(
        AssetImage("assets/kvkk.png"),
        color: Colors.white,
      ),
      "title": "KVKK Aydınlatma Metni",
      "function": () {},
    },
    {
      "icon": const Icon(
        Icons.logout_outlined,
        color: Colors.white,
      ),
      "title": "Oturumu Kapat",
      "function": () {},
    },
  ];
}
