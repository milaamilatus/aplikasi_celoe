import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_course_page.dart';
import 'course_overview_page.dart';
import 'digital_marketing_course_page.dart';
import 'ux_ui_course_page.dart';
import 'data_science_course_page.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  String _selectedCategory = 'Terpopuler';

  final List<Map<String, dynamic>> _allCourses = [
    {
      'title': 'Desain Web Dasar',
      'description': 'Pelajari dasar-dasar HTML dan CSS untuk membuat website responsif.',
      'lessons': '20 Materi',
      'duration': '5 Jam 20 Menit',
      'icon': Icons.desktop_mac,
      'iconBg': const Color(0xFFDBEAFE),
      'iconColor': const Color(0xFF3B82F6),
      'categories': ['Terpopuler', 'Pemula'],
    },
    {
      'title': 'Pemasaran Digital',
      'description': 'Strategi pemasaran online efektif untuk meningkatkan penjualan bisnis.',
      'lessons': '15 Materi',
      'duration': '4 Jam 10 Menit',
      'icon': Icons.campaign,
      'iconBg': const Color(0xFFFFEDD5),
      'iconColor': const Color(0xFFF97316),
      'categories': ['Terpopuler', 'Menengah'],
    },
    {
      'title': 'UX/UI Pemula',
      'description': 'Pengenalan prinsip desain antarmuka dan pengalaman pengguna.',
      'lessons': '18 Materi',
      'duration': '6 Jam 45 Menit',
      'icon': Icons.brush,
      'iconBg': const Color(0xFFCFFAFE),
      'iconColor': const Color(0xFF06B6D4),
      'categories': ['Terpopuler', 'Pemula', 'Terbaru'],
    },
    {
      'title': 'Data Science Dasar',
      'description': 'Memahami konsep dasar data science dan analisis data sederhana.',
      'lessons': '25 Materi',
      'duration': '8 Jam 30 Menit',
      'icon': Icons.analytics,
      'iconBg': const Color(0xFFF3E8FF),
      'iconColor': const Color(0xFFA855F7),
      'categories': ['Terpopuler', 'Menengah'],
    },
    {
      'title': 'Python Programming',
      'description': 'Belajar bahasa pemrograman Python dari nol sampai mahir.',
      'lessons': '30 Materi',
      'duration': '10 Jam 15 Menit',
      'icon': Icons.code,
      'iconBg': const Color(0xFFE0E7FF),
      'iconColor': const Color(0xFF6366F1),
      'categories': ['Terpopuler', 'Menengah', 'Terbaru'],
    },
    {
      'title': 'Flutter Masterclass',
      'description': 'Membangun aplikasi mobile cross-platform modern.',
      'lessons': '45 Materi',
      'duration': '15 Jam',
      'icon': Icons.phone_android,
      'iconBg': const Color(0xFFE0F2F1),
      'iconColor': const Color(0xFF009688),
      'categories': ['Terbaru', 'Menengah'],
    },
  ];

  List<Map<String, dynamic>> _getFilteredCourses() {
    return _allCourses.where((course) => (course['categories'] as List).contains(_selectedCategory)).toList();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFE91E63);
    const Color backgroundLight = Color(0xFFF3F4F6);
    const Color surfaceLight = Color(0xFFFFFFFF);
    const Color subtextLight = Color(0xFF9CA3AF);

    final courses = _getFilteredCourses();

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 192,
            child: Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Color(0xFFE91E63), size: 16),
                            onPressed: () {
                              if (Navigator.canPop(context)) Navigator.pop(context);
                            },
                          ),
                        ),
                        Text(
                          'Kursus',
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
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                              image: NetworkImage('https://img.freepik.com/premium-photo/portrait-young-business-woman-looking-camera-smile-white-wall_33799-8833.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: surfaceLight,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFE91E63).withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari kursus...',
                          hintStyle: GoogleFonts.poppins(color: subtextLight, fontSize: 14),
                          prefixIcon: const Icon(Icons.search, color: Color(0xFF9CA3AF)),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: backgroundLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 100),
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('Terpopuler', primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Terbaru', primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Pemula', primaryColor),
                            const SizedBox(width: 12),
                            _buildFilterChip('Menengah', primaryColor),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (courses.isEmpty)
                         Center(child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Text("Tidak ada kursus untuk kategori ini", style: GoogleFonts.poppins(color: Colors.grey)),
                         ))
                      else
                        ...courses.map((course) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              if (course['title'] == 'Desain Web Dasar') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CourseOverviewPage()),
                                );
                              } else if (course['title'] == 'Pemasaran Digital') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DigitalMarketingCoursePage()),
                                );
                              } else if (course['title'] == 'UX/UI Pemula') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const UxUiCoursePage()),
                                );
                              } else if (course['title'] == 'Data Science Dasar') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DataScienceCoursePage()),
                                );
                              }
                            },
                            child: _buildCourseCard(
                              title: course['title'],
                              description: course['description'],
                              lessons: course['lessons'],
                              duration: course['duration'],
                              icon: course['icon'],
                              iconBg: course['iconBg'],
                              iconColor: course['iconColor'],
                            ),
                          ),
                        )),
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

  Widget _buildFilterChip(String label, Color primaryColor) {
    bool isSelected = _selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: Colors.transparent),
          boxShadow: isSelected ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF333333),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFFE91E63),
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
