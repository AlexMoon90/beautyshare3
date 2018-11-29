import 'package:flutter/material.dart';
import 'Mainpage.dart';
import 'package:beautyshare3/Usage/Usagepage.dart';
import 'package:easy_alert/easy_alert.dart';

void main() {
  runApp( AlertProvider(
      child:  Mainpage(),
      config:  AlertConfig(ok: "OK", cancel: "CANCEL"),
  ));
}
