import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataScienceLearningPage extends StatefulWidget {
  const DataScienceLearningPage({super.key});

  @override
  State<DataScienceLearningPage> createState() => _DataScienceLearningPageState();
}

class _DataScienceLearningPageState extends State<DataScienceLearningPage> {
  final TEXT_COLOR = const Color(0xFF1b0d0d);
  final PRIMARY_COLOR = const Color(0xFFec1313);

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://www.youtube.com/watch?v=-ETQ97mXXF0');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  // Notes Logic
  final TextEditingController _noteController = TextEditingController();
  final String _noteKey = 'note_datascience_modul1';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: TEXT_COLOR),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'Data Science Dasar',
          style: GoogleFonts.lexend(
            color: TEXT_COLOR,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.bookmark_border, color: TEXT_COLOR),
                onPressed: () {},
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[200],
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player Section
            GestureDetector(
              onTap: _launchUrl,
              child: Container(
                width: double.infinity,
                height: 220,
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      'https://img.youtube.com/vi/-ETQ97mXXF0/maxresdefault.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(color: Colors.black);
                      },
                    ),
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 64,
                    ),
                  ],
                ),
              ),
            ),

            // Lesson Title & Description
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Modul 1: Apa itu Data Science?',
                    style: GoogleFonts.lexend(
                      color: TEXT_COLOR,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Memahami konsep dasar, workflow, dan peluang karir di bidang data di era digital saat ini.',
                    style: GoogleFonts.lexend(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Note Taking Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                      boxShadow: [
                         BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                         )
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                              Row(
                                children: [
                                  Icon(Icons.edit_note, color: PRIMARY_COLOR, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Catatan Pelajaran',
                                    style: GoogleFonts.lexend(
                                      color: TEXT_COLOR,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: _saveNote, 
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0,0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text('Simpan', style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_COLOR))
                              )
                           ],
                         ),
                         const SizedBox(height: 12),
                         TextField(
                           controller: _noteController,
                           maxLines: 3,
                           decoration: InputDecoration(
                             hintText: 'Tulis poin penting dari video ini...',
                             hintStyle: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 14),
                             filled: true,
                             fillColor: Colors.grey[50],
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8),
                               borderSide: BorderSide.none,
                             ),
                             contentPadding: const EdgeInsets.all(12),
                           ),
                           style: GoogleFonts.lexend(fontSize: 14, color: TEXT_COLOR),
                         ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Tandai Selesai Button
                  ElevatedButton(
                    onPressed: () {
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Pelajaran ditandai sebagai selesai!')),
                       );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      shadowColor: PRIMARY_COLOR.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Tandai Selesai',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Modules Header
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Row(
                 children: [
                   Icon(Icons.toc, color: PRIMARY_COLOR),
                   const SizedBox(width: 8),
                   Text(
                      'Daftar Modul',
                      style: GoogleFonts.lexend(
                        color: TEXT_COLOR,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                   ),
                 ],
               ),
            ),
            
            const SizedBox(height: 12),
            
            // Module List
             _buildModuleItem(
               title: 'Pengenalan Kursus', 
               metadata: '04:20 • Selesai', 
               state: LessonState.completed
            ),
             _buildModuleItem(
               title: 'Modul 1: Apa itu Data Science?', 
               metadata: '10:05 • Sedang diputar', 
               state: LessonState.playing
            ),
             _buildModuleItem(
               title: 'Statistik Dasar untuk Data', 
               metadata: '15:30 mnt', 
               state: LessonState.open,
               order: '02'
            ),
             _buildModuleItem(
               title: 'Machine Learning 101', 
               metadata: '22:15 mnt', 
               state: LessonState.locked
            ),
             _buildModuleItem(
               title: 'Pengenalan Deep Learning', 
               metadata: '18:45 mnt', 
               state: LessonState.locked
            ),
            
             const SizedBox(height: 48),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 'Kursus' selected
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold, fontSize: 10),
        unselectedLabelStyle: GoogleFonts.lexend(fontWeight: FontWeight.w500, fontSize: 10),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            activeIcon: Icon(Icons.school, color: Color(0xFFec1313)),
            label: 'Kursus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
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
    );
  }

  Widget _buildModuleItem({required String title, required String metadata, required LessonState state, String? order}) {
     
     Color bgColor = Colors.transparent;
     Color borderColor = Colors.transparent;
     
     if (state == LessonState.playing) {
       // Playing
       bgColor = Colors.white; // Or gradient equivalent? HTML uses bg-white with border-primary/30
       borderColor = PRIMARY_COLOR.withOpacity(0.3);
     } else if (state == LessonState.locked) {
       bgColor = Colors.grey[50]!;
     } else {
       bgColor = Colors.white;
     }

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
           boxShadow: state == LessonState.playing ? [
             BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: Offset(0,2))
           ] : null
        ),
        child: Opacity(
          opacity: state == LessonState.locked ? 0.7 : 1.0,
          child: Row(
            children: [
              // Icon
              if (state == LessonState.completed)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, size: 20, color: Colors.green[600]),
                )
             else if (state == LessonState.playing)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: PRIMARY_COLOR.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.play_arrow, size: 20, color: PRIMARY_COLOR),
                    ),
                  ],
                )
             else if (state == LessonState.open)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                     child: Text(
                        order ?? '01',
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400]
                        ),
                     ),
                  ),
                )
             else
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.lock, size: 18, color: Colors.grey),
                ),
                
              const SizedBox(width: 16),
              
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                        color: state == LessonState.completed || state == LessonState.locked ? Colors.grey[500] : TEXT_COLOR,
                        fontSize: 14,
                        fontWeight: state == LessonState.playing ? FontWeight.bold : FontWeight.w600,
                        decoration: state == LessonState.completed ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.grey[400],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                        metadata,
                        style: GoogleFonts.lexend(
                          color: state == LessonState.playing ? PRIMARY_COLOR : Colors.grey[400],
                          fontSize: 12,
                          fontWeight: state == LessonState.playing ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                  ],
                ),
              ),
              
              if (state == LessonState.playing)
                 SizedBox(
                   width: 24,
                   height: 12,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(width: 3, height: 12, color: PRIMARY_COLOR),
                       Container(width: 3, height: 8, color: PRIMARY_COLOR),
                       Container(width: 3, height: 6, color: PRIMARY_COLOR),
                     ],
                   ),
                 )
              else if (state == LessonState.open)
                 const Icon(Icons.lock_open, size: 20, color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}

enum LessonState {
  completed,
  playing,
  open,
  locked
}
