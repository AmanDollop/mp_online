import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

import '../app/data/constants/icons_constant.dart';
import '../app/data/constants/image_constants.dart';

class CommonWidgets {
  static String cur = "₹";
  static final isConnect = false.obs;
  // final Connectivity connectivity = Connectivity();

  static void unFocsKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  // Future<void> getNetworkConnectionType() async {
  //   try {
  //     ConnectivityResult connectivityResult;
  //     connectivityResult = await connectivity.checkConnectivity();
  //     return updateConnectionState(
  //         result: connectivityResult, context: Get.context!);
  //   } on PlatformException catch (e) {
  //     showSnackBar(message: e.message.toString(), context: Get.context!);
  //   }
  // }

  // StreamSubscription checkNetworkConnection() {
  //   bool networkConnection = false;
  //   return connectivity.onConnectivityChanged.listen((event) async {
  //     networkConnection = await internetConnectionCheckerMethod();
  //     if (networkConnection) {
  //       isConnect.value = true;
  //     } else {
  //       isConnect.value = false;
  //       /*showSnackBar(
  //           message: "Check your internet connection!", context: Get.context!);*/
  //     }
  //     return updateConnectionState(result: event, context: Get.context!);
  //   });
  // }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return '${dayNum}th';
    }

    switch (dayNum % 10) {
      case 1:
        return '${dayNum}st';
      case 2:
        return '${dayNum}nd';
      case 3:
        return '${dayNum}rd';
      default:
        return '${dayNum}th';
    }
  }

  // void updateConnectionState(
  //     {required BuildContext context, required ConnectivityResult result}) {
  //   switch (result) {
  //     case ConnectivityResult.wifi:
  //       break;
  //     case ConnectivityResult.mobile:
  //       break;
  //     case ConnectivityResult.none:
  //       break;
  //     default:
  //       showSnackBar(message: 'Network Error', context: Get.context!);
  //       break;
  //   }
  // }

  static void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  static void showSnackBar(
      {required String message,required BuildContext context, Duration? duration}) {
    var snackBar = SnackBar(
      elevation: 4,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.px),
        side: const BorderSide(color: primary2Color),
      ),
      content: Text(
        message,
        style:MyTextStyle.titleStyle12bw,
      ),
       margin: EdgeInsets.only(left: 8.px, right: 6.px, bottom: 40.px),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String getDeviceType() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      return "";
    }
  }

  static void networkConnectionShowSnackBar() {
    showSnackBar(
        message: "Check Your Internet Connection", context: Get.context!);
  }

  static void serverDownShowSnackBar() {
    showSnackBar(message: "Server Down", context: Get.context!);
  }

  static Widget progressBar({bool isLoading=false,Widget? child,double? height,double? width}) {
    return Container(
      height: height??50.px,
      width: width??double.infinity,
      alignment: Alignment.center,
      child: isLoading?Center(
          child: CircularProgressIndicator(
              color: Theme.of(Get.context!).primaryColor, strokeWidth: 4.px)):child,
    );
  }

 static AppBar appbar(
      {required BuildContext context,
        double? leadingWidth,
        Widget? title,
        Widget? leading,
        bool centerTitle = false,
        List<Widget>? actions}) {
    return AppBar(
      leadingWidth: leadingWidth,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // elevation: .5,
      title: title,
      leading: leading ?? const SizedBox(),
      centerTitle: centerTitle,
      actions: actions,
    );
  }
   static Widget categoryCardsCircle(
      {required String imageUrl, double? height, double? width}) {
    return Image.network(
      imageUrl,
      width: width ?? 24.px,
      height: height ?? 24.px,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress != null) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.onSecondary.withOpacity(.1),
            highlightColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.4),
            child: Image.asset(
              width: width ?? 24.px,
              height: height ?? 24.px,
              'assets/speaker.png',
              fit: BoxFit.cover,
            ),
          );
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          width: width ?? 24.px,
          height: height ?? 24.px,
          'assets/speaker.png',
          fit: BoxFit.cover,
        );
      },
    );
  }
   static Widget commonDisForError(
      {required String dis, required BuildContext context}) {
    return Text(
      dis,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.px),
    );
  }

  static Widget commonOtpView({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    PinCodeFieldShape? shape,
    TextInputType keyboardType = TextInputType.number,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    int length = 6,
    double? height,
    double? width,
    double? borderRadius,
    double? borderWidth,
    bool readOnly = false,
    bool autoFocus = false,
    bool enableActiveFill = true,
    bool enablePinAutofill = true,
    bool autoDismissKeyboard = true,
    TextStyle? textStyle,
    Color? cursorColor,
    Color? inactiveColor,
    Color? inactiveFillColor,
    Color? activeColor,
    Color? activeFillColor,
    Color? selectedColor,
    Color? selectedFillColor,
  }) =>
      PinCodeTextField(
        length: length,
        mainAxisAlignment: mainAxisAlignment,
        appContext: Get.context!,
        cursorColor: cursorColor ?? Theme.of(Get.context!).primaryColor,
        autoFocus: autoFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ??
            <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        readOnly: readOnly,
        textStyle: textStyle ?? Theme.of(Get.context!).textTheme.headlineMedium,
        autoDisposeControllers: false,
        enabled: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          inactiveColor: Colors.grey.withOpacity(0.8),
          inactiveFillColor: Colors.transparent,
          activeColor: Colors.grey.withOpacity(0.8),
          activeFillColor: Colors.transparent,
          selectedColor: Theme.of(Get.context!).colorScheme.primary,
          selectedFillColor: Colors.transparent,
          shape: shape ?? PinCodeFieldShape.box,
          fieldWidth: width ?? 45.px,
          fieldHeight: height ?? 45.px,
          borderWidth: borderWidth ?? 1.px,
          borderRadius: BorderRadius.circular(borderRadius ?? 15.px),
        ),
        enableActiveFill: enableActiveFill,
        controller: controller,
        onChanged: onChanged,
        enablePinAutofill: enablePinAutofill,
        onCompleted: onCompleted,
        autoDismissKeyboard: autoDismissKeyboard,
      );



  static Widget commonTitleForError(
      {required String title, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.px),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontSize: 20.px),
      ),
    );
  }


  static AppBar appBarView({String? title,bool showBackIcon=true,List<Widget>? action}) {
    return AppBar(
      backgroundColor: primaryColor,
      leading:showBackIcon?GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              IconConstants.icBack,
              height: 30.px,
              width: 30.px,
              fit: BoxFit.fill,
            ),
          )):const SizedBox(),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 20.px,color: Colors.white),
      ),
      actions:action,
    );
  }

  ///App Images
  static Widget appImagesView({required String imagePath,double? borderRadius,double? width,double? height,BoxFit? fit}) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(borderRadius??0.px) ,
      child: Image.asset(imagePath,width: width,height: height,fit:fit??BoxFit.cover ,),
    );
  }

  static imageView({
    double? width,
    double? height,
    double? radius,
    required String image,
    String? defaultNetworkImage,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8.px),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.fill,
          errorWidget: (context, error, stackTrace) {
            return Container(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              color:
              Theme.of(context).colorScheme.onSecondary.withOpacity(.2.px),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 8.px),
                child:defaultNetworkImage!=null?imageView(image: defaultNetworkImage,height: height,width: width):
                Icon(Icons.error, color: Theme.of(context).primaryColor),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return SizedBox(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              child: Shimmer.fromColors(
                baseColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.4.px),
                highlightColor: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4.px),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton(
      {double? height,
      double? width,
      EdgeInsetsGeometry? buttonMargin,
      EdgeInsetsGeometry? contentPadding,
      double? borderRadius,
      Color? splashColor,
      bool wantContentSizeButton = false,
      bool isLoading = false,
      Color? buttonColor,
        Color? btnIconColor,
      TextStyle? textStyle,
      double? elevation,
      required VoidCallback onPressed,
      required Widget child}) {
    return Container(
      height: wantContentSizeButton ? height : 50.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
        color: buttonColor ??primaryColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
      ),
      child: isLoading?const Center(
        child: CircularProgressIndicator(color: primary3Color,),
      ):ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle: textStyle ??
              Theme.of(Get.context!)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
          ),
          backgroundColor:
          buttonColor ??primaryColor,
          foregroundColor:
          splashColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        child:child,
      ),
    );
  }

  static Widget commonTextFieldForLoginSignUP(
      {double? elevation,
      String? hintText,
      String? title,
      String? labelText,
      String? errorText,
      EdgeInsetsGeometry? contentPadding,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      GestureTapCallback? onTap,
      bool obscureText = false,
      FocusNode? focusNode,
      bool? filled,
      bool isCard = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title??'',style: MyTextStyle.titleStyle14bb,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.px),
            border: Border.all(width: 1.px,color:isCard?primaryColor:Colors.grey),
            color:primary3Color,
          ),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding:  EdgeInsets.only(left: 10.px,right: 10.px,top: 2.px,bottom: 2.px),
            child: Row(
              children: [
                prefixIcon?? SizedBox(width: 1.px,),
                prefixIcon!=null?Container(
                  height: 40.px,width: 1.5.px,color: Colors.black54,
                  margin: EdgeInsets.only(left: 5.px,right: 5.px),
                ):SizedBox(width: 1.px,),
                Expanded(
                  child: TextFormField(
                    focusNode: focusNode,
                    obscureText: obscureText,
                    onTap: onTap,
                    maxLength: maxLength,
                    cursorHeight: cursorHeight,
                    cursorColor: Theme.of(Get.context!).primaryColor,
                    autovalidateMode: autoValidateMode,
                    controller: controller,
                    onChanged: onChanged ??
                        (value) {
                          value = value.trim();
                          if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                            controller?.text = "";
                          }
                        },
                    validator: validator,
                    keyboardType: keyboardType ?? TextInputType.streetAddress,
                    readOnly: readOnly,
                    autofocus: autofocus,
                    inputFormatters: inputFormatters,
                    textCapitalization: textCapitalization,
                    style: style ??
                        Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
                              color: Theme.of(Get.context!).primaryColor,
                            ),
                    decoration: InputDecoration(
                      errorText: errorText,
                      counterText: '',
                      errorStyle: errorStyle ??
                          Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Theme.of(Get.context!).colorScheme.error),
                      hintText: hintText,
                      labelText: labelText,
                      labelStyle: labelStyle,
                      fillColor:
                          fillColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
                      filled: filled ?? true,
                      contentPadding:
                          contentPadding ?? EdgeInsets.symmetric(horizontal: 3.px),
                      hintStyle: hintStyle ??MyTextStyle.titleStyle14b,
                      disabledBorder: OutlineInputBorder(
                        borderSide: wantBorder
                            ? BorderSide(
                                color: Theme.of(Get.context!).colorScheme.onSurface,
                                width: 2.px)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          borderRadius ?? 15.px,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: wantBorder
                              ? BorderSide(
                                  color: Theme.of(Get.context!).primaryColor, width: 2.px)
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: wantBorder
                              ? BorderSide(
                                  color: initialBorderColor ??
                                      Theme.of(Get.context!).primaryColor,
                                  width: initialBorderWidth ?? 2.px)
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),
                      errorBorder: OutlineInputBorder(
                          borderSide: wantBorder
                              ? BorderSide(
                                  color: Theme.of(Get.context!).colorScheme.onError,
                                  width: 2.px)
                              : BorderSide.none,
                          borderRadius: BorderRadius.circular(borderRadius ?? 4.px)),
                    ),
                  ),
                ),
                suffixIcon??const SizedBox()
              ],
            ),
          ),
        ),
      ],
    );
  }

