import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLearningPage extends StatefulWidget {
  const PythonLearningPage({super.key});

  @override
  State<PythonLearningPage> createState() => _PythonLearningPageState();
}

class _PythonLearningPageState extends State<PythonLearningPage> {
  final TEXT_COLOR = const Color(0xFF0f172a); // slate-900
  final PRIMARY_COLOR = const Color(0xFFec1313); // primary red
  final BACKGROUND_LIGHT = const Color(0xFFf8f6f6);

  // Lesson Data
  final List<Map<String, dynamic>> _lessons = [
    {
      'id': 1,
      'title': '01. Selamat Datang di Python',
      'duration': '4:20',
      'videoId': '_uQrJ0TkZlc', // Python intro
      'module': 'Modul 1: Pengenalan',
      'isCompleted': true,
      'isLocked': false
    },
    {
      'id': 2,
      'title': '02. Menyiapkan Lingkungan',
      'duration': '10:45',
      'videoId': 'YYXdXT2l-Gg', // Python Setup
      'module': 'Modul 1: Pengenalan',
      'isCompleted': true,
      'isLocked': false
    },
    {
      'id': 3,
      'title': '03. Variabel & Tipe Data',
      'duration': '12:30',
      'videoId': 'kqtD5dpn9C8', // Variables
      'module': 'Modul 2: Dasar-dasar',
      'isCompleted': false,
      'isLocked': false,
      'desc': 'Memahami string, integer, dan float dalam Python. Belajar cara menyimpan dan memanipulasi data secara efisien.'
    },
    {
      'id': 4,
      'title': '04. List dan Tuple',
      'duration': '15:00',
      'videoId': 'PNptpf1r0Kw', // Lists
      'module': 'Modul 2: Dasar-dasar',
      'isCompleted': false,
      'isLocked': false
    },
    {
      'id': 5,
      'title': '05. Dictionary',
      'duration': '08:45',
      'videoId': 'daefaZLgOww', // Dictionaries
      'module': 'Modul 2: Dasar-dasar',
      'isCompleted': false,
      'isLocked': false
    },
  ];

  late int _currentLessonId;
  late String _currentVideoId;

  // Notes Logic
  final TextEditingController _noteController = TextEditingController();
  late String _noteKey;

  @override
  void initState() {
    super.initState();
    _currentLessonId = 3; // Default to lesson 3
    _updateCurrentLessonInfo();
    _loadNote();
  }

