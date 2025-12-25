import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'home_page.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isObscure = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE63946);
    const Color backgroundLight = Color(0xFFF1F5F9);
    const Color cardLight = Color(0xFFFFFFFF);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 844, maxWidth: 390),
            decoration: BoxDecoration(
              color: cardLight,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuB7DepTgpS4zy7BcEzNBrNj39d4hKTTzmL8CTHuxYIgYOc9ZtwxxB6XyRo6MIiG6pvD1Q3Qmx8uYpYBfUoDZrtPPu7qTHe19_JFCEySwpxFO5bk4aqh8Kue7-i8MiGIi7ENkpKi1ZAFdXmEeUv9bB63qVY4LL9XSkr2rNCYdoEyT2rD9LfJZ9klFwTcA5nKAxFQrYk49Nu1iNxdr3Yj5iCF1hBAo02o_0pEwRXdCF09iYUaS-w6H4k_WR31oFv5Y8Pc1glvFa_sHMeG',
                    fit: BoxFit.cover,
                    color: Colors.white.withValues(alpha: 0.2),
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
                // Gradient Overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor.withValues(alpha: 0.9),
                          primaryColor.withValues(alpha: 0.6),
                          backgroundLight,
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      
                      // Title
                      Text(
                        'Create Account',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.05,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Join us and start learning',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.9),
                          letterSpacing: 0.5,
                        ),
                      ),
        
                      const SizedBox(height: 40),
        
                      // Registration Form Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                          boxShadow: [
                             BoxShadow(
                               color: Colors.black.withValues(alpha: 0.1),
                               blurRadius: 20,
                               offset: const Offset(0, 10),
                             ),
                          ],
                        ),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(24),
                           child: BackdropFilter(
                             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                             child: Container(
                               padding: const EdgeInsets.all(8),
                               decoration: BoxDecoration(
                                 color: Colors.white.withValues(alpha: 0.05),
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                   // Full Name Input
                                   TextField(
                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: cardLight,
                                       hintText: 'Full Name',
                                       hintStyle: TextStyle(color: Colors.grey[400]),
                                       prefixIcon: Icon(Icons.person_outline, color: Colors.grey[400]),
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: BorderSide.none,
                                       ),
                                       contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                     ),
                                   ),
                                   const SizedBox(height: 16),
                                   
                                   // Email Input
                                   TextField(
                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: cardLight,
                                       hintText: 'Email Address',
                                       hintStyle: TextStyle(color: Colors.grey[400]),
                                       prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[400]),
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: BorderSide.none,
                                       ),
                                       contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                     ),
                                   ),
                                   const SizedBox(height: 16),
                                   
                                    // Password Input
                                   TextField(
                                     obscureText: _isObscure,
                                     decoration: InputDecoration(
                                       filled: true,
                                       fillColor: cardLight,
                                       hintText: 'Password',
                                       hintStyle: TextStyle(color: Colors.grey[400]),
                                       prefixIcon: Icon(Icons.lock_outlined, color: Colors.grey[400]),
                                       suffixIcon: IconButton(
                                         icon: Icon(
                                           _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, 
                                           color: Colors.grey[400],
                                           size: 20,
                                         ),
                                         onPressed: () {
                                           setState(() {
                                             _isObscure = !_isObscure;
                                           });
                                         },
                                       ),
                                       border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: BorderSide.none,
                                       ),
                                       contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                     ),
                                   ),
                                   
                                   const SizedBox(height: 24),
                                   
                                   // Register Button
                                   ElevatedButton(
                                     onPressed: () {
                                       Navigator.pushReplacement(
                                         context,
                                         MaterialPageRoute(builder: (context) => const HomePage()),
                                       );
                                     },
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: primaryColor,
                                       foregroundColor: Colors.white,
                                       padding: const EdgeInsets.symmetric(vertical: 16),
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(12),
                                       ),
                                       elevation: 4,
                                       shadowColor: primaryColor.withValues(alpha: 0.4),
                                     ),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         Text(
                                           'Sign Up',
                                           style: GoogleFonts.plusJakartaSans(
                                             fontSize: 16,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         const SizedBox(width: 8),
                                         const Icon(Icons.arrow_forward, size: 20),
                                       ],
                                     ),
                                   ),
                                   
                                   const SizedBox(height: 24),
                                   
                                    Center(
                                     child: RichText(
                                       text: TextSpan(
                                         text: "Already have an account? ",
                                         style: GoogleFonts.plusJakartaSans(
                                           fontSize: 14,
                                           color: Colors.grey[600],
                                         ),
                                         children: [
                                           TextSpan(
                                             text: 'Sign In',
                                             style: GoogleFonts.plusJakartaSans(
                                               fontWeight: FontWeight.bold,
                                               color: primaryColor,
                                             ),
                                             recognizer: TapGestureRecognizer()
                                               ..onTap = () {
                                                 Navigator.pushReplacement(
                                                   context,
                                                   MaterialPageRoute(builder: (context) => const LoginPage()),
                                                 );
                                               },
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                      ),
                    ],
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
