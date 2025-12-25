import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'courses_page.dart';
import 'profile_page.dart';
import 'course_overview_page.dart';
import 'digital_marketing_course_page.dart';
import 'ux_ui_course_page.dart';
import 'data_science_course_page.dart';
import 'python_course_page.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    // Colors from HTML
    const Color backgroundLight = Color(0xFFF8FAFC); // Slate-50

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          // Main Scrollable Content
          Positioned.fill(
            bottom: 88, // Space for bottom nav
            child: _buildBodyContent(),
          ),
          
          // Bottom Navigation (Custom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[100]!)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(Icons.home, 'Beranda', 0),
                  _buildNavItem(Icons.school, 'Kursus', 1),
                  _buildNavItem(Icons.person, 'Profil', 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildBodyContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const CoursesPage();
      case 2:
        return const ProfilePage();
      default:
        return _buildHomeContent();
    }
  }

  // Extracted Home Content
  Widget _buildHomeContent() {
    const Color primaryColor = Color(0xFFE11D48); // Rose-600
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           // Header
           Container(
             padding: const EdgeInsets.only(top: 48, bottom: 56, left: 24, right: 24),
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 colors: [Color(0xFFF43F5E), Color(0xFFE11D48)], // Rose-500 to Primary
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
                       'Beranda',
                       style: GoogleFonts.poppins(
                         fontSize: 20,
                         fontWeight: FontWeight.w600,
                         color: Colors.white,
                         letterSpacing: 0.5,
                       ),
                     ),
                     Container(
                       width: 40,
                       height: 40,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
                         image: const DecorationImage(
                           image: NetworkImage('https://img.freepik.com/premium-photo/portrait-young-business-woman-looking-camera-smile-white-wall_33799-8833.jpg'),
                           fit: BoxFit.cover,
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
           
           // Search Bar (Overlapping)
           Transform.translate(
             offset: const Offset(0, -24),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
               child: Container(
                 height: 48,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(24),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black.withValues(alpha: 0.1),
                       blurRadius: 10,
                       offset: const Offset(0, 4),
                     ),
                   ],
                 ),
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Row(
                   children: [
                     const Icon(Icons.search, color: Colors.grey),
                     const SizedBox(width: 12),
                     Expanded(
                       child: TextField(
                         decoration: InputDecoration(
                           hintText: 'Cari kursus...',
                           hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                           border: InputBorder.none,
                           isDense: true,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           
           // Tips Section
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   '5 Tips untuk Belajar Lebih Efektif',
                   style: GoogleFonts.poppins(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: const Color(0xFF1E293B), // Slate-800
                   ),
                 ),
                 const SizedBox(height: 16),
                 Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(16),
                     border: Border.all(color: Colors.grey[100]!),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black.withValues(alpha: 0.05),
                         blurRadius: 2,
                       ),
                     ],
                   ),
                   clipBehavior: Clip.hardEdge,
                   child: Stack(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(16),
                         child: Row(
                           children: [
                             Expanded(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     'Artikel Baru',
                                     style: GoogleFonts.inter(
                                       color: primaryColor,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 12,
                                     ),
                                   ),
                                   const SizedBox(height: 4),
                                   Text(
                                     'Temukan cara meningkatkan fokus dan ingatan Anda dengan teknik belajar modern.',
                                     style: GoogleFonts.inter(
                                       color: const Color(0xFF64748B), // Slate-500
                                       fontSize: 12,
                                       height: 1.5,
                                     ),
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                   const SizedBox(height: 12),
                                   Container(
                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                     decoration: BoxDecoration(
                                       color: const Color(0xFFFFE4E6), // Rose-100
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     child: Text(
                                       'Baca Sekarang',
                                       style: GoogleFonts.inter(
                                         fontSize: 10,
                                         fontWeight: FontWeight.w600,
                                         color: primaryColor,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             const SizedBox(width: 16),
                             Container(
                               width: 80, // w-24 approx
                               height: 80,
                               decoration: BoxDecoration(
                                 color: const Color(0xFFEFF6FF), // Blue-50
                                 borderRadius: BorderRadius.circular(12),
                               ),
                               padding: const EdgeInsets.all(12),
                               child: Image.network(
                                 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
                                 fit: BoxFit.cover,
                                 opacity: const AlwaysStoppedAnimation(0.9),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Positioned(
                         top: 0,
                         right: 0,
                         child: Container(
                           width: 96,
                           height: 96,
                           decoration: BoxDecoration(
                             gradient: LinearGradient(
                               colors: [const Color(0xFFFFE4E6).withValues(alpha: 0.5), Colors.transparent],
                               begin: Alignment.topRight,
                               end: Alignment.bottomLeft,
                             ),
                             borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),

           // Course Section
           Padding(
             padding: const EdgeInsets.all(24),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Text(
                       'Kursus Pilihan',
                       style: GoogleFonts.poppins(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: const Color(0xFF1E293B),
                       ),
                     ),
                     Text(
                       'Lihat Semua',
                       style: GoogleFonts.inter(
                         fontSize: 12,
                         fontWeight: FontWeight.w500,
                         color: primaryColor,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(height: 16),
                 _buildCourseCard('Desain Web Dasar', 'Pemula', '12 Pelajaran', Icons.laptop_mac, Colors.blue),
                 const SizedBox(height: 16),
                 _buildCourseCard('UX/UI Pemula', 'Pemula', '8 Pelajaran', Icons.design_services, Colors.orange),
                 const SizedBox(height: 16),
                  _buildCourseCard('Data Science Dasar', 'Menengah', '24 Pelajaran', Icons.analytics, Colors.purple),
                  const SizedBox(height: 16),
                  _buildCourseCard('Pemasaran Digital', 'Pemula', '4 Minggu', Icons.trending_up, Colors.red),
                  const SizedBox(height: 16),
                  _buildCourseCard('Python Programming', 'Menengah', '10 Minggu', Icons.code, Colors.teal),
               ],
             ),
           ),
           const SizedBox(height: 24),
        ],
      ),
    );
  }

  // Placeholder Courses Content
  Widget _buildCoursesContent() {
    return Center(
      child: Text(
        'Halaman Kursus',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Placeholder Profile Content
  Widget _buildProfileContent() {
    return Center(
      child: Text(
        'Halaman Profil',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCourseCard(String title, String level, String duration, IconData icon, MaterialColor color) {
    return GestureDetector(
      onTap: () {
        if (title == 'Desain Web Dasar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CourseOverviewPage()),
          );
        } else if (title == 'Pemasaran Digital') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DigitalMarketingCoursePage()),
          );
        } else if (title == 'UX/UI Pemula') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UxUiCoursePage()),
          );
        } else if (title == 'Data Science Dasar') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DataScienceCoursePage()),
          );
        } else if (title == 'Python Programming') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PythonCoursePage()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!),
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
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9), // Slate-100
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          level,
                          style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF64748B)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        duration,
                        style: GoogleFonts.inter(fontSize: 10, color: const Color(0xFF94A3B8)), // Slate-400
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)), // Slate-300
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
      final bool isActive = _selectedIndex == index;
      const Color primaryColor = Color(0xFFE11D48);
      
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 32,
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFFFF1F2) : Colors.transparent, // Rose-50
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isActive ? primaryColor : const Color(0xFF94A3B8), // Slate-400
                size: 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isActive ? primaryColor : const Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
      );
  }
}
