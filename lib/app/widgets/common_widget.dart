import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/base/controller.dart';
import 'package:flutter_base/app/widgets/text_style.dart';
import 'package:get/get.dart';

void dialogYesNo(String title, BuildContext context, {Function() callback}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Không', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text('Có', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Get.back();

                      callback?.call();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void dialogAlert(String title, BuildContext context, {Function() callback}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Đóng', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Get.back();
                    callback?.call();
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

void dialogQuantities(String title, RxInt quantities, BuildContext context,
    {Function(int) callback, Function() remove}) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Obx(() => Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 40,
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('-',
                                style: TextStyle(color: Colors.white)),
                            onPressed: quantities.value > 0
                                ? () {
                                    quantities(quantities.value - 1);
                                  }
                                : null,
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 2)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12.0),
                              child: Text(quantities.value.toString(),
                                  style: Style.article1TextStyle.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                            )),
                        SizedBox(
                          width: 40,
                          child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('+',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              quantities(quantities.value + 1);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Xác nhận',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Get.back();
                        callback(quantities.value);
                      },
                    ),
                  )
                ],
              ),
            )),
      );
    },
  );
}

Widget loading({Status status, BuildContext context}) => Visibility(
      visible: status == Status.loading,
      child: Container(
        alignment: Alignment.center,
        color: Colors.black12,
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );

Widget textField(
    {String hintText,
    String helperText,
    String labelText,
    Widget prefixIcon,
    String prefixText,
    String suffixText,
    FocusNode focusNode,
    int maxLines = 1,
    bool readOnly = false,
    Function() onTap,
    double padding = 12,
    @required TextEditingController textEditingController}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: TextField(
      maxLines: maxLines,
      focusNode: focusNode,
      onTap: onTap?.call(),
      readOnly: readOnly,
      controller: textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          helperText: helperText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          suffixText: suffixText),
    ),
  );
}

clearFocus(BuildContext context) {
  if (FocusScope.of(context).hasFocus) {
    FocusScope.of(context).unfocus();
  } else {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
