import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidgets extends StatelessWidget {
  final Widget screenBtn; // Changed from Navigator to Widget
  final String tapMe;

  const ButtonWidgets({
    super.key,
    this.tapMe = 'Go to Transaction Page',
    required this.screenBtn,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screenBtn), // Use the screenBtn directly here
        );
      },
      child: Text(
        tapMe,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}