  void _updateCurrentLessonInfo() {
    final lesson = _lessons.firstWhere((l) => l['id'] == _currentLessonId);
    _currentVideoId = lesson['videoId'];
    _noteKey = 'note_python_lesson$_currentLessonId';
    _loadNote(); // Reload notes for the new lesson
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://www.youtube.com/watch?v=$_currentVideoId');
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
       if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch video')),
        );
       }
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

  void _onLessonTap(int id) {
    setState(() {
      _currentLessonId = id;
      _updateCurrentLessonInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLesson = _lessons.firstWhere((l) => l['id'] == _currentLessonId);

    return Scaffold(
      backgroundColor: BACKGROUND_LIGHT,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: TEXT_COLOR),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'Pemrograman Python',
          style: GoogleFonts.lexend(
            color: TEXT_COLOR,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             // Sticky Video Player Header
             Container(
               color: BACKGROUND_LIGHT,
                child: GestureDetector(
                  onTap: _launchUrl,
                  child: Container(
                    width: double.infinity,
                    height: 220,
                    color: const Color(0xFF0f172a), // slate-900
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          'https://img.youtube.com/vi/$_currentVideoId/maxresdefault.jpg',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(color: const Color(0xFF0f172a));
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
             ),
             
             // Lesson Info
             Container(
               color: BACKGROUND_LIGHT,
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'PELAJARAN $_currentLessonId DARI ${_lessons.length}',
                                  style: GoogleFonts.lexend(
                                    fontSize: 10, 
                                    fontWeight: FontWeight.bold,
                                    color: PRIMARY_COLOR,
                                    letterSpacing: 0.5
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currentLesson['title'],
                                style: GoogleFonts.lexend(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: TEXT_COLOR,
                                  height: 1.2
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                currentLesson['desc'] ?? 'Pelajari lebih lanjut tentang topik ini dalam video pembelajaran.',
                                style: GoogleFonts.lexend(
                                  fontSize: 14,
                                  color: Colors.grey[600], // slate-600
                                  height: 1.5
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border, size: 28), 
                          color: Colors.grey[400],
                          onPressed: () {},
                        )
                      ],
                    )
                 ],
               ),
             ),
             
             // My Notes
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
               child: Container(
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
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             color: PRIMARY_COLOR.withOpacity(0.1),
                             borderRadius: BorderRadius.circular(8),
                           ),
                           child: Icon(Icons.edit_note, color: PRIMARY_COLOR, size: 24),
                         ),
                         const SizedBox(width: 12),
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Catatan Saya',
                                 style: GoogleFonts.lexend(
                                   fontSize: 14,
                                   fontWeight: FontWeight.bold,
                                   color: TEXT_COLOR,
                                 ),
                               ),
                               Text(
                                 'Catatan disimpan secara lokal',
                                 style: GoogleFonts.lexend(
                                   fontSize: 12,
                                   color: Colors.grey[500], // slate-500
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
                       maxLines: 5,
                       decoration: InputDecoration(
                         hintText: 'Tulis catatan Anda di sini...',
                         filled: true,
                         fillColor: Colors.grey[50],
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(8),
                           borderSide: BorderSide.none,
                         ),
                       ),
                       style: GoogleFonts.lexend(fontSize: 13),
                     ),
                     const SizedBox(height: 12),
                     Align(
                       alignment: Alignment.centerRight,
                       child: ElevatedButton.icon(
                         onPressed: _saveNote,
                         icon: const Icon(Icons.save, size: 16),
                         label: Text('Simpan', style: GoogleFonts.lexend()),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: PRIMARY_COLOR,
                           foregroundColor: Colors.white,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             
             const SizedBox(height: 24),
             
             // Module List
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: Column(
                 children: [
                   _buildCompletedModule(
                     "Modul 1: Pengenalan", 
                     "2 Pelajaran • 15 mnt",
                     _lessons.where((l) => l['module'] == 'Modul 1: Pengenalan').toList()
                   ),
                   const SizedBox(height: 16),
                   _buildInProgressModule(
                     "Modul 2: Dasar-dasar", 
                     "3 Pelajaran • 45 mnt",
                      _lessons.where((l) => l['module'] == 'Modul 2: Dasar-dasar').toList()
                   ),
                   const SizedBox(height: 16),
                   _buildLockedModule("Modul 3: Alur Kontrol", "5 Pelajaran • 1 jam 10 mnt"),
                 ],
               ),
             ),
             
             const SizedBox(height: 48),
           ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[100]!)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, -4),
            )
          ]
        ),
        padding: const EdgeInsets.only(top: 12, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, "Beranda", false),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                 _buildNavItem(Icons.school, "Kursus", true),
                 Positioned(
                   top: -16,
                   child: Container(
                     width: 40,
                     height: 4,
                     decoration: BoxDecoration(
                       color: PRIMARY_COLOR,
                       borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4))
                     ),
                   ),
                 )
              ],
            ),
            _buildNavItem(Icons.person, "Profil", false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
     return GestureDetector(
        onTap: () {
          if (label == 'Beranda') {
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 0)),
              (route) => false,
            );
          } else if (label == 'Kursus') {
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 1)),
              (route) => false,
            );
          } else if (label == 'Profil') {
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(initialIndex: 2)),
              (route) => false,
            );
          }
        },
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Icon(icon, color: isActive ? PRIMARY_COLOR : Colors.grey[400], size: 24),
           const SizedBox(height: 4),
           Text(
             label,
             style: GoogleFonts.lexend(
               fontSize: 10,
               fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
               color: isActive ? PRIMARY_COLOR : Colors.grey[400]
             ),
           )
         ],
       ),
     );
  }

  Widget _buildCompletedModule(String title, String subtitle, List<Map<String, dynamic>> lessons) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: const Border(),
          tilePadding: const EdgeInsets.all(16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Text("SELESAI", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title, 
                style: GoogleFonts.lexend(
                  fontSize: 16, 
                  fontWeight: FontWeight.w600, 
                  color: TEXT_COLOR
                )
              ),
            ],
          ),
          subtitle: Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
          children: [
             Container(
               color: const Color(0xFFf8fafc), // slate-50
               child: Column(
                 children: lessons.map((l) => _buildLessonRow(l)).toList(),
               )
             )
          ],
        ),
      ),
    );
  }

  Widget _buildInProgressModule(String title, String subtitle, List<Map<String, dynamic>> lessons) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: PRIMARY_COLOR, width: 4)),
        boxShadow: [
          BoxShadow(
             color: Colors.black.withOpacity(0.1),
             blurRadius: 4,
             offset: const Offset(0, 2)
          )
        ]
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          shape: const Border(),
          tilePadding: const EdgeInsets.all(16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.play_circle_filled, size: 14, color: PRIMARY_COLOR),
                  const SizedBox(width: 4),
                  Text("SEDANG BERJALAN", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_COLOR)),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                title, 
                style: GoogleFonts.lexend(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  color: TEXT_COLOR
                )
              ),
            ],
          ),
          subtitle: Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
          children: lessons.map((l) {
            if (l['id'] == _currentLessonId) {
              return _buildPlayingLessonRow(l);
            }
            return _buildLessonRow(l);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildLockedModule(String title, String subtitle) {
     return Opacity(
       opacity: 0.75,
       child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[100]!),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            shape: const Border(),
            tilePadding: const EdgeInsets.all(16),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("TERKUNCI", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title, 
                  style: GoogleFonts.lexend(
                    fontSize: 16, 
                    fontWeight: FontWeight.w600, 
                    color: Colors.grey[700]
                  )
                ),
              ],
            ),
            subtitle: Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
            children: [
               Container(
                 padding: const EdgeInsets.all(16),
                 width: double.infinity,
                 color: const Color(0xFFf8fafc),
                 child: Text(
                   "Selesaikan modul sebelumnya untuk membuka", 
                   textAlign: TextAlign.center,
                   style: GoogleFonts.lexend(fontSize: 14, color: Colors.grey[500], fontStyle: FontStyle.italic)
                 ),
               )
            ],
          ),
        ),
           ),
     );
  }

  Widget _buildLessonRow(Map<String, dynamic> lesson) {
    bool isCompleted = lesson['isCompleted'] ?? false;
    bool isOpen = !isCompleted; 

    return InkWell(
      onTap: () => _onLessonTap(lesson['id']),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
             if (isCompleted)
                const Icon(Icons.check_circle, color: Colors.green, size: 20)
             else
                CircleAvatar(
                  radius: 12, 
                  backgroundColor: Colors.grey[100], 
                  child: Text("0${lesson['title'].substring(0,1)}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey))
                ),
             
             const SizedBox(width: 12),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     lesson['title'], 
                     style: GoogleFonts.lexend(
                       fontSize: 14, 
                       fontWeight: FontWeight.w500, 
                       color: Colors.grey[700]
                     )
                   ),
                   Text(lesson['duration'], style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                 ],
               )
             ),
             if (isOpen)
               Icon(Icons.play_circle_outline, size: 20, color: Colors.grey[400])
             else if (isCompleted)
               Icon(Icons.check, size: 20, color: Colors.green.withOpacity(0.5))
          ],
        ),
      ),
    );
  }
  
  Widget _buildPlayingLessonRow(Map<String, dynamic> lesson) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
         color: PRIMARY_COLOR.withOpacity(0.05),
         border: Border(left: BorderSide(color: PRIMARY_COLOR, width: 2))
      ),
      child: Row(
        children: [
           Container(
             width: 24, 
             height: 24, 
             decoration: BoxDecoration(color: PRIMARY_COLOR, shape: BoxShape.circle),
             child: const Icon(Icons.equalizer, color: Colors.white, size: 14),
           ),
           const SizedBox(width: 12),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   lesson['title'], 
                   style: GoogleFonts.lexend(
                     fontSize: 14, 
                     fontWeight: FontWeight.bold, 
                     color: PRIMARY_COLOR
                   )
                 ),
                 RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(text: "${lesson['duration']} • ", style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                       TextSpan(text: "Sedang Diputar", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_COLOR)),
                     ]
                   )
                 )
               ],
             )
           ),
           Icon(Icons.play_arrow, color: PRIMARY_COLOR),
        ],
      ),
    );
  }
}
