import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XCircularIndicator extends StatelessWidget {
  const XCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: kIsWeb || Platform.isAndroid
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                  ),
                )
              : const CupertinoActivityIndicator(
                  radius: 15,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
