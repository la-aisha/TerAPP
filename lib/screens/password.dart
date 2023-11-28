import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ter/globals/colors.dart';
import 'package:ter/utils/title.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            children: [
              Image.asset('images/password.png'),
               SizedBox(width: 30,),

              TitleText(
                textAlign: TextAlign.center,
                data: 'Choisissez 4 chiffre pour votre mot de passe',
                color: Colors.black87,
                size: 15,
                weight: FontWeight.normal),

              SizedBox(width: 30,),
              Pinput(
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
              SizedBox(
                height: 30,
              ),
               /// digits
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      3,
                      (index) => numButton(1 + 3 * i + index),
                    ).toList(),
                  ),
                ),

            /// 0 digit with back remove
            ],
          ),
          ),
        )
      ),
      
      
    );
  }
}