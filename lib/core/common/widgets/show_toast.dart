import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  const ShowToast._();

  static void showToastSuccessBOTTOM({
    required String message,
    required bool toastForsuccess,
    int? seconds,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: toastForsuccess ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
}
