import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:ter/globals/colors.dart';
import 'package:ter/main.dart';
import 'package:ter/screens/Password.dart';
import 'package:ter/utils/title.dart';
import 'package:ter/utils/titleoption.dart';
import 'package:ter/widgets/CustomButton.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController phoneController = new TextEditingController();
  bool isGradientEnabled = false;

  var textlenght;
  @override
  Widget build(BuildContext context) {
    print("Build method - isGradientEnabled: $isGradientEnabled");
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isDesktop(BuildContext context) => width >= 600;
    bool isMobile(BuildContext context) => width < 600;

    void phoneModalDesktop() {
      print(phoneController.length);

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.height * 0.75,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                buildDragHandle(),
                SizedBox(
                  height: 10,
                ),
                TitleOption(
                    data: 'Connexion rapide',
                    color: AppColors.myColor,
                    size: 30,
                    weight: FontWeight.bold),
                TitleText(
                    textAlign: TextAlign.center,
                    data: 'Commencez par entrer votre numéro de téléphone',
                    color: Colors.black87,
                    size: 15,
                    weight: FontWeight.normal),
                SizedBox(
                  height: 40,
                ),
                //Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: AppColors.myColor2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: TitleText(
                                data: '+221',
                                color: AppColors.myColor,
                                size: 25,
                                weight: FontWeight.normal),
                          ),
                        ),
                        Text(
                          "|",
                          style:
                              TextStyle(fontSize: 30, color: AppColors.myColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (value) {
                            //phoneController.length == value.length;
                            print("la valeur du textfield est ${value.length}");
                            setState(() {
                              isGradientEnabled = (value.length == 9);

                              print(isGradientEnabled);
                            });
                            print(
                                "la valeur du phone controller text est ${phoneController.length}");
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontFamily:
                                'Roboto', // Specify the desired font family
                            fontSize: 23, // Adjust the font size as needed
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 3,
                            ),
                            border: InputBorder.none,
                            hintText: "phone",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily:
                                  'Roboto', // Specify the desired font family
                              fontSize: 22, // Specify the desired font size
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: numberCondition('recevoir OTP', () {
                    otpModal();
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    }

    void phoneModal() {
      print(phoneController.length);

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.height * 0.75,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(
              children: [
                buildDragHandle(),
                SizedBox(
                  height: 10,
                ),
                TitleOption(
                    data: 'Connexion rapide',
                    color: AppColors.myColor,
                    size: 30,
                    weight: FontWeight.bold),
                TitleText(
                    textAlign: TextAlign.center,
                    data: 'Commencez par entrer votre numéro de téléphone',
                    color: Colors.black87,
                    size: 15,
                    weight: FontWeight.normal),
                SizedBox(
                  height: 40,
                ),
                //Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: TitleText(
                                data: '+221',
                                color: AppColors.myColor,
                                size: 25,
                                weight: FontWeight.normal),
                          ),
                        ),
                        Text(
                          "|",
                          style:
                              TextStyle(fontSize: 30, color: AppColors.myColor),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextField(
                          onChanged: (value) {
                            //phoneController.length == value.length;
                            print("la valeur du textfield est ${value.length}");
                            setState(() {
                              isGradientEnabled = (value.length == 9);

                              print(isGradientEnabled);
                            });
                            print(
                                "la valeur du phone controller text est ${phoneController.length}");
                          },
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontFamily:
                                'Roboto', // Specify the desired font family
                            fontSize: 23, // Adjust the font size as needed
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 3,
                            ),
                            border: InputBorder.none,
                            hintText: "phone",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily:
                                  'Roboto', // Specify the desired font family
                              fontSize: 22, // Specify the desired font size
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                numberCondition('recevoir OTP', () {
                  otpModal();
                }),
              ],
            ),
          ),
        ),
      );
    }

    @override
    void initState() {
      // TODO: implement initState
      // phoneController.text = "+221";
      super.initState();
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ter1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Color.fromRGBO(
                  0, 0, 0, 0.75), // Set the overlay color and opacity
            ),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Image.asset(
                  'images/logoter.png',
                  width: 256,
                  height: 106,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        20), // Set the border radius value
                  ),
                  //color: Colors.white,
                  height: height * 3 / 5,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: isMobile(context)
                          ? [
                              Image.asset(
                                'images/welcome.gif',
                                width: 180,
                                height: 126,
                                fit: BoxFit.cover,
                              ),
                              //title
                              TitleOption(
                                  data: 'Bienvenue',
                                  color: AppColors.myColor,
                                  size: 32,
                                  weight: FontWeight.bold),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 5),
                                child: h1(15),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TitleText(
                                    textAlign: TextAlign.center,
                                    data:
                                        'Désormais acheter votre ticket rapidement sans faire la queue',
                                    color: Colors.black45,
                                    size: 12,
                                    weight: FontWeight.normal),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                text: 'Continuer',
                                onPressed: () {
                                  print(' true');
                                  //modal phone
                                  phoneModal();
                                },
                                imageAsset: AssetImage('images/arrow.png'),
                              )
                            ]
                          : [
                              Image.asset(
                                'images/welcome.gif',
                                width: 200,
                                height: 146,
                                fit: BoxFit.cover,
                              ),
                              //title
                              TitleOption(
                                  data: 'Bienvenue',
                                  color: AppColors.myColor,
                                  size: 38,
                                  weight: FontWeight.bold),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 5),
                                child: h1(20),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: TitleText(
                                    textAlign: TextAlign.justify,
                                    data: 'Désormais acheter votre ticket',
                                    color: Colors.black45,
                                    size: 22,
                                    weight: FontWeight.normal),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: TitleText(
                                    textAlign: TextAlign.justify,
                                    data: 'rapidement sans faire la queue',
                                    color: Colors.black45,
                                    size: 22,
                                    weight: FontWeight.normal),
                              ),
                              //button gradient
                              //Spacer(),
                              SizedBox(
                                height: 50,
                              ),
                              CustomButton(
                                text: 'Continuer',
                                onPressed: () {
                                  print(' true');

                                  phoneModalDesktop();
                                },
                                imageAsset: AssetImage('images/arrow.png'),
                              )
                            ],
                    ),
                  ),
                ),
              ),
            )
            /* Center(
              child: Image.asset(
                'images/logoter.png',
                width: 276,
                height: 126,
              ),
            ), */
          ],
        ),
      ),
    );
  }
   void showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 8), () {
          Navigator.pushReplacement(context , MaterialPageRoute(builder: (BuildContext context) => Password()));
        });

        return AlertDialog(
         // title: Text('Success!'),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
            ),
            width: double.infinity,
            height: 250,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('images/successmessage.png', height: 150,),
                  Align(
                      alignment: Alignment.center,
                      child: TitleText(
                          data: 'Connexion réussie',
                          color: AppColors.myColor,
                          size: 20,
                          weight: FontWeight.bold)),
                  TitleText(
                      data: 'Connexion réussie',
                      color: Colors.black,
                      size: 15,
                      weight: FontWeight.normal)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

   

  void otpModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.height * 0.75,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                child: Column(
                  children: [
                    Image.asset('images/message.png'),
                    SizedBox(
                      height: 20,
                    ),
                    TitleOption(
                        data: 'Vérification OTP',
                        color: AppColors.myColor,
                        size: 32,
                        weight: FontWeight.bold),
                    SizedBox(
                      height: 10,
                    ),
                    TitleText(
                        data: 'Entrer le code envoyé au numéro',
                        color: Colors.black,
                        size: 20,
                        weight: FontWeight.normal),
                    SizedBox(
                      height: 10,
                    ),
                    TitleText(
                        data: '(+221) 78 392 84 32',
                        color: Colors.black,
                        size: 20,
                        weight: FontWeight.normal),
                    SizedBox(
                      height: 30,
                    ),
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
                      height: 40,
                    ),
                    CustomButton(
                        text: 'confirmer',
                        //call the alert
                        onPressed: () {
                          showSuccessAlert(context);
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                            text: 'Je n’ai pas reçu de code.',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                //decoration: TextDecoration.underline,
                                //decorationColor: Color.fromRGBO(40, 0, 81, 1),
                              ),
                            ),
                          ),
                          TextSpan(
                              text: ' Renvoyer',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  color: AppColors.myColor)),
                        ])),
                    SizedBox(
                      height: 30,
                    ),
                    //CustomButton(text: 'confirmer', onPressed: onPressed),

                    /* buildDragHandle(),
                    SizedBox(
                      height: 10,
                    ), */

                    //numberconditon(text, () { }, imageAsset)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height * 0.25 - 30),
            child: Container(
              clipBehavior: Clip.none,
              height: 60,
              width: 60,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    AppColors.myColor,
                    AppColors.myColor2
                  ], // Change colors as needed
                  begin: Alignment.topLeft,
                  //end: Alignment.bottomLeft,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'images/vector.png',
                  width: 25,
                ),
              ),
            ),
          ),
          //Positioned(child: child)
        ],
      ),
    );
  }

