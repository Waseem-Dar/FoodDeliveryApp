import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:food_app/screens/auth_screens/new_password_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import '../../config/app_colors.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class EnterOTPScreen extends StatefulWidget {
  const EnterOTPScreen({super.key,});

  @override
  State<EnterOTPScreen> createState() => _EnterOTPScreenState();
}
bool _change = false;
class _EnterOTPScreenState extends State<EnterOTPScreen> {
  final OtpFieldController otpController = OtpFieldController();
  int _minutes = 4;
  int _seconds = 59;
  bool _isTimerActive = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isTimerActive) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            if (_minutes > 0) {
              _minutes--;
              _seconds = 59;
            } else {
              _isTimerActive = false;
              timer.cancel();
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              children: [
                SizedBox(
                  height: mq.height *.4,
                  child: Center(
                    child: Text("LOGO", style: GoogleFonts.poppins(fontSize: 64, fontWeight: FontWeight.w800, color: AppColors.mainColor),
                    ),
                  ),
                ),
                Text(
                  "Enter OTP", style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black,),
                ),
                const SizedBox(height: 5,),
                Text("An OTP code has been sent to your phone no.",
                  style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.black6,),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30,),
                UserWidgets.textFieldLabel("Enter OTP Code"),
                FlutterOtpField(
                  inputFieldLength: 5,
                  spaceBetweenFields: 5,
                  inputDecoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 46,),
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color:_change?AppColors.mainColor: AppColors.black3,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(
                              color: AppColors.mainColor,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(30))),
                  onValueChange: (String value) {
                    if(value.length < 5){
                      setState(() {
                        _change = false;
                      });
                    }else{

                    }
                  },
                  onCompleted: (String value) {
                    if(value.isNotEmpty){
                      setState(() {
                        _change =true;
                      });
                    }
                  },),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      InkWell(
                        splashColor:Colors.transparent,
                        onTap:() {
                          if (!_isTimerActive) {
                            // Send new code action
                            startTimer(); // Restart the timer
                            setState(() {
                              _isTimerActive = true;
                              _minutes = 4;
                              _seconds = 59;
                            });
                          }
                        },
                        child: Text("Send New Code", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color:_isTimerActive ? AppColors.black6 : AppColors.mainColor,),
                        ),
                      ),
                      Text(
                        "${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                UserWidgets.mainButton("Next", _change? AppColors.mainColor : AppColors.whiteGrey, 18, _change ? Colors.white : AppColors.black6,
                    20, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPasswordScreen(),));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
