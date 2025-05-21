// ignore_for_file: camel_case_types, avoid_unnecessary_containers, await_only_futures, unused_element, dead_code, avoid_print

// import 'package:chef_ui_app/futuer/home/widget/add_eating_dialog.dart';
// import 'package:chef_ui_app/futuer/home/widget/empty_eating.dart';
// import 'package:chef_ui_app/futuer/home/widget/list_eating.dart';
// import 'package:chef_ui_app/futuer/home/widget/notfification.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Eating_view extends StatelessWidget {
//   Eating_view({super.key});
//   final List<Map<String, dynamic>> dinners = [
//     {
//       'name': 'سلطة الجمبري',
//       'stars': 4,
//       'price': '69ج.م',
//       'image': 'asset/dinner.png',
//     },
//     {
//       'name': 'فرخة باربيكيو',
//       'stars': 5,
//       'price': '69ج.م',
//       'image': 'asset/dinner.png',
//     },
//     {
//       'name': 'طبق ارز بالجمبري ',
//       'stars': 3,
//       'price': '69ج.م',
//       'image': 'asset/dinner.png',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: notification(context),
//       body:
//           dinners.isEmpty
//               ? Center(child: empaty_eating(context))
//               : list_eating_item(context, dinners),
//     );
//   }

//   pickImage(bool isCamera) {
//     ImagePicker()
//         .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
//         .then((value) {});
//   }
// }







import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_block.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_state.dart';
import 'package:chef_ui_app/futuer/home/widget/add_eating_dialog.dart';
import 'package:chef_ui_app/futuer/home/widget/empty_eating.dart';
import 'package:chef_ui_app/futuer/home/widget/list_eating.dart';
import 'package:chef_ui_app/futuer/home/widget/notfification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


 // تأكد من استيراد الديالوج

// class Eating_view extends StatefulWidget {
//   const Eating_view({super.key});

//   @override
//   State<Eating_view> createState() => _Eating_viewState();
// }

// class _Eating_viewState extends State<Eating_view> {
//   List<Map<String, dynamic>> dinners = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: notification(context),
//       body: dinners.isEmpty
//           ? Center(child: empaty_eating(context))
//           : list_eating_item(
//               context,
//               dinners,
              
//             ),

//     );
//   }

//   pickImage(bool isCamera) {
//     ImagePicker()
//         .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
//         .then((value) {});
//   }
// }



class Eating_view extends StatelessWidget {
  const Eating_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notification(context),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FoodLoaded) {
            final dinners = state.foodList; // فرضًا foodList فيها الأكلات
            if (dinners.isEmpty) {
              return Center(child: empaty_eating(context));
            } else {
              return list_eating_item(context, dinners);
       print(list_eating_item(context, dinners));
              }
          } else if (state is FoodError) {
            return Center(child: Text('حدث خطأ في تحميل الأكلات'));
          } else {
            return Center(child: Text('ابدأ بإضافة أكلات'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddDialog(context), // تعرض صفحة إضافة الأكلة
        child: Icon(Icons.add),
      ),
    );
  }
}
