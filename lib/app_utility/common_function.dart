import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kupf_mobile/app_utility/app_color.dart';
import 'package:kupf_mobile/app_utility/app_text_theme.dart';
import 'package:kupf_mobile/app_utility/image_string.dart';
import '../languages/language_constants.dart';

abstract class AppUtility {
  static Future<DateTime?> pickDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now());

  static const emptyBox = SizedBox.shrink();
  static const heightBox = SizedBox(height: 16.0);
  static const widthBox = SizedBox(width: 16.0);
  static const height32Box = SizedBox(height: 32.0);
  static const width32Box = SizedBox(width: 32.0);

  static const heightBoxMin = SizedBox(height: 8.0);
  static const defaultDuration = Duration(milliseconds: 800);

  static final ImagePicker _imagePicker = ImagePicker();
  static dateFormat(DateTime dateTime) => DateFormat.yMd(dateTime);

// Navigator.of(context).restorablePush(AppUtility.dialogBuilder);
  static Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
    final arg = arguments as Map;
    return RawDialogRoute<void>(
      //barrierColor: const Color(0xffF8F6F1),
      barrierColor: mainColor.value.withOpacity(0.1),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: mainColor.value.withOpacity(0.1),
                  radius: 64,
                  backgroundImage: ImageString.tooth),
              AppUtility.heightBoxMin,
              Text(arg['title'], style: Theme.of(context).textTheme.titleLarge),
              AppUtility.heightBoxMin,
              Row(
                children: [
                  Expanded(
                    child: Text(LanguageConstants.validFrom.tr,
                        style: AppTextTheme.bodyText1Black
                            .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['startTime'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              // AppUtility.heightBoxMin,
              Row(
                children: [
                  Expanded(
                    child: Text(LanguageConstants.validTill.tr,
                        style: AppTextTheme.bodyText1Black
                            .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['endTime'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              AppUtility.heightBoxMin,
              AppUtility.heightBoxMin,
              Text(
                  '${(arg['price'] - (arg['price'] * arg['discountPrice']) as double).toStringAsFixed(2)} KWD',
                  style: AppTextTheme.bodyText1Black),
              AppUtility.heightBoxMin,
              Text('${LanguageConstants.original.tr} ${arg['price']}'),
              AppUtility.heightBoxMin,
              Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${((arg['discountPrice'] / 100) * arg['price']).toInt()}% OFF',
                    style: AppTextTheme.bodyText1white.copyWith(fontSize: 18),
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Apply"))
              //GlobalSizing.heightBox,
            ],
          ),
        );
      },
    );
  }
  static Route<Object?> dialogBuilderTwo(BuildContext context, Object? arguments) {
    final arg = arguments as Map;
    return RawDialogRoute<void>(
      //barrierColor: const Color(0xffF8F6F1),
      barrierColor: mainColor.value.withOpacity(0.1),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: mainColor.value.withOpacity(0.5),
                  radius: 64,
                  backgroundImage: ImageString.hajjLoan),
              AppUtility.heightBoxMin,
              Text(arg['title'], style: Theme.of(context).textTheme.titleLarge),
              AppUtility.heightBoxMin,
              Row(
                children: [
                  Expanded(
                    child: Text('${LanguageConstants.installment.tr} :',
                        style: AppTextTheme.bodyText1Primary
                            .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['installmentDate'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              // AppUtility.heightBoxMin,
              Row(
                children: [
                  Expanded(
                    child: Text('${LanguageConstants.pendingAmount.tr} :',
                        style: AppTextTheme.bodyText1Primary
                            .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['amount'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('${LanguageConstants.receivedDate.tr} :',
                        style: AppTextTheme.bodyText1Primary
                            .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['receivedDate'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('${LanguageConstants.receivedAmount.tr} :',
                        style: AppTextTheme.bodyText1Primary
                            .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['receivedAmount'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('${LanguageConstants.financeReference.tr} :',
                        style: AppTextTheme.bodyText1Primary
                            .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text(arg['financeReference'],
                        style:
                            AppTextTheme.bodyText1Black.copyWith(fontSize: 14)),
                  ),
                ],
              ),
              AppUtility.heightBoxMin,
              AppUtility.heightBoxMin,
            ],
          ),
        );
      },
    );
  }

  static Future<XFile?> pickImage() async {
    final XFile? xFile =
    await _imagePicker.pickImage(source: ImageSource.gallery);
    return xFile;
  }
}

// class TutorialOverlay extends ModalRoute<void> {
//   @override
//   Duration get transitionDuration => Duration(milliseconds: 500);
//
//   @override
//   bool get opaque => false;
//
//   @override
//   bool get barrierDismissible => false;
//
//   @override
//   Color get barrierColor => Colors.black.withOpacity(0.5);
//
//   @override
//   String get barrierLabel => 'null';
//
//   @override
//   bool get maintainState => true;
//
//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     // This makes sure that text and other content follows the material style
//     return Material(
//       type: MaterialType.transparency,
//       // make sure that the overlay content is not cut off
//       child: SafeArea(
//         child: _buildOverlayContent(context),
//       ),
//     );
//   }
//
//   Widget _buildOverlayContent(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text(
//             'This is a nice overlay',
//             style: TextStyle(color: Colors.white, fontSize: 30.0),
//           ),
//           RaisedButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Dismiss'),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // You can add your own animations for the overlay content
//     return FadeTransition(
//       opacity: animation,
//       child: ScaleTransition(
//         scale: animation,
//         child: child,
//       ),
//     );
//   }
// }
