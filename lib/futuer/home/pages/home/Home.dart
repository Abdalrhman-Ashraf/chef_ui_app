// ignore_for_file: camel_case_types, file_names, library_private_types_in_public_api, use_key_in_widget_constructors, sort_child_properties_last, non_constant_identifier_names, unused_import

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/home/widget/header_widget.dart';
import 'package:chef_ui_app/futuer/home/widget/notfification.dart';
import 'package:chef_ui_app/futuer/home/widget/oreder_card.dart';
import 'package:chef_ui_app/futuer/home/widget/wait_complet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabs = [
    'طلبات قيد الانتظار',
    'طلبات قيد التحضير',
    'طلبات مكتملة',
    'طلبات مرفوضة',
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notification(context),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const HeaderSection(),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),

              child: TabBar(
                controller: _tabController,
                labelColor: Appcolor.primary,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                indicatorColor: Appcolor.primary,

                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                isScrollable: true,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  WaitingOrders(),
                  NewOrdersPage(),
                  CompletedOrders(),
                  RejectedOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------
// Waiting Orders Page
// ------------------------------
class WaitingOrders extends StatelessWidget {
  const WaitingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        OrderCard(
          name: 'فاطمة علي',
          item: 'مكرونة فرن بالدجاج',
          quantity: '1',
          price: '٢٥ ج م.',
          image: "asset/item.png",
        ),
        OrderCard(
          name: 'جمال محمد',
          item: 'كنافة بالقشطه',
          quantity: '3',
          price: '٣٠ ج م.',
          image: 'asset/item2.png',
        ),
      ],
    );
  }
}

// ------------------------------
// Waiting complet Page
// ------------------------------
class NewOrdersPage extends StatelessWidget {
  const NewOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        OrderCardSecondary(
          name: 'فاطمة علي',
          item: 'مكرونة فرن بالدجاج',
          quantity: '1',
          price: '٢٥ ج م',
          image: "asset/item.png",
        ),
        OrderCardSecondary(
          name: 'فاطمة علي',
          item: 'مكرونة فرن بالدجاج',
          quantity: '1',
          price: '٢٥ ج.م',
          image: "asset/item.png",
        ),
      ],
    );
  }
}

class WaitComplet extends StatelessWidget {
  const WaitComplet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        OrderCard(
          name: 'فاطمة علي',
          item: 'مكرونة فرن بالدجاج',
          quantity: '1',
          price: '٢٥ ر.س',
          image: "asset/item.png",
        ),
        OrderCard(
          name: 'جمال محمد',
          item: 'كنافة بالقشطه',
          quantity: '3',
          price: '٣٠ ر.س',
          image: 'asset/item2.png',
        ),
      ],
    );
  }
}

// ------------------------------
// Completed Orders Page
// ------------------------------
class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        StatusOrderCard(
          name: 'مكرونة بشاميل بالدجاج',
          status: 'مكتمل',
          price: '٢٥ ر.س',
          image: 'asset/complet_item1.png',
          imagestautes: 'asset/stautes_compleat.png',
        ),
        StatusOrderCard(
          name: 'طبق شعبي سعودي',
          status: 'مكتمل',
          price: '٢٠ ر.س',
          image: 'asset/complet_item1.png',
          imagestautes: 'asset/stautes_compleat.png',
        ),
      ],
    );
  }
}

// ------------------------------
// Rejected Orders Page
// ------------------------------
class RejectedOrders extends StatelessWidget {
  const RejectedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: const [
        StatusOrderCard(
          name: 'مكرونة فرن',
          status: 'مرفوض',
          price: '٢٥ ر.س',
          isRejected: true,
          image: 'asset/complet_item1.png',
          imagestautes: 'asset/reject_stautes.png',
        ),
        StatusOrderCard(
          name: 'طبق شعبي',
          status: 'مرفوض',
          price: '٢٠ ر.س',
          isRejected: true,
          image: 'asset/complet_item1.png',
          imagestautes: 'asset/reject_stautes.png',
        ),
      ],
    );
  }
}

// ------------------------------
// StatusOrderCard Widget
// ------------------------------
class StatusOrderCard extends StatelessWidget {
  final String name;
  final String status;
  final String price;
  final bool isRejected;
  final String image;
  final String imagestautes;

  const StatusOrderCard({
    super.key,
    required this.name,
    required this.status,
    required this.price,
    this.isRejected = false,
    required this.image,
    required this.imagestautes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Image.asset(image),
        title: Text(name),
        subtitle: Text(price),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagestautes, fit: BoxFit.cover, width: 30),
            SizedBox(width: 5),
            Text(
              status,
              style: TextStyle(
                color: isRejected ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(width: 10), // Add spacing between Text and Icon/Image
            // Rejected status icon
          ],
        ),
      ),
    );
  }
}
