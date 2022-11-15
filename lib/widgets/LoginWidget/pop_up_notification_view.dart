import 'package:family_garden/utils/common_import/common_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUpNotificationView extends StatefulWidget {
  final Function onClosePressed;

  const PopUpNotificationView({Key? key, required this.onClosePressed})
      : super(key: key);

  @override
  PopUpNotificationViewState createState() => PopUpNotificationViewState();
}

class PopUpNotificationViewState extends State<PopUpNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.3),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 65.0, 20.0, 65.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 0),
                    blurRadius: 10.0,
                    spreadRadius: 4),
              ],
            ),
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/session_expired_image.png',
                            height: 100,
                            width: 100,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            text: const TextSpan(
                              text: 'OOPS!',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.oopsColor),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '\nYour Session Has\nExpired',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Your Session has expired due to your inactivity. No Worry, Simply Log In again',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18.0, left: 20, right: 20),
                        child: SizedBox(
                          height: 49,
                          width: MediaQuery.of(context).size.width,
                          child: MaterialButton(
                            color: AppColors.primaryColor,
                            onPressed: () {
                              widget.onClosePressed();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -8,
                  top: -8,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.24),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            ),
                          ]),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xffFF8A00),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
