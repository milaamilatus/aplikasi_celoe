import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UxUiLearningPage extends StatefulWidget {
  const UxUiLearningPage({super.key});

  @override
  State<UxUiLearningPage> createState() => _UxUiLearningPageState();
}

class _UxUiLearningPageState extends State<UxUiLearningPage> {
  final TEXT_COLOR = const Color(0xFF1f2937); // neutral-800
  final PRIMARY_COLOR = const Color(0xFFec1313); // primary red

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://www.youtube.com/watch?v=c9Wg6Cb_YlU');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
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
              icon: Icon(Icons.arrow_back, color: TEXT_COLOR),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          'UX/UI Pemula',
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
                icon: Icon(Icons.more_vert, color: TEXT_COLOR),
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
                      'https://img.youtube.com/vi/c9Wg6Cb_YlU/maxresdefault.jpg',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(color: Colors.black);
                      },
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.4),
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
                    'MODULE 1 • LESSON 2',
                    style: GoogleFonts.lexend(
                      color: PRIMARY_COLOR,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'What is User Experience?',
                    style: GoogleFonts.lexend(
                      color: TEXT_COLOR,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'In this lesson, we will cover the fundamental differences between UI and UX, and why understanding the user journey is crucial for product success.',
                    style: GoogleFonts.lexend(
                      color: Colors.grey[600], // neutral-500
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Take Notes
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red[100]!),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.edit_note,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Take Notes',
                                style: GoogleFonts.lexend(
                                  color: TEXT_COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Add a note at current time',
                                style: GoogleFonts.lexend(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.add_circle, color: PRIMARY_COLOR),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Lesson Materials
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FAFB), // neutral-50
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.folder_open,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lesson Materials',
                                style: GoogleFonts.lexend(
                                  color: TEXT_COLOR,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Slides & exercise files',
                                style: GoogleFonts.lexend(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Icon(Icons.download, color: PRIMARY_COLOR, size: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Divider(color: Colors.grey[100], thickness: 8),
            const SizedBox(height: 16),

            // Course Content Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Course Content',
                    style: GoogleFonts.lexend(
                      color: TEXT_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '2/12 Completed',
                    style: GoogleFonts.lexend(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Modules
            _buildModuleHeader('Module 1: Foundations', true),
            _buildLessonItem(
              '01. Introduction to the Course',
              '5 mins',
              LessonState.completed,
              false,
            ),
            _buildLessonItem(
              '02. What is User Experience?',
              '12 mins',
              LessonState.playing,
              true,
            ),
            _buildLessonItem(
              '03. Design Thinking Process',
              '18 mins',
              LessonState.locked,
              false,
            ),
             _buildLessonItem(
              '04. Understanding Users',
              '15 mins',
              LessonState.locked,
              false,
            ),
            
            _buildModuleHeader('Module 2: Visual Design', false),
            _buildModuleHeader('Module 3: Prototyping', false),
            
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
             Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
      ),
    );
  }

  Widget _buildModuleHeader(String title, bool isExpanded) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        border: Border(
           top: BorderSide(color: Colors.grey[100]!),
           bottom: BorderSide(color: isExpanded ? Colors.transparent : Colors.grey[100]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lexend(
              color: TEXT_COLOR,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            isExpanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem(String title, String duration, LessonState state, bool isActive) {
     final Color primaryColor = const Color(0xFFec1313);
     
     Color bgColor = Colors.white;
     if (isActive) {
       bgColor = Colors.red[50]!.withOpacity(0.5);
     }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(bottom: BorderSide(color: Colors.grey[100]!)),
      ),
      child: Row(
        children: [
          // Indicator Icon
          if (state == LessonState.completed)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, size: 16, color: Colors.green[600]),
            )
          else if (state == LessonState.playing)
             Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: primaryColor.withOpacity(0.3), blurRadius: 4, offset: Offset(0,2))
                ]
              ),
              child: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
            )
          else
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.lock, size: 14, color: Colors.grey),
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
                    color: state == LessonState.completed ? Colors.grey[400] : (isActive ? primaryColor : const Color(0xFF1f2937)),
                    fontSize: 14,
                    fontWeight: isActive || state == LessonState.playing ? FontWeight.bold : FontWeight.w500,
                    decoration: state == LessonState.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                   children: [
                     Text(
                        duration,
                        style: GoogleFonts.lexend(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                      if (state == LessonState.playing)
                        Text(
                          ' • Playing',
                          style: GoogleFonts.lexend(
                             color: primaryColor,
                             fontSize: 12,
                             fontWeight: FontWeight.bold,
                          ),
                        ),
                   ],
                )
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

enum LessonState {
  completed,
  playing,
  locked,
  open
}
