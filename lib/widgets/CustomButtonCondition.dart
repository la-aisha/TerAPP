import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ter/globals/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ImageProvider? imageAsset;

  const CustomButton({super.key, required this.text, required this.onPressed, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0), // Adjust the elevation as needed
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        backgroundColor:  MaterialStateProperty.all<Color>(Colors.transparent),


      ), 

      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.myColor, AppColors.myColor2], // Change colors as needed
            begin: Alignment.topLeft,
            //end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(20.0), // Adjust the borderRadius
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 18 ,color: Colors.white),
            ),
            if (imageAsset != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image(
                  image: imageAsset!,
                  height: 24, // Adjust the height as needed
                  width: 24, // Adjust the width as needed
                ),
              ),
          ],
        ),
      ),
    );
  }
}
