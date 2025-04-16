// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool showNew = true;

  final List<Map<String, String>> newNotifications = [
    {
      "image": "asset/logo.png",
      "title": "طلب جديد!",
      "message": "مبروك! لديك طلب جديد من [زياد]. تأكد من بدء التحضير في أقرب وقت!",
      "time" : "منذ 5 دقائق"
    },
    {
      "image": "asset/logo.png",
      "title": " الطلب قيد التحضير!",
      "message": "تم تغيير حالة الطلب (بسبوسة بجوز الهند) إلى قيد التحضير استعد لتقديم أشهى الأطباق!",
       "time" : "منذ 5 دقائق"
    },
    {
      "image": "asset/logo.png",
      "title": "  تحديث جديد في التطبيق!!",
      "message": "أضفنا تحسينات جديدة لجعل تجربة استخدامك أسهل وأفضل! جربها الآن.",
      "time" : "منذ 5 دقائق"
    },
  ];

  final List<Map<String, String>> oldNotifications = [
    {
      "image": "asset/logo.png",
      "title": "دفعتك جاهزة للسحب!",
      "message": "  رصيدك محفظتك الحالي هو 2500 جنيه. يمكنك سحب أموالك الآن عبر وسائل الدفع المتاحة!",
      "time" : "منذ 5 دقائق"
    },
    {
      "image": "asset/logo.png",
      "title": "طلب جديد بانتظارك!",
      "message": "لديك طلب جديد من [وليد]. ابدأ في تحضيره الآن لتحصل على تقييم رائع!",
      "time" : "منذ 5 دقائق"
    },
  ];

  @override

  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications =
        showNew ? newNotifications : oldNotifications;

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // Top Center Text + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "الاشعارات",
                style: getBodyTextStyle(context),
              ),
             
              SizedBox(width: 8),
               Icon(Icons.notifications, color: Colors.orange),
              
            ],
          ),

          const SizedBox(height: 20),

          // Orange Border Tab
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showNew = true),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: showNew ? Colors.grey.withOpacity(0.2) : Colors.transparent,
                      child:  Center(child: Text("جديدة",style: getBodyTextStyle(context,color: Appcolor.black),)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showNew = false),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: !showNew ? Colors.grey.withOpacity(0.2) : Colors.transparent,
                      child:  Center(child: Text("تمت القراءه",style: getBodyTextStyle(context,color: Appcolor.black))),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Notification List
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: showNew ? Colors.grey[300] : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          notification["image"] ?? "",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification["title"] ?? "",
                              style: getBodyTextStyle(context,color: Appcolor.primary)
                            ),
                            const SizedBox(height: 6),
                            Text(
                              notification["message"] ?? "",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              notification["time"]??" ",
                              style: getBodyTextStyle(context,
                              color: Appcolor.primary
                              )

                            ),
                          ],
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
