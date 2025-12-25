import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DigitalMarketingLearningPage extends StatefulWidget {
  const DigitalMarketingLearningPage({super.key});

  @override
  State<DigitalMarketingLearningPage> createState() => _DigitalMarketingLearningPageState();
}

class _DigitalMarketingLearningPageState extends State<DigitalMarketingLearningPage> {
  final TextEditingController _noteController = TextEditingController();
  late String _noteKey;
  
  // Lesson Data
  final List<Map<String, dynamic>> _lessons = [
    {
      'id': 1,
      'title': '1.1 Pengantar SEO',
      'duration': '12 min',
      'videoId': 'DvwS7cV9GmQ', // Intro SEO
      'isCompleted': false,
      'isLocked': false,
      'subtitle': 'Sedang diputar'
    },
    {
      'id': 2,
      'title': '1.2 Keyword Research',
      'duration': '10 min',
      'videoId': '0rjIJj6Wj_U', // Keyword Research
      'isCompleted': true,
      'isLocked': false,
      'subtitle': 'Selesai'
    },
    {
      'id': 3,
      'title': '1.3 On-Page Optimization',
      'duration': '15 min',
      'videoId': 'z_8A_-XyqD0', // On Page SEO
      'isCompleted': false,
      'isLocked': true,
      'subtitle': 'Terkunci'
    },
     {
      'id': 4,
      'title': '2.1 Intro to Instagram Ads',
      'duration': '8 min',
      'videoId': 'H2pL4_W_e4Q', // IG Ads
      'isCompleted': false,
      'isLocked': true,
      'subtitle': 'Terkunci'
    },
  ];

  late int _currentLessonId;
  late String _currentVideoId;

  @override
  void initState() {
    super.initState();
    _currentLessonId = 1;
    _updateCurrentLessonInfo();
    _loadNote();
  }

  void _updateCurrentLessonInfo() {
    final lesson = _lessons.firstWhere((l) => l['id'] == _currentLessonId);
    _currentVideoId = lesson['videoId'];
    _noteKey = 'note_digital_marketing_lesson$_currentLessonId';
    _loadNote();
  }
  
  void _onLessonTap(int id) {
    // Only allow tapping if not locked (simulate unlocking logic if needed, but for now simple check)
    final lesson = _lessons.firstWhere((l) => l['id'] == id);
    if (!lesson['isLocked']) {
      setState(() {
        _currentLessonId = id;
        _updateCurrentLessonInfo();
      });
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selesaikan pelajaran sebelumnya untuk membuka.')),
      );
    }
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
    
    final currentLesson = _lessons.firstWhere((l) => l['id'] == _currentLessonId);

