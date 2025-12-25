import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // Colors from HTML config
    const Color primaryColor = Color(0xFFE91E63);
    const Color backgroundLight = Color(0xFFF8F9FA); // dark: 121212
    const Color surfaceLight = Color(0xFFFFFFFF); // dark: 1E1E1E
    const Color textLight = Color(0xFF333333); // dark: E0E0E0
    const Color inputBgLight = Color(0xFFF0F2F5); // dark: 2C2C2C

    // We'll trust the user executes in light mode for now or system default, 
    // referencing the light mode colors primary for the implementation as requested.

    return Scaffold(
      backgroundColor: backgroundLight,
      body: SingleChildScrollView(
        child: Container(
           constraints: const BoxConstraints(minHeight: 884), // min-h-screen
           width: double.infinity,
           child: Column(
             children: [
               // Header Background
               Container(
                 width: double.infinity,
                 padding: const EdgeInsets.only(top: 48, bottom: 64, left: 24, right: 24),
                 decoration: const BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Color(0xFFE91E63), Color(0xFFFF5252)],
                     begin: Alignment.topLeft,
                     end: Alignment.bottomRight,
                   ),
                   borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(40),
                     bottomRight: Radius.circular(40),
                   ),
                 ),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         IconButton(
                           icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                           onPressed: () => Navigator.pop(context),
                         ),
                         Text(
                           'CELOE',
                           style: GoogleFonts.poppins(
                             fontSize: 30, 
                             fontWeight: FontWeight.bold, 
                             color: Colors.white,
                             letterSpacing: 1.5,
                           ),
                         ),
                         const SizedBox(width: 40), // spacer for centering
                       ],
                     ),
                   ],
                 ),
               ),
               
               // Card Content
               Transform.translate(
                 offset: const Offset(0, -32),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 32),
                   child: Container(
                     padding: const EdgeInsets.all(32),
                     decoration: BoxDecoration(
                       color: surfaceLight,
                       borderRadius: BorderRadius.circular(24),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withValues(alpha: 0.1),
                           blurRadius: 10,
                           offset: const Offset(0, 4),
                         ),
                       ],
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           'Selamat datang,\nAmilatus!',
                           style: GoogleFonts.poppins(
                             fontSize: 24,
                             fontWeight: FontWeight.bold,
                             color: textLight,
                             height: 1.2,
                           ),
                         ),
                         const SizedBox(height: 8),
                         Text(
                           'Silakan isi data untuk mendaftar',
                           style: GoogleFonts.poppins(
                             fontSize: 14,
                             color: Colors.grey[500],
                           ),
                         ),
                         
                         const SizedBox(height: 24),
                         
                         // Email Input
                         Container(
                           decoration: BoxDecoration(
                             color: inputBgLight,
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: TextField(
                             decoration: InputDecoration(
                               prefixIcon: const Icon(Icons.email, color: Colors.grey),
                               hintText: 'Email',
                               hintStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
                               border: InputBorder.none,
                               contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                             ),
                           ),
                         ),
                         
                         const SizedBox(height: 20),
                         
                         // Password Input
                         Container(
                           decoration: BoxDecoration(
                             color: inputBgLight,
                             borderRadius: BorderRadius.circular(12),
                           ),
                           child: TextField(
                             obscureText: _isObscure,
                             decoration: InputDecoration(
                               prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   _isObscure ? Icons.visibility_off : Icons.visibility,
                                   color: Colors.grey,
                                 ),
                                 onPressed: () => setState(() => _isObscure = !_isObscure),
                               ),
                               hintText: 'Kata sandi',
                               hintStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
                               border: InputBorder.none,
                               contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                             ),
                           ),
                         ),
                         
                         const SizedBox(height: 24),
                         
                         // Submit Button
                         SizedBox(
                           width: double.infinity,
                           child: ElevatedButton(
                             onPressed: () {},
                             style: ElevatedButton.styleFrom(
                               backgroundColor: primaryColor,
                               foregroundColor: Colors.white,
                               padding: const EdgeInsets.symmetric(vertical: 16),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(50), // rounded-full
                               ),
                               elevation: 5,
                               shadowColor: primaryColor.withValues(alpha: 0.3),
                             ),
                             child: Text(
                               'Buat Akun',
                               style: GoogleFonts.poppins(
                                 fontSize: 14,
                                 fontWeight: FontWeight.w600,
                                 letterSpacing: 0.5,
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               
               const SizedBox(height: 20),
               
               // Footer
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     'Belum punya akun? ',
                     style: GoogleFonts.poppins(
                       fontSize: 14,
                       color: Colors.grey[500],
                     ),
                   ),
                   GestureDetector(
                     onTap: () {
                         // Navigation
                     },
                     child: Text(
                       'Daftar',
                       style: GoogleFonts.poppins(
                         fontSize: 14,
                         fontWeight: FontWeight.w600,
                         color: primaryColor,
                         decoration: TextDecoration.underline,
                       ),
                     ),
                   ),
                 ],
               ),
               
               const SizedBox(height: 32),
             ],
           ),
        ),
      ),
    );
  }
}