///For Data Not Present ....
  static Widget dataNotFound() {
    return Center(
      child: Image.asset(ImageConstants.imageNoDataFound),
    );

  }

  ///For Simmer for loading time
  static Widget commonShimmer(
      {double? height,
        double? width,
        EdgeInsetsGeometry? buttonMargin,
        EdgeInsetsGeometry? contentPadding,
        double? borderRadius,
        Color? buttonColor,
        int itemCount=1,
        bool enabled=true,
        Widget? shimmerWidget,
        //required Widget child
      }) {
    return
      Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          enabled: enabled,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemCount,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return shimmerWidget??
                    Container(
                      height: 250.px,
                      width: double.infinity,
                      padding: EdgeInsets.all(5.px),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.px)),
                          border: Border.all(color: Colors.black,width: 2.px)
                      ),
                      margin: EdgeInsets.only(left:10.px,right: 10.px,top: 5.px,bottom: 2.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 2.px,vertical: 0.px),
                            leading: Container(
                              height: 40.px,width: 40.px,
                              decoration:  BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(20.px)),
                              ),
                            ),
                            title: Container(
                              height: 20.px,width: 130.px,
                              decoration:  BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                              ),
                            ),
                            trailing: Container(
                              height: 20.px,width: 40.px,
                              decoration:  BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.px,),
                          Container(
                            height: 20.px,width: 230.px,
                            decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(5.px)),
                            ),
                          ),
                          SizedBox(height: 5.px,),
                          Container(
                            height: 100.px,
                            decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(5.px)),
                            ),
                          ),
                          SizedBox(height: 5.px,),
                          Container(
                            height: 40.px,
                            decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10.px)),
                            ),
                          ),
                        ],
                      ),
                    );
              }
          )
      );
     }


  ///For Check Post Api Response
  static Future<bool> responseCheckForPostMethod(
      {http.Response? response}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {

      return true;
    } else if (response != null && response.statusCode == 401) {

      return false;
    } else {
      return false;
    }
  }

  ///For Check Get Api Response
  static Future<bool> responseCheckForGetMethod(
      {http.Response? response,
      bool wantSuccessToast = false,
      bool wantErrorToast = true,}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null &&
        response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}

enum ErrorAnimationType { shake, clear }
