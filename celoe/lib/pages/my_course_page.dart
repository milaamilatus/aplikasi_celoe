import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCoursePage extends StatefulWidget {
  // Optional: If passed, we show this specific course as "Just Accessed" or filter by it.
  // For now, we'll display a list, but if a specific title is passed, we could highlight it.
  final String? courseTitle; 

  const MyCoursePage({super.key, this.courseTitle});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = ['Semua', 'Sedang Berjalan', 'Selesai'];

  // Dummy data for "My Courses"
  // If widget.courseTitle is not null, we could ideally ensure that course is in this list.
  final List<Map<String, dynamic>> _myCourses = [
    {
      'title': 'Desain Web Dasar',
      'author': 'Sarah Jenkins',
      'progress': 0.75,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCK40ZQBJWUTx1WiilvM8CpEzGiFuvwUCuG9VDVK-5fg4OvYNIphci8rfMnQt93CyuxvFbqYGjf5yuUodmp-Sl69avesvsldGJVjqXHjg1t18ZmV000LT-V_heEsNuBzH8_L8b1YC-OAWNuXO9gTZrHiOM4dhD8fctlmPLn99VLNItgOV_S5k59lxyqXswWKRf4SZTuMZzJkAGWLV39CCQjmlLA6PP0i5ejUKGmOV8v4miIQ8InfO8xqQlPz-3WA8kJy5Nqcgs0NJB0',
      'status': 'In Progress'
    },
    {
      'title': 'Pemasaran Digital',
      'author': 'Mark Alvert',
      'progress': 0.30,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDHxPhFWw3YqtY3cZdK7kRVP2nlFKcYWvx7HX3l7Fn2cbZhPaQ8sjCbIlHYfkY-___3oSKanwW1D6a2V5qWnenHkE9GAKvwazOe3iTe08flULdU5hXDekeReLVV5DTjBwgMc3Gh-zLhicpQtDRkdbMHNPDNuc0RMHJpenie1lyjNhIyygbCG34qkSKItF6TmIvUHbmZuDu2piR9hwykbqfHqknBa1vLfTOeb8EDTvusP_eJAnVAVlV0UdpG8NHY-GugJB_xeSei-DBC',
      'status': 'In Progress'
    },
    {
      'title': 'UX/UI Pemula',
      'author': 'Emily Chen',
      'progress': 0.10,
      'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuA2FjdWuNRc5cgzbk3XNI8QJIqu3nI_3hISJBMH8a5DFrA8BvOtMJ1NdASbnh8nKMEPyWzXSoeWeod5U0d_5AnPtDyvB3gmvzLHlJIWi3ucVJxiPzOueS8APqDSmcBDGpTmKh7sQYblZR452t5kHpRtm54Lyna3g06yU2IIDXUMPa8Z1ey5Og1Cg-gVojv718DvafyapGW6gCZD3jhHHqqx-OjCGH5oiLJeaud4NKiXetCdGS9F3Grvk4J1r-BXgL0VVw6qaihzZFt9',
      'status': 'In Progress' // or start
    },
  ];

  @override
  void initState() {
    super.initState();
    // If a specific course was clicked, and it's not in our dummy list, we could add it dynamically here.
    if (widget.courseTitle != null) {
      bool exists = _myCourses.any((c) => c['title'] == widget.courseTitle);
      if (!exists) {
        _myCourses.insert(0, {
          'title': widget.courseTitle,
          'author': 'Instruktur', // Placeholder as we might not have author from simple click
          'progress': 0.0,
          'image': 'https://img.freepik.com/free-vector/online-learning-concept_23-2148533319.jpg', // Placeholder
          'status': 'In Progress'
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
     const Color primaryColor = Color(0xFFE91E63); // Changed to Red/Pink to match app theme
     const Color backgroundLight = Color(0xFFF6F7F8); 
     const Color surfaceWhite = Colors.white;

    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: AppBar(
        backgroundColor: backgroundLight.withOpacity(0.95),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Kursus Saya',
          style: GoogleFonts.lexend( // Using Lexend as per HTML
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!),
                image: const DecorationImage(
                  image: NetworkImage('https://img.freepik.com/premium-photo/portrait-young-business-woman-looking-camera-smile-white-wall_33799-8833.jpg'), // Fixed Female Avatar
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: List.generate(_filters.length, (index) {
                final isSelected = _selectedFilterIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFilterIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : surfaceWhite,
                        borderRadius: BorderRadius.circular(30),
                        border: isSelected ? null : Border.all(color: Colors.grey[300]!),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.2),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                )
                              ]
                            : null,
                      ),
                      child: Text(
                        _filters[index],
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          
          // Course List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _myCourses.length,
              itemBuilder: (context, index) {
                final course = _myCourses[index];
                return _buildCourseCard(course, primaryColor);
              },
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar is NOT needed here as this is a sub-page (pushed on stack),
      // OR if user wants it to look like a main tab, we might just keep the back button.
      // The HTML shows a bottom nav, but usually "My Course" from Profile is a sub-screen. 
      // If navigated from "Kursus" (Browse), it might be detail.
      // I'll keep it as a sub-page with Back button for now.
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course, Color primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  course['image'],
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title'],
                      style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Oleh ${course['author']}',
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Progress
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(course['progress'] * 100).toInt()}% Selesai',
                          style: GoogleFonts.lexend(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor, // Using primary color for text
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: course['progress'],
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Continue learning logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: primaryColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Lanjutkan Belajar',
                style: GoogleFonts.lexend(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
