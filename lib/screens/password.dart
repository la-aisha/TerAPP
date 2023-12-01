import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:ter/globals/colors.dart';
import 'package:ter/utils/title.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/pin_plus_keyboard.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  String enteredPin = '';

  /// this widget will be use for each digit
  Widget numButton(int number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (enteredPin.length < 4) {
                    enteredPin += number.toString();
                  }
                });
              },
              child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Divider(
          height: 8, // You can adjust the height of the divider
          thickness: 2, // You can adjust the thickness of the divider
          color: Colors.black, // You can adjust the color of the divider
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    PinInputController pinInputController = PinInputController(length: 4);
    void otpModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Stack(
          //clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              //color: Colors.white,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(children: [
                SizedBox(height: 20,),
                TitleText(
                  data: 'Votre mot de passe est',
                  color: Colors.black,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                TitleText(
                  data: pinInputController.text,
                  color: AppColors.myColor,
                  size: 32,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                       /*  setState(() {
                          pinInputController.text = "";
                        }); */
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                            0), // Adjust the elevation as needed
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors
                                .myColor, // Set your desired border color
                            width: 2.0, // Set the border width
                          ),
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the borderRadius
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Modifier',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 15, color: AppColors.myColor),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(
                              0), // Adjust the elevation as needed
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.myColor,
                                AppColors.myColor2
                              ], // Change colors as needed
                              begin: Alignment.topLeft,
                              //end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the borderRadius
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Confirmer mot de passe',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                //Spacer(),
                Image.asset('images/password.png'),
                SizedBox(
                  width: 30,
                ),

                TitleText(
                    textAlign: TextAlign.center,
                    data: 'Choisissez 4 chiffre pour votre mot de passe',
                    color: Colors.black87,
                    size: 15,
                    weight: FontWeight.normal),

                SizedBox(
                  height: 50,
                ),

                /*  Pinput(
                  length: 4,
                  showCursor: true,
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.myColor2),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      //otpCode = value;
                    });
                    //print(otpCode);
                  },
                ),
                Spacer(),
 */
                SizedBox(
                  height: 30,
                ),
                PinPlusKeyBoardPackage(
                  keyboardButtonShape: KeyboardButtonShape.circular,
                  inputShape: InputShape.circular,
                  isInputHidden: true,
                  inputHiddenColor: AppColors.myColor,
                  btnHasBorder: true,
                  btnShadowColor: AppColors.myColor,
                  focusColor: AppColors.BD,

                  //backButton: ,

                  spacing: 10,
                  pinInputController: pinInputController,
                  onSubmit: () {
                    /// ignore: avoid_print
                    print("Text is : " + pinInputController.text);
                    otpModal();
                  },
                  keyboardFontFamily: '',
                ),

                /// digits
                /*  for (var i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (index) => numButton(1 + 3 * i + index),
                      ).toList(),
                    ),
                  ), */

                /// 0 digit with back remove
              ],
            ),
          ),
        ),
      )),
    );
  }
}