// onchange function si le numero ne contient pas 9 chiffre // sinon show alert
//onchange qui change la couleur du text // la couleur du bouton
// setstate
  Widget numberCondition(String text, VoidCallback onPressed) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        bool isGradientEnabled = (phoneController.text.length == 9);

        return ElevatedButton(
          onPressed: () {
            if (phoneController.text.length == 9) {
              onPressed();
            }
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 1 / 2,
            decoration: BoxDecoration(
              gradient: isGradientEnabled
                  ? LinearGradient(
                      colors: [AppColors.myColor, AppColors.myColor2],
                      begin: Alignment.topLeft,
                    )
                  : LinearGradient(
                      colors: [AppColors.myColor, AppColors.myColor2],
                      begin: Alignment.topLeft,
                    ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /*  Widget numberCondition(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isGradientEnabled = (phoneController.text.length == 9);
        });
        if (phoneController.text.length == 9) {
          otpModal();
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 1 / 2,
        decoration: BoxDecoration(
          gradient: isGradientEnabled
              ? LinearGradient(
                  colors: [AppColors.myColor, AppColors.myColor2],
                  begin: Alignment.topLeft,
                )
              : LinearGradient(
                  colors: [AppColors.myColor, AppColors.myColor2],
                  begin: Alignment.topLeft,
                ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  */ /* ElevatedButton numberconditon(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: (phoneController.length == 9) ? () => otpModal : null,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(
              0), // Adjust the elevation as needed
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.transparent)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
           color: (phoneController.length < 9 || phoneController.length > 9)
              ? Colors.grey
              : null, 
          gradient: (phoneController.length == 9)
              ? LinearGradient(
                  colors: [
                    AppColors.myColor,
                    AppColors.myColor2
                  ], // Change colors as needed
                  begin: Alignment.topLeft,
                  //end: Alignment.bottomLeft,
                )
              : null,
          borderRadius: BorderRadius.circular(20.0), // Adjust the borderRadius
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  */ // texfieldnumber
  TextField textfieldnumber({
    required controller,
  }) {
    return TextField(
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.F5,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.BD)),
          border: InputBorder.none),
    );
  }

  //modal bottomsheet otp
  Widget showModalPhone(
    double width,
  ) {
    print('TRUE');
    return Container(
      color: Colors.white,
      width: width,
      height: 100,
    );
  }

  //drag handle
  Widget buildDragHandle() {
    return Center(
      child: Container(
        width: 45,
        height: 3,
        color: Colors.black87,
      ),
    );
  }

  Widget h1(double size) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: [
          TextSpan(
            text:
                'Sur le service de billeterie en ligne du Train Express Régional ',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: size,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                //decoration: TextDecoration.underline,
                //decorationColor: Color.fromRGBO(40, 0, 81, 1),
              ),
            ),
          ),
          TextSpan(
              text: 'TER',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                  ),
                  color: AppColors.myColor)),
        ]));
  }
}
