import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PythonLearningPage extends StatefulWidget {
  const PythonLearningPage({super.key});

  @override
  State<PythonLearningPage> createState() => _PythonLearningPageState();
}

class _PythonLearningPageState extends State<PythonLearningPage> {
  final TEXT_COLOR = const Color(0xFF0f172a); // slate-900
  final PRIMARY_COLOR = const Color(0xFFec1313); // primary red
  final BACKGROUND_LIGHT = const Color(0xFFf8f6f6);

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://www.youtube.com/watch?v=kqtD5dpn9C8');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Python Programming',
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
                          'https://img.youtube.com/vi/kqtD5dpn9C8/maxresdefault.jpg',
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
                                  'LESSON 3 OF 12',
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
                                '03. Variables & Data Types',
                                style: GoogleFonts.lexend(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: TEXT_COLOR,
                                  height: 1.2
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Understanding strings, integers, and floats in Python. Learn how to store and manipulate data efficiently.',
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
                 child: Row(
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
                             'My Notes',
                             style: GoogleFonts.lexend(
                               fontSize: 14,
                               fontWeight: FontWeight.bold,
                               color: TEXT_COLOR,
                             ),
                           ),
                           Text(
                             'Tap to add personal notes for this lesson',
                             style: GoogleFonts.lexend(
                               fontSize: 12,
                               color: Colors.grey[500], // slate-500
                             ),
                           ),
                         ],
                       ),
                     ),
                     Icon(Icons.chevron_right, color: Colors.grey[400]),
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
                     "Module 1: Introduction", 
                     "3 Lessons • 15 mins",
                     [
                       _buildLessonRow("01. Welcome to Python", "4:20", true),
                       _buildLessonRow("02. Setting up Environment", "10:45", true),
                     ]
                   ),
                   const SizedBox(height: 16),
                   _buildInProgressModule(
                     "Module 2: Basics", 
                     "4 Lessons • 45 mins",
                      [
                        _buildPlayingLessonRow("03. Variables & Data Types", "12:30"),
                        _buildLessonRow("04. Lists and Tuples", "15:00", false, isLocked: false, isOpen: true),
                        _buildLessonRow("05. Dictionaries", "08:45", false, isLocked: false, isOpen: true),
                      ]
                   ),
                   const SizedBox(height: 16),
                   _buildLockedModule("Module 3: Control Flow", "5 Lessons • 1h 10m"),
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
           Navigator.popUntil(context, (route) => route.isFirst);
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

  Widget _buildCompletedModule(String title, String subtitle, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: const Border(), // Remove default border
          tilePadding: const EdgeInsets.all(16),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Text("COMPLETED", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green)),
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
               child: Column(children: children)
             )
          ],
        ),
      ),
    );
  }

  Widget _buildInProgressModule(String title, String subtitle, List<Widget> children) {
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
                  Text("IN PROGRESS", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_COLOR)),
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
          children: children,
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
                    Text("LOCKED", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
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
                   "Complete previous modules to unlock", 
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

  Widget _buildLessonRow(String title, String duration, bool isCompleted, {bool isLocked = true, bool isOpen = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
           if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green, size: 20)
           else if (isOpen)
              CircleAvatar(
                radius: 12, 
                backgroundColor: Colors.grey[100], 
                child: Text("0${title.substring(0,1)}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey))
              ) // Simplified number logic for demo
           else
              CircleAvatar(
                radius: 12, 
                backgroundColor: Colors.grey[100], 
                child: Text("0${title.substring(0,1)}", style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey))
              ),
              
           const SizedBox(width: 12),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   title, 
                   style: GoogleFonts.lexend(
                     fontSize: 14, 
                     fontWeight: FontWeight.w500, 
                     color: Colors.grey[700]
                   )
                 ),
                 Text(duration, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
               ],
             )
           ),
           if (isOpen)
             Icon(Icons.lock_open, size: 20, color: Colors.grey[300]),
        ],
      ),
    );
  }
  
  Widget _buildPlayingLessonRow(String title, String duration) {
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
                   title, 
                   style: GoogleFonts.lexend(
                     fontSize: 14, 
                     fontWeight: FontWeight.bold, 
                     color: PRIMARY_COLOR
                   )
                 ),
                 RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(text: "$duration • ", style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                       TextSpan(text: "Playing", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: PRIMARY_COLOR)),
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
