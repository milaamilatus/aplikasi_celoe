import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PythonCoursePage extends StatelessWidget {
  const PythonCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFec1313);
    const Color textColor = Color(0xFF1b0d0d);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Course Details",
          style: GoogleFonts.lexend(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[100],
            height: 1.0,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Space for sticky bottom bar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDUrBQn2S4Pbk_nUJkNtXd6LFy2rhN_yPbdTva2lAe4UkycvtLbRBF04-vC7ogLAJmDe3HJ4e-Mftx1l4juSWvpXCBx5ZgDuksjKc_WKBxE6BoLlbLtvkjfctph1poLvee1HmdOipXdCbvOjJtydCpUYSJOF8wUEriAD1vqwS-PysEwr9grU8MkuRK7gZP8HCN3qMjxk3eBILnZ8_rpFyGNPCiGY-IStLasAOap_IWd3-R4MsCs4ABSZVn73_gfthGIE7SV9k4KycNZ'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                          stops: const [0.0, 1.0],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: primaryColor.withOpacity(0.1)),
                            ),
                            child: Text(
                              "Bestseller",
                              style: GoogleFonts.lexend(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Master Python Programming",
                            style: GoogleFonts.lexend(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Stats Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatItem(Icons.signal_cellular_alt, "Beginner", primaryColor),
                      _buildStatItem(Icons.schedule, "12 Hours", primaryColor),
                      Row(
                        children: [
                          Row(
                            children: List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 18)),
                          ),
                          const Icon(Icons.star_half, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "4.8",
                            style: GoogleFonts.lexend(fontWeight: FontWeight.bold, color: textColor),
                          ),
                          Text(
                            " (1.2k)",
                            style: GoogleFonts.lexend(color: Colors.grey[400], fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Tags
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag("Python"),
                      _buildTag("Coding"),
                      _buildTag("Data Science"),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // About
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About this course",
                        style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Learn Python from scratch. This comprehensive course covers variables, loops, functions, and data analysis basics to get you job-ready. Perfect for beginners with no prior coding experience.",
                        style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[600], height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // What You'll Learn
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB), // slate-50
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.grey[100]!)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What you'll learn",
                        style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const SizedBox(height: 16),
                      _buildLearnItem("Understand Python syntax and basic concepts deeply", primaryColor),
                      _buildLearnItem("Build real-world applications and scripts", primaryColor),
                      _buildLearnItem("Automate boring tasks with simple Python programs", primaryColor),
                      _buildLearnItem("Analyze data using Pandas and NumPy libraries", primaryColor),
                    ],
                  ),
                ),

                // Curriculum
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Curriculum",
                            style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                          ),
                          Text(
                            "12 Modules • 45 Lessons",
                            style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[500]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildCurriculumItem("01. Getting Started", "15 mins • Introduction", Icons.play_arrow, primaryColor, isActive: true),
                      const SizedBox(height: 12),
                      _buildCurriculumItem("02. Variables & Types", "45 mins • Fundamentals", Icons.lock, Colors.grey),
                      const SizedBox(height: 12),
                      _buildCurriculumItem("03. Control Flow", "1 hr • Logic", Icons.lock, Colors.grey),
                      const SizedBox(height: 12),
                      _buildCurriculumItem("04. Functions", "55 mins • Reusability", Icons.lock, Colors.grey),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Divider(color: Colors.grey[100], thickness: 1),
                const SizedBox(height: 24),

                // Reviews
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Reviews", style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star, size: 16, color: Colors.amber),
                                  const SizedBox(width: 4),
                                  Text("4.8", style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
                                  Text(" (1.2k reviews)", style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Write a Review",
                              style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildReviewItem("JD", "Jane Cooper", "2 days ago", "Fantastic course! The instructor explains complex concepts very clearly. I finally understand decorators.", Colors.blue),
                      const SizedBox(height: 24),
                      _buildReviewItem("MK", "Mike Ross", "1 week ago", "Good content, but I wish there were more exercises on Pandas. Still worth the time.", Colors.green),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Colors.grey[200]!),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            "See all reviews",
                            style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Sticky Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.white.withOpacity(0.8), Colors.transparent],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 8,
                  shadowColor: primaryColor.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start Course", style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String text, Color primaryColor) {
    return Row(
      children: [
        Icon(icon, color: primaryColor, size: 20),
        const SizedBox(width: 4),
        Text(text, style: GoogleFonts.notoSans(color: Colors.grey[600], fontSize: 14)),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            text == 'Python' ? Icons.code : (text == 'Coding' ? Icons.terminal : Icons.insights),
            size: 16,
            color: Colors.grey[500],
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF1b0d0d)),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnItem(String text, Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: primaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(text, style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[700])),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumItem(String title, String subtitle, IconData icon, Color iconColor, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isActive ? const Color(0xFFec1313).withOpacity(0.2) : Colors.grey[100]!),
        boxShadow: isActive ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFec1313).withOpacity(0.1) : Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(icon, color: isActive ? const Color(0xFFec1313) : Colors.grey[400], size: 20),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF1b0d0d))),
                  const SizedBox(height: 2),
                  Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                ],
              ),
            ],
          ),
          if (isActive)
             const Icon(Icons.expand_more, color: Colors.grey, size: 24),
        ],
      ),
    );
  }
  
  Widget _buildReviewItem(String initials, String name, String time, String text, MaterialColor color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color[100],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(initials, style: GoogleFonts.lexend(fontWeight: FontWeight.bold, color: color[600], fontSize: 14)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF1b0d0d))),
                  Text(time, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400])),
                ],
              ),
              Row(
                children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber)),
              ),
              const SizedBox(height: 8),
              Text(text, style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[600], height: 1.5)),
            ],
          ),
        ),
      ],
    );
  }
}