    return Scaffold(
      backgroundColor: const Color(0xFFf8f6f6), // background-light
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8f6f6),
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey[200]!)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Pemasaran Digital",
          style: GoogleFonts.lexend(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
         padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            // Video Section
             Container(
               color: Colors.black,
               width: double.infinity,
               child: AspectRatio(
                 aspectRatio: 16 / 9,
                 child: GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://www.youtube.com/watch?v=$_currentVideoId');
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
                       Image.network(
                         'https://img.youtube.com/vi/$_currentVideoId/maxresdefault.jpg',
                         fit: BoxFit.cover,
                         width: double.infinity,
                         height: double.infinity,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Icon(Icons.videocam_off, color: Colors.white, size: 48),
                          ),
                       ),
                       Container(color: Colors.black.withOpacity(0.3)),
                       const Icon(Icons.play_arrow, color: Colors.white, size: 64),
                     ],
                   ),
                 ),
               ),
             ),

             // Content Section
             Container(
               padding: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "Modul 1 • Pelajaran $_currentLessonId",
                             style: GoogleFonts.lexend(
                               color: primaryColor,
                               fontSize: 12,
                               fontWeight: FontWeight.bold,
                               letterSpacing: 1.0,
                             ),
                           ),
                           const SizedBox(height: 4),
                           Text(
                             currentLesson['title'],
                             style: GoogleFonts.lexend(
                               color: textColor,
                               fontSize: 24,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),
                       IconButton(
                         onPressed: () {},
                         icon: const Icon(Icons.bookmark_add_outlined, color: Colors.grey),
                       ),
                     ],
                   ),
                   const SizedBox(height: 8),
                   Text(
                     "Dalam pelajaran ini, kita akan membahas dasar-dasar SEO dan mengapa hal itu penting untuk strategi pemasaran digital Anda.",
                     style: GoogleFonts.lexend(
                       color: Colors.grey[600],
                       fontSize: 14,
                       height: 1.5,
                     ),
                   ),
                   const SizedBox(height: 24),
                   
                   // Notes Section
                   Container(
                     padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                       border: Border.all(color: Colors.grey[200]!),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.05),
                           blurRadius: 4,
                           offset: const Offset(0, 2),
                         ),
                       ],
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               children: [
                                 Container(
                                   width: 24,
                                   height: 24,
                                   decoration: BoxDecoration(
                                     color: primaryColor.withOpacity(0.1),
                                     borderRadius: BorderRadius.circular(4),
                                   ),
                                   child: const Icon(Icons.edit_note, color: primaryColor, size: 16),
                                 ),
                                 const SizedBox(width: 8),
                                 Text(
                                   "Catatan Pelajaran",
                                   style: GoogleFonts.lexend(
                                     fontSize: 12,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.grey[700],
                                     letterSpacing: 0.5,
                                   ),
                                 ),
                               ],
                             ),
                             Container(
                               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                               decoration: BoxDecoration(
                                 color: Colors.grey[100],
                                 borderRadius: BorderRadius.circular(4),
                                 border: Border.all(color: Colors.grey[200]!),
                               ),
                               child: Text(
                                 "Pribadi",
                                 style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey[500], fontWeight: FontWeight.w500),
                               ),
                             ),
                           ],
                         ),
                         const SizedBox(height: 12),
                         TextField(
                           controller: _noteController,
                           maxLines: 4,
                           decoration: InputDecoration(
                             filled: true,
                             fillColor: const Color(0xFFF9FAFB),
                             hintText: "Tulis poin penting dari video ini...",
                             hintStyle: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 14),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8),
                               borderSide: BorderSide.none,
                             ),
                             contentPadding: const EdgeInsets.all(12),
                           ),
                           style: GoogleFonts.lexend(fontSize: 14),
                         ),
                         const SizedBox(height: 8),
                         Align(
                           alignment: Alignment.centerRight,
                           child: ElevatedButton.icon(
                             onPressed: _saveNote,
                             icon: const Icon(Icons.save, size: 14),
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
                   const SizedBox(height: 24),
                   SizedBox(
                     width: double.infinity,
                     child: ElevatedButton(
                       onPressed: () {
                           ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: Text('Pelajaran ditandai sebagai selesai!')),
                           );
                         },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: primaryColor,
                         foregroundColor: Colors.white,
                         padding: const EdgeInsets.symmetric(vertical: 16),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                         elevation: 4,
                         shadowColor: Colors.red.withOpacity(0.2),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Icon(Icons.check_circle, size: 20),
                           const SizedBox(width: 8),
                           Text("Tandai Selesai", style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold)),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ),

             // List Materi Section
             Container(
               color: const Color(0xFFF9FAFB), // bg-gray-50
               padding: const EdgeInsets.all(20),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Daftar Materi",
                         style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                       ),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.grey[200]!),
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child: Text(
                           "3/12 Selesai",
                           style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(height: 12),
                   
                   ..._lessons.take(3).map((l) => Padding(
                     padding: const EdgeInsets.only(bottom: 12),
                     child: _buildMaterialItem(
                       id: l['id'],
                       title: l['title'],
                       subtitle: l['id'] == _currentLessonId 
                          ? 'Sedang diputar • ${l['duration']}' 
                          : '${l['subtitle']} • ${l['duration']}',
                       isPlaying: l['id'] == _currentLessonId,
                       isDone: l['isCompleted'],
                       isLocked: l['isLocked'],
                       primaryColor: primaryColor,
                     ),
                   )),

                   const SizedBox(height: 20),
                   Padding(
                     padding: const EdgeInsets.only(left: 4),
                     child: Text(
                       "MODUL 2: SOCIAL MEDIA",
                       style: GoogleFonts.lexend(
                         fontSize: 12,
                         fontWeight: FontWeight.bold,
                         color: Colors.grey[500],
                         letterSpacing: 1.0,
                       ),
                     ),
                   ),
                   const SizedBox(height: 12),
                   ..._lessons.skip(3).map((l) => Padding(
                     padding: const EdgeInsets.only(bottom: 12),
                     child: _buildMaterialItem(
                       id: l['id'],
                       title: l['title'],
                       subtitle: '${l['subtitle']} • ${l['duration']}',
                       isPlaying: l['id'] == _currentLessonId,
                       isDone: l['isCompleted'],
                       isLocked: l['isLocked'],
                       primaryColor: primaryColor,
                     ),
                   )),
                 ],
               ),
             ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[200]!)), // border-gray-200
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.w500),
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
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

  Widget _buildMaterialItem({
    required int id,
    required String title,
    required String subtitle,
    bool isPlaying = false,
    bool isDone = false,
    bool isLocked = false,
    required Color primaryColor,
  }) {
    Color borderColor = Colors.grey[200]!;
    Color bgColor = Colors.white;
    Color iconBgColor = Colors.grey[100]!;
    Color iconColor = Colors.grey[400]!;
    IconData icon = Icons.lock;

    if (isPlaying) {
      borderColor = primaryColor.withOpacity(0.4);
      bgColor = Colors.white;
      iconBgColor = primaryColor;
      iconColor = Colors.white;
      icon = Icons.play_arrow;
    } else if (isDone) {
      bgColor = Colors.white;
      iconBgColor = Colors.green[50]!;
      iconColor = Colors.green[600]!;
      icon = Icons.check;
    } else if (isLocked) {
      bgColor = Colors.white.withOpacity(0.6); // Slightly faded
    }
    
    // Unlock icon logic if not locked and not playing/done
    if (!isLocked && !isPlaying && !isDone) {
        icon = Icons.play_circle_outline;
    }

    return GestureDetector(
      onTap: () => _onLessonTap(id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: isPlaying ? [
            BoxShadow(
              color: primaryColor.withOpacity(0.05),
              blurRadius: 4,
            )
          ] : null,
        ),
        child: Row(
          children: [
             // Decoration for playing item
             if (isPlaying)
             Container(
               width: 6,
               height: 40, // Height of content approx
               decoration:BoxDecoration(
                 color: primaryColor,
                 borderRadius: BorderRadius.circular(2),
               ),
               margin: const EdgeInsets.only(right: 12),
             ),
             
             Container(
               width: 40,
               height: 40,
               decoration: BoxDecoration(
                 color: iconBgColor,
                 shape: BoxShape.circle,
                 boxShadow: isPlaying ? [BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 8)] : null,
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
                       fontWeight: isPlaying ? FontWeight.bold : FontWeight.w500,
                       color: isLocked ? Colors.grey[500] : const Color(0xFF1b0d0d),
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                   ),
                   const SizedBox(height: 2),
                   Text(
                     subtitle,
                     style: GoogleFonts.lexend(
                       fontSize: 12,
                       color: isPlaying ? primaryColor : Colors.grey[400],
                       fontWeight: isPlaying ? FontWeight.w500 : FontWeight.normal,
                     ),
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
