import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataScienceCoursePage extends StatefulWidget {
  const DataScienceCoursePage({super.key});

  @override
  State<DataScienceCoursePage> createState() => _DataScienceCoursePageState();
}

class _DataScienceCoursePageState extends State<DataScienceCoursePage> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _opacity = (_scrollController.offset > 200) ? 1.0 : 0.0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFec1313); // Primary from HTML
    const Color backgroundLight = Color(0xFFffffff);
    const Color textColor = Color(0xFF1b0d0d);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Sticky Header
              SliverAppBar(
                backgroundColor: Colors.white.withOpacity(0.95),
                elevation: 0.5,
                pinned: true,
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: textColor, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
                title: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Data Science Dasar",
                    style: GoogleFonts.lexend(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: textColor, size: 24),
                    onPressed: () {},
                  ),
                ],
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Image
                      Container(
                        height: 260,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuAzylX4DFV1-TuA8MtOl4X4H8aNIHlu24VLaJ-IFdibJXcsccnL5lCOJRFyOvCj1cVWF5EVZ9z9c2H4Fp4_Bg9My1GP-Zj-b4GNzGz8Yx8PjswlELRlI4BsZ4CQseishFZE8JEtk-QAbbFsfUOYJS7Y9GcBZx0py-VyPfckuofgLaUKVS7PKzgdMi7DiphdKM9h9thjs7va1zMj7JYTrV8Bd78kdvy_ZFlZoeZj06jAmy4mR9kv32LjsAawZ6joR2KCbYVwHm8CgWyO'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                              stops: const [0.0, 0.6],
                            ),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data Science Dasar",
                                style: GoogleFonts.lexend(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(4, (index) => const Icon(Icons.star, color: Colors.yellow, size: 20)),
                                  ),
                                  const Icon(Icons.star_half, color: Colors.yellow, size: 20),
                                  const SizedBox(width: 6),
                                  Text(
                                    "4.8",
                                    style: GoogleFonts.lexend(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "(120 Reviews)",
                                    style: GoogleFonts.lexend(color: Colors.white.withOpacity(0.9), fontSize: 14),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Stats Row
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _buildStatChip(Icons.signal_cellular_alt, "Pemula"),
                          _buildStatChip(Icons.schedule, "4 Jam"),
                          _buildStatChip(Icons.workspace_premium, "Sertifikat"),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // About
                      Text("Tentang Kursus", style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                      const SizedBox(height: 8),
                      Text(
                        "Kursus ini memberikan pengantar komprehensif tentang data science, mencakup alat dan teknik penting untuk pemula. Anda akan mempelajari dasar-dasar Python, manipulasi data, dan analisis statistik dasar.",
                        style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[600], height: 1.5),
                      ),
                      
                      const SizedBox(height: 16),

                      // What You'll Learn
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[200]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Yang Akan Anda Pelajari", style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
                            const SizedBox(height: 12),
                            _buildLearnItem("Memahami sintaks dasar Python untuk Data Science"),
                            _buildLearnItem("Manipulasi data menggunakan library Pandas"),
                            _buildLearnItem("Visualisasi data dasar dan interpretasi grafik"),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Course Materials
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Materi Kursus", style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("3 Modul", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: primaryColor)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      
                      _buildModuleItem(1, "Pengenalan Data Science", "10 Menit • Video", Icons.play_circle, primaryColor),
                      const SizedBox(height: 12),
                      _buildModuleItem(2, "Dasar Pemrograman Python", "45 Menit • Quiz & Lab", Icons.lock, Colors.grey),
                      const SizedBox(height: 12),
                      _buildModuleItem(3, "Visualisasi Data", "30 Menit • Proyek", Icons.lock, Colors.grey),

                      const SizedBox(height: 24),
                      Divider(color: Colors.grey[200]),
                      const SizedBox(height: 20),

                      // Reviews Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ulasan Pengguna", style: GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                          OutlinedButton.icon(
                            onPressed: (){}, 
                            icon: const Icon(Icons.edit, size: 16),
                            label: const Text("Tulis Ulasan"),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primaryColor,
                              side: BorderSide(color: primaryColor.withOpacity(0.2)),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              textStyle: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      _buildReviewItem("AD", "Andi Dharmawan", "2 hari lalu", "Materi sangat mudah dipahami untuk pemula seperti saya. Penjelasannya runtut dan contoh kodingnya jelas. Sangat merekomendasikan kursus ini!", Colors.blue),
                      const SizedBox(height: 16),
                      _buildReviewItem("SP", "Siti Putri", "1 minggu lalu", "Kursus bagus, tapi bagian visualisasi data perlu diperdalam lagi. Selebihnya oke untuk dasar-dasar.", Colors.purple),

                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {}, 
                          style: OutlinedButton.styleFrom(
                            foregroundColor: textColor,
                            side: BorderSide(color: Colors.grey[200]!),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text("Lihat Semua 120 Ulasan", style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      
                      const SizedBox(height: 120), // Bottom padding
                      
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Sticky Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24), // Added top padding for gradient effect
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 8,
                  shadowColor: primaryColor.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mulai Belajar", style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold)),
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

  Widget _buildStatChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFec1313), size: 18),
          const SizedBox(width: 8),
          Text(text, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500, color: const Color(0xFF1b0d0d))),
        ],
      ),
    );
  }

  Widget _buildLearnItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xFFec1313).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 12, color: Color(0xFFec1313)),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text, style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey[600]))),
        ],
      ),
    );
  }

  Widget _buildModuleItem(int number, String title, String subtitle, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: number == 1 ? const Color(0xFFec1313).withOpacity(0.1) : Colors.grey[100],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: GoogleFonts.lexend(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: number == 1 ? const Color(0xFFec1313) : Colors.grey[400],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF1b0d0d))),
                const SizedBox(height: 2),
                Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(icon, color: iconColor, size: 24),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String initials, String name, String time, String text, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color[100],
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text(initials, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: color[700]))),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF1b0d0d))),
                      Row(
                        children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber)),
                      ),
                    ],
                  ),
                ],
              ),
              Text(time, style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[400])),
            ],
          ),
          const SizedBox(height: 8),
          Text(text, style: GoogleFonts.notoSans(fontSize: 12, color: Colors.grey[600], height: 1.5)),
        ],
      ),
    );
  }
}
