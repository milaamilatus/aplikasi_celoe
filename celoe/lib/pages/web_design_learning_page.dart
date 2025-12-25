import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebDesignLearningPage extends StatefulWidget {
  const WebDesignLearningPage({super.key});

  @override
  State<WebDesignLearningPage> createState() => _WebDesignLearningPageState();
}

class _WebDesignLearningPageState extends State<WebDesignLearningPage> {
  final TextEditingController _noteController = TextEditingController();
  final String _noteKey = 'note_web_design_lesson1';

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _loadNote() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _noteController.text = prefs.getString(_noteKey) ?? '';
    });
  }

  Future<void> _saveNote() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_noteKey, _noteController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Catatan tersimpan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFec1313);
    const Color textColor = Color(0xFF1b0d0d);
    const Color surfaceLight = Color(0xFFf3f4f6);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0, // Border bottom handled by widget
        shape: Border(bottom: BorderSide(color: Colors.grey[100]!)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Desain Web Dasar",
          style: GoogleFonts.lexend(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80), // Space for bottom nav
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://www.youtube.com/watch?v=UB1O30fR-EE');
                      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Could not launch video')),
                          );
                        }
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Placeholder for video content
                        Image.network(
                          'https://img.youtube.com/vi/UB1O30fR-EE/maxresdefault.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Icon(Icons.videocam_off, color: Colors.white, size: 48),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                             color: Colors.black.withOpacity(0.3),
                             borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                         const Icon(Icons.play_circle_fill, color: Colors.white, size: 64),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Lesson Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengenalan Struktur HTML",
                    style: GoogleFonts.lexend(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 16, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        "Pelajaran 1 • 12 mnt",
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Progress Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: surfaceLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Progres Kursus",
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          "35%",
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.35,
                        backgroundColor: Colors.grey[200],
                        color: primaryColor,
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "2 dari 12 pelajaran selesai",
                      style: GoogleFonts.lexend(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // My Notes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Catatan Saya",
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: textColor
                        ),
                      ),
                      Text(
                        "Lihat semua",
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: primaryColor
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.red[50],
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit_note, color: primaryColor, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tambah catatan",
                                    style: GoogleFonts.lexend(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  Text(
                                    "Catat hal penting dari pelajaran ini",
                                    style: GoogleFonts.lexend(
                                      fontSize: 12,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextField(
                           controller: _noteController,
                           maxLines: 4,
                           decoration: InputDecoration(
                             hintText: 'Tulis catatan Anda di sini...',
                             filled: true,
                             fillColor: Colors.grey[50], // surface-light
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8),
                               borderSide: BorderSide.none,
                             ),
                             contentPadding: const EdgeInsets.all(12),
                           ),
                           style: GoogleFonts.lexend(fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                             onPressed: _saveNote,
                             icon: const Icon(Icons.save, size: 16),
                             label: Text("Simpan", style: GoogleFonts.lexend(fontSize: 12)),
                             style: ElevatedButton.styleFrom(
                               backgroundColor: primaryColor,
                               foregroundColor: Colors.white,
                               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                               minimumSize: Size.zero,
                               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                             ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Modules
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Module 1
                   Padding(
                     padding: const EdgeInsets.only(left: 4, bottom: 12),
                     child: Text(
                        "MODUL 1: PENGENALAN WEB",
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.grey[400],
                        ),
                      ),
                   ),
                   _buildLessonItem(
                     icon: Icons.check_circle,
                     iconColor: Colors.green,
                     iconBgColor: Colors.green[50]!,
                     title: "Apa itu Internet?",
                     subtitle: "8 mnt",
                     isCompleted: true,
                   ),
                   const SizedBox(height: 12),
                   _buildLessonItem(
                     icon: Icons.play_arrow,
                     iconColor: Colors.white,
                     iconBgColor: primaryColor,
                     title: "Alat untuk Desain Web",
                     subtitle: "12 mnt • Sedang Diputar",
                     isActive: true,
                     primaryColor: primaryColor,
                   ),

                   const SizedBox(height: 24),

                   // Module 2
                   Padding(
                     padding: const EdgeInsets.only(left: 4, bottom: 12),
                     child: Text(
                        "MODUL 2: DASAR HTML",
                        style: GoogleFonts.lexend(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.grey[400],
                        ),
                      ),
                   ),
                   _buildLessonItem(
                     icon: Icons.lock,
                     iconColor: Colors.grey[400]!,
                     iconBgColor: Colors.grey[100]!,
                     title: "Tag dan Elemen",
                     subtitle: "15 mnt",
                     isLocked: true,
                   ),
                   const SizedBox(height: 12),
                   _buildLessonItem(
                     icon: Icons.lock,
                     iconColor: Colors.grey[400]!,
                     iconBgColor: Colors.grey[100]!,
                     title: "Struktur Halaman",
                     subtitle: "20 mnt",
                     isLocked: true,
                   ),
                   const SizedBox(height: 12),
                   _buildLessonItem(
                     icon: Icons.lock,
                     iconColor: Colors.grey[400]!,
                     iconBgColor: Colors.grey[100]!,
                     title: "Semantic HTML",
                     subtitle: "18 mnt",
                     isLocked: true,
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[100]!)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.w500),
          type: BottomNavigationBarType.fixed,
          currentIndex: 1, // 'Kursus' selected
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Kursus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profil',
            ),
          ],
          onTap: (index) {
             if (index == 0) {
               Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 0)),
                (route) => false,
              );
             } else if (index == 1) {
               Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 1)),
                (route) => false,
              );
             } else if (index == 2) {
               Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 2)),
                (route) => false,
              );
             }
          },
        ),
      ),
    );
  }

  Widget _buildLessonItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    bool isCompleted = false,
    bool isActive = false,
    bool isLocked = false,
    Color primaryColor = const Color(0xFFec1313),
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.red[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isActive ? Border.all(color: primaryColor.withOpacity(0.2)) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
              boxShadow: isActive ? [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ] : null,
              border: isLocked ? Border.all(color: Colors.grey[200]!) : null,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                    color: isActive ? primaryColor : (isCompleted || isLocked ? Colors.grey[500] : const Color(0xFF1b0d0d)),
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.lexend(
                    fontSize: 12,
                    color: isActive ? primaryColor.withOpacity(0.8) : Colors.grey[400],
                    fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          if (isActive)
            Icon(Icons.equalizer, color: primaryColor, size: 20),
        ],
      ),
    );
  }
}
