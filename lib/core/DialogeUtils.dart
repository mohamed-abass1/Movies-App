import 'package:flutter/material.dart';
import 'package:movies_app1/core/utils/app_colors.dart';
import 'package:movies_app1/core/utils/font_theme.dart';


class DialogUtils {

  static void showLoading({required BuildContext context, required String message}) {
    showDialog(


        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.PrimaryColor,
            content: Row(
              children: [
                CircularProgressIndicator(color:AppColors.BlackColor),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: FontTheme.semi20Black,
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        List<Widget> actions = [];

        if (posActionName != null) {
          actions.add(TextButton(
            onPressed: () {
              if (Navigator.canPop(dialogContext)) {
                Navigator.pop(dialogContext);
              }
              posAction?.call();
            },
            child: Text(
              posActionName,
              style: FontTheme.semi20Black,
            ),
          ));
        }

        if (negActionName != null) {
          actions.add(TextButton(
            onPressed: () {
              if (Navigator.canPop(dialogContext)) {
                Navigator.pop(dialogContext);
              }
              negAction?.call();
            },
            child: Text(
              negActionName,
              style: FontTheme.regular20White,
            ),
          ));
        }

        return AlertDialog(
          backgroundColor: AppColors.PrimaryColor,
          content: Text(
            message,
            style: FontTheme.semi20Black,
          ),
          title: Text(
            title ?? '',
            style: FontTheme.semi20Black,
          ),
          actions: actions,
        );
      },
    );
  }

}
