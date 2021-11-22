// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Const {
  Const._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class WarningDialog extends StatelessWidget {

  final String description;
  final VoidCallback okClick;

  const WarningDialog({Key key, this.description, this.okClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: Const.padding,
          bottom: Const.padding,
          left: Const.padding,
          right: Const.padding),
      margin: EdgeInsets.only(top: Const.avatarRadius),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Const.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0.0, 10.0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'GAGAL',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.green),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(
            height: 24,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
                okClick();
              },
              child: Text('Ok'),
            ),
          )
        ],
      ),
    );
  }
}