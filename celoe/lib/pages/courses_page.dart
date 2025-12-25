import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from HTML config
    const Color primaryColor = Color(0xFFE91E63);
    const Color backgroundLight = Color(0xFFF3F4F6); // background-light
    const Color surfaceLight = Color(0xFFFFFFFF); // surface-light
    const Color textLight = Color(0xFF333333); // text-light
    const Color subtextLight = Color(0xFF9CA3AF); // subtext-light

    // Note: The HTML has a bottom nav bar, but we are inside HomePage which presumably has one.
    // However, the HTML design shows a specific header style that needs to be replicated.
    // Since HomePage puts this in a Stack with a bottom nav, we just need to ensure
    // we build the content correctly.
    // The HTML body has a background color and uses a Stack-like approach for the header.

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          // Header Background (Pink rounded part)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 192, // h-48 = 12rem * 4 = 48 * 4 = 192px approx? Tailwind h-48 is 12rem. 1rem=16px -> 192px.
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40), // rounded-b-[2.5rem]
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          
          Column(
            children: [
              // Custom AppBar / Header Content
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
                child: Column(
                  children: [
                    // Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                            onPressed: () {
                              // If this is a tab, maybe we don't pop? 
                              // But the design has a back button. 
                              // If it's the main Home tab switching, popping might not be right.
                              // For now, checks if can pop.
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } 
                              // If switched via tab, usually no back action unless it goes to Home tab.
                            },
                          ),
                        ),
                        
                        // Title
                        Text(
                          'Kursus',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        
                        // Profile Image
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                              image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDSfkQNM5-NfeX03rXaEYuujN-TdYlnKan7Rke20o_nFQeTPNI8-ouNpJaigcefGqy5AQE0lIFbcBeDa1CJCBDv8EzZ6LIAK-ylMkBJuW1J5VMgK-9Vsr--W8YGkaZBjOLE5dewDC31fygTf09EuDfFpmTxattp62I7eT5vKcG2dxGvKX82mJVm2DOQfqAdYQUBMM4aitpDcUtiCds6HYBlxKlzTiK_1Uy1EkWvbIIztIi5VWsQG8HU117jNkjFxbkBXLpgWqaUjyrp'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Search Bar
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: surfaceLight,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari kursus...',
                          hintStyle: GoogleFonts.poppins(color: subtextLight, fontSize: 14),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)), // gray-400
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Scrollable Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: backgroundLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32), // rounded-t-[2rem]
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 100), // pb-24 = 96px
                    children: [
                      // Filters
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('Terpopuler', true, primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Terbaru', false, primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Pemula', false, primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Menengah', false, primaryColor),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Course List
                      Column(
                        children: [
                          _buildCourseCard(
                            title: 'Desain Web Dasar',
                            description: 'Pelajari dasar-dasar HTML dan CSS untuk membuat website responsif.',
                            lessons: '20 Materi',
                            duration: '5 Jam 20 Menit',
                            icon: Icons.desktop_mac,
                            iconBg: const Color(0xFFDBEAFE), // blue-100
                            iconColor: const Color(0xFF3B82F6), // blue-500
                          ),
                          const SizedBox(height: 16),
                          _buildCourseCard(
                            title: 'Pemasaran Digital',
                            description: 'Strategi pemasaran online efektif untuk meningkatkan penjualan bisnis.',
                            lessons: '15 Materi',
                            duration: '4 Jam 10 Menit',
                            icon: Icons.campaign,
                            iconBg: const Color(0xFFFFEDD5), // orange-100
                            iconColor: const Color(0xFFF97316), // orange-500
                          ),
                          const SizedBox(height: 16),
                          _buildCourseCard(
                            title: 'UX/UI Pemula',
                            description: 'Pengenalan prinsip desain antarmuka dan pengalaman pengguna.',
                            lessons: '18 Materi',
                            duration: '6 Jam 45 Menit',
                            icon: Icons.brush,
                            iconBg: const Color(0xFFCFFAFE), // cyan-100
                            iconColor: const Color(0xFF06B6D4), // cyan-500
                          ),
                          const SizedBox(height: 16),
                          _buildCourseCard(
                            title: 'Data Science Dasar',
                            description: 'Memahami konsep dasar data science dan analisis data sederhana.',
                            lessons: '25 Materi',
                            duration: '8 Jam 30 Menit',
                            icon: Icons.analytics,
                            iconBg: const Color(0xFFF3E8FF), // purple-100
                            iconColor: const Color(0xFFA855F7), // purple-500
                          ),
                          const SizedBox(height: 16),
                          _buildCourseCard(
                            title: 'Python Programming',
                            description: 'Belajar bahasa pemrograman Python dari nol sampai mahir.',
                            lessons: '30 Materi',
                            duration: '10 Jam 15 Menit',
                            icon: Icons.code,
                            iconBg: const Color(0xFFE0E7FF), // indigo-100
                            iconColor: const Color(0xFF6366F1), // indigo-500
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor.withValues(alpha: 0.1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.transparent), // No border in design
        boxShadow: isSelected ? [] : [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: isSelected ? primaryColor : const Color(0xFF9CA3AF),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String description,
    required String lessons,
    required String duration,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF9CA3AF),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.play_circle_outline, size: 14, color: Color(0xFFE91E63)),
                        const SizedBox(width: 4),
                        Text(
                          lessons,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.schedule, size: 14, color: Color(0xFFE91E63)),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
