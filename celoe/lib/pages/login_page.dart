import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // Tailwind colors
    const Color primaryColor = Color(0xFFE63946);
    // const Color secondaryColor = Color(0xFF1D3557);
    const Color backgroundLight = Color(0xFFF1F5F9);
    const Color cardLight = Color(0xFFFFFFFF);

    // const Color textGray800 = Color(0xFF1F2937); // Assuming gray-800
    // const Color textGray600 = Color(0xFF4B5563); // Assuming gray-600
    // const Color textGray400 = Color(0xFF9CA3AF); // Assuming gray-400

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 844, maxWidth: 390), // Mobile width approximation
            decoration: BoxDecoration(
              color: cardLight,
              borderRadius: BorderRadius.circular(24), // rounded-3xl approx
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2), // shadow-2xl approx
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
                    color: Colors.white.withValues(alpha: 0.2), // opacity-20 equivalent blend
                    colorBlendMode: BlendMode.dstATop, // Adjust as needed
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
                        stops: const [0.0, 0.4, 1.0], // approximated from via-primary/60
                      ),
                    ),
                  ),
                ),
                
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48), // px-8 pt-12 pb-8 approx
                  child: Column(
                    children: [
                      const SizedBox(height: 40), // pt-10
                      
                      // Title
                      Text(
                        'CELOE',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 48,
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
                        'Learn Without Limits',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withValues(alpha: 0.9),
                          letterSpacing: 0.5,
                        ),
                      ),
        
                      const SizedBox(height: 48), // mt-12
        
                      // Image Stack
                      SizedBox(
                        width: 256,
                        height: 256,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                             // Decorative blur elements - simplified as containers with blur if possible, or ignored/approximated
                             // Flutter doesn't intentionally support arbitrary blurred blobs easily without backdrop filter or custom painters.
                             // We will stick to the main image for now.
                             
                             Image.network(
                               'https://lh3.googleusercontent.com/aida-public/AB6AXuBEHsfIGs0KPYFNrILrID5XpkpJ4lD6On5DOR0vglT2EsTIfD7YpJrUj_TKA1q1QqXNYPWOxWLX06JS5hj5GPhWXmeuOOxDfGSq7rpiVa80DwGE927kH3VOR2904YKVmxZIljUKTWK7OXFJu68UQNHpfq1SbYFoC9j7zCzziAcQGW78hFcf7pxPotjxODCebdUae3sO8fv-JWdhz6KUJtexTmctKj_ffasrOz1pZVt6b0up19HazlfnCSb_V-yKPIQ7OPNJlDoDmLrR',
                               fit: BoxFit.contain,
                             ),
                          ],
                        ),
                      ),
        
                      const SizedBox(height: 48),
        
                      // Login Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1), // bg-white/10
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
                        // Attempting backdrop blur
                        // in Stack, it needs ClipRRect and BackdropFilter, but Container decoration handles color
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(24),
                           child: BackdropFilter(
                             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // approximate amount
                             child: Container(
                               // Re-apply padding and color here because BackdropFilter needs to be parent of content but inside clip
                               padding: const EdgeInsets.all(24),
                               decoration: BoxDecoration(
                                 color: Colors.white.withValues(alpha: 0.1),
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: [
                                   Text(
                                     'Welcome!',
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.plusJakartaSans(
                                       fontSize: 24,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.grey[800],
                                     ),
                                   ),
                                   const SizedBox(height: 4),
                                   Text(
                                     'Please login to your account',
                                      textAlign: TextAlign.center,
                                     style: GoogleFonts.plusJakartaSans(
                                       fontSize: 14,
                                       color: Colors.grey[600],
                                     ),
                                   ),
                                   const SizedBox(height: 24),
                                   
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
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: BorderSide(color: Colors.grey[200]!),
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: const BorderSide(color: primaryColor, width: 2),
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
                                       enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: BorderSide(color: Colors.grey[200]!),
                                       ),
                                        focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(12),
                                         borderSide: const BorderSide(color: primaryColor, width: 2),
                                       ),
                                       contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                     ),
                                   ),
                                   
                                   Align(
                                     alignment: Alignment.centerRight,
                                     child: TextButton(
                                       onPressed: () {},
                                       child: Text(
                                         'Forgot Password?',
                                         style: GoogleFonts.plusJakartaSans(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w500,
                                           color: Colors.grey[600],
                                         ),
                                       ),
                                     ),
                                   ),
                                   
                                   // Sign In Button
                                   ElevatedButton(
                                     onPressed: () {},
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
                                           'Sign In',
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
                                   
                                   // Divider
                                   Row(
                                     children: [
                                       Expanded(child: Divider(color: Colors.grey[300])),
                                       Padding(
                                         padding: const EdgeInsets.symmetric(horizontal: 8),
                                         child: Text(
                                           'Or continue with',
                                           style: GoogleFonts.plusJakartaSans(
                                             fontSize: 12,
                                             color: Colors.grey[500],
                                           ),
                                         ),
                                       ),
                                       Expanded(child: Divider(color: Colors.grey[300])),
                                     ],
                                   ),
                                   
                                   const SizedBox(height: 16),
                                   
                                   // Social Buttons
                                   Row(
                                     children: [
                                       Expanded(
                                         child: OutlinedButton(
                                           onPressed: () {},
                                           style: OutlinedButton.styleFrom(
                                             padding: const EdgeInsets.symmetric(vertical: 12),
                                             side: BorderSide(color: Colors.grey[200]!),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(12),
                                             ),
                                             backgroundColor: Colors.white,
                                           ),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Image.network(
                                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png',
                                                 height: 20,
                                                 width: 20,
                                               ),
                                               const SizedBox(width: 8),
                                               Text(
                                                 'Google',
                                                 style: GoogleFonts.plusJakartaSans(
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.grey[700],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                       const SizedBox(width: 16),
                                       Expanded(
                                         child: OutlinedButton(
                                           onPressed: () {},
                                           style: OutlinedButton.styleFrom(
                                             padding: const EdgeInsets.symmetric(vertical: 12),
                                             side: BorderSide(color: Colors.grey[200]!),
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(12),
                                             ),
                                             backgroundColor: Colors.white,
                                           ),
                                            child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Image.network(
                                                 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                                                 height: 20,
                                                 width: 20,
                                               ),
                                               const SizedBox(width: 8),
                                               Text(
                                                 'Facebook',
                                                 style: GoogleFonts.plusJakartaSans(
                                                   fontSize: 14,
                                                   fontWeight: FontWeight.w500,
                                                   color: Colors.grey[700],
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                   
                                   const SizedBox(height: 24),
                                    Center(
                                     child: RichText(
                                       text: TextSpan(
                                         text: "Don't have an account? ",
                                         style: GoogleFonts.plusJakartaSans(
                                           fontSize: 14,
                                           color: Colors.grey[600],
                                         ),
                                         children: [
                                           TextSpan(
                                             text: 'Sign up',
                                             style: GoogleFonts.plusJakartaSans(
                                               fontWeight: FontWeight.bold,
                                               color: primaryColor,
                                             ),
                                             // Recognizer here for tap
                                             recognizer: TapGestureRecognizer()
                                               ..onTap = () {
                                                 Navigator.push(
                                                   context,
                                                   MaterialPageRoute(builder: (context) => const RegistrationPage()),
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

  // Helper for blur
  // Note: BackdropFilter usually needs a filter, we construct it here.
  // In older Flutter versions/presets ImageFilter might need 'dart:ui'.
  // But usually automatic if imported or available via painting.
  // We need import 'dart:ui';
}

// Add this import at the top
// import 'dart:ui';
