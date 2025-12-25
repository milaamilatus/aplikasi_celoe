import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'edit_profile_page.dart';
import 'my_course_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // State for profile data
  String _name = 'Amilatus Sholehah';
  String _email = 'amilatus@example.com';
  String _phone = '+62 812 3456 7890';
  String _dob = '1998-05-15';

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color primaryColor = Color(0xFFE91E63);
    const Color backgroundLight = Color(0xFFF6F7F8); 
    const Color surfaceWhite = Colors.white;

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
           // Header Background (Red/Pink)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 250, 
            child: Container(
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
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // AppBar Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profil',
                        style: GoogleFonts.poppins( // Using Poppins as per app theme
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Profile Info
                Column(
                  children: [
                    // Avatar with Rings
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 4),
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: backgroundLight, width: 4),
                          image: const DecorationImage(
                            image: NetworkImage('https://img.freepik.com/premium-photo/portrait-young-business-woman-looking-camera-smile-white-wall_33799-8833.jpg'),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _name,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _email,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 48),
                
                // Menu List
                Expanded(
                  child: Container(
                   padding: const EdgeInsets.symmetric(horizontal: 24),
                   child: ListView(
                     children: [
                       _buildMenuItem(context, Icons.edit, 'Edit Profile', primaryColor, onTap: () async {
                         final result = await Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => EditProfilePage(
                               initialName: _name,
                               initialEmail: _email,
                               initialPhone: _phone,
                               initialDob: _dob,
                             ),
                           ),
                         );

                         if (result != null && result is Map<String, String>) {
                           setState(() {
                             _name = result['name'] ?? _name;
                             _email = result['email'] ?? _email;
                             _phone = result['phone'] ?? _phone;
                             _dob = result['dob'] ?? _dob;
                           });
                         }
                       }),
                       const SizedBox(height: 16),
                       _buildMenuItem(context, Icons.school, 'Kursus Saya', primaryColor, onTap: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const MyCoursePage()),
                         );
                       }),
                       const SizedBox(height: 16),
                       _buildMenuItem(context, Icons.help_outline, 'Pusat Bantuan', primaryColor),
                       const SizedBox(height: 24),
                       // Logout
                       GestureDetector(
                         onTap: () {
                           Navigator.pushReplacement(
                             context,
                             MaterialPageRoute(builder: (context) => const LoginPage()),
                           );
                         },
                         child: Container(
                           padding: const EdgeInsets.all(16),
                           decoration: BoxDecoration(
                             color: const Color(0xFFFEF2F2), // red-50
                             borderRadius: BorderRadius.circular(16),
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.black.withValues(alpha: 0.05),
                                 blurRadius: 2,
                               ),
                             ],
                           ),
                           child: Row(
                             children: [
                               Container(
                                 width: 40,
                                 height: 40,
                                 decoration: BoxDecoration(
                                   color: const Color(0xFFFECACA), // red-200
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: const Icon(Icons.logout, color: Colors.red, size: 24),
                               ),
                               const SizedBox(width: 16),
                               Expanded(
                                 child: Text(
                                   'Keluar',
                                   style: GoogleFonts.poppins(
                                     fontSize: 16,
                                     fontWeight: FontWeight.w500,
                                     color: Colors.red,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, Color primaryColor, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
               blurRadius: 2,
             ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: primaryColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
