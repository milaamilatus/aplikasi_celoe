import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ux_ui_learning_page.dart';

class UxUiCoursePage extends StatefulWidget {
  const UxUiCoursePage({super.key});

  @override
  State<UxUiCoursePage> createState() => _UxUiCoursePageState();
}

class _UxUiCoursePageState extends State<UxUiCoursePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFf20d0d); // Primary from HTML
    const Color backgroundLight = Color(0xFFffffff);
    const Color textColor = Color(0xFF1c0d0d);

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
                  icon: const Icon(Icons.arrow_back, color: textColor, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(
                  "Detail Kursus",
                  style: GoogleFonts.lexend(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share, color: textColor, size: 24),
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
                        height: 220,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCxnxs7NBcgoCOfydD_eJO6niLIMVPdd9YqEdCvlaGbz7DDUQaiuLuUfrPZ1qmXL9BE2XRcjfW2d-Ykfdg1-qyEa0W1q3M7jW_0FyS488ozhxWErdeBELPoDrzD9Du2P6VfhgJV7hMFCVhfez1YJW4-lxxyJ6h2Auykvvy9kBdVYB8rD3lw_gTqz2Wi0HMAed2B1C-T2qaMu8V9QJb9PMjorsEF_ceJm47-WJ9O2yNYU0OthCgnZRORJbwqkFY8ZTxIZcHlQGd3-lKK'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.play_circle, color: Colors.white, size: 14),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Preview',
                                      style: GoogleFonts.lexend(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Tag & Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'DESIGN',
                              style: GoogleFonts.lexend(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ...List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 18)),
                              const Icon(Icons.star_half, color: Colors.amber, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                '4.8',
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(1.2k)',
                                style: GoogleFonts.lexend(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Title & Desc
                      Text(
                        'UX/UI Design Pemula',
                        style: GoogleFonts.lexend(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Pelajari dasar-dasar desain antarmuka dan pengalaman pengguna dari nol bersama para ahli industri.',
                        style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Instructor Card
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[100]!),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
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
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                                    image: const DecorationImage(
                                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAy5dkvVu0To3OYJa-6LKS7Ih_dTUbNNN5TnL4Kr7nWt-JwAT2TdN0Ia3CrqvBUh7Z3DEhmpO4XQnZPVAwUyT2MeCpe2282Hma-NPyjrVFk2ySVEDHyuwHlt_2Y_KPZNJp05aZHtS4kbL0R9MCq8NJOsltzybvqKZp6lBpmJre8Mq_0xexBmEZp7r_-Et9fu3OVngqlLyIvF-xlmEyZs_rZ2NoMWJNxv1LyWkwNWb0-xUMNO_of1arKNbK8kG-ukuNH9WDd9ilKaj0z'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Budi Santoso',
                                      style: GoogleFonts.lexend(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: textColor,
                                      ),
                                    ),
                                    Text(
                                      'Senior Product Designer',
                                      style: GoogleFonts.lexend(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey[500],
                                textStyle: GoogleFonts.lexend(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: const Text('Lihat Profil'),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Stats Scroll
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildStatChip(Icons.school, 'Pemula'),
                            _buildStatChip(Icons.schedule, '5 Jam'),
                            _buildStatChip(Icons.verified, 'Sertifikat'),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // What You'll Learn
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[100]!),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yang Akan Anda Pelajari',
                              style: GoogleFonts.lexend(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildLearnItem('Memahami prinsip dasar User Experience (UX) dan User Interface (UI)'),
                            _buildLearnItem('Menguasai tools industri seperti Figma dari nol hingga mahir'),
                            _buildLearnItem('Membangun portofolio desain yang menarik untuk karir profesional'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // Sticky Tabs
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelColor: primaryColor,
                    unselectedLabelColor: Colors.grey[500],
                    labelStyle: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w500),
                    indicatorColor: primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Materi"),
                      Tab(text: "Tentang"),
                      Tab(text: "Ulasan"),
                    ],
                  ),
                ),
                pinned: true,
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                  child: Column(
                    children: [
                      // Modules
                      _buildModuleValues(1, "Modul 1: Pengenalan UX", "3 Pelajaran • 45 Menit", true, [
                        _buildLessonItem("Apa itu User Experience?", "15:00", true, true),
                        _buildLessonItem("Sejarah Singkat UX", "12:30", false, false),
                        _buildLessonItem("Perbedaan UI dan UX", "18:10", false, false),
                      ]),
                      const SizedBox(height: 12),
                      _buildModuleValues(2, "Modul 2: Visual Hierarchy", "4 Pelajaran • 60 Menit", false, []),
                      const SizedBox(height: 12),
                      _buildModuleValues(3, "Modul 3: Tools Figma", "5 Pelajaran • 120 Menit", false, []),
                      
                      const SizedBox(height: 24),
                      Divider(color: Colors.grey[100]),
                      const SizedBox(height: 24),
                      
                      // Reviews Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ulasan Pengguna", style: GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
                          Text("Lihat Semua", style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Overall Ratings
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("4.8", style: GoogleFonts.lexend(fontSize: 30, fontWeight: FontWeight.bold, color: textColor)),
                                    Row(
                                      children: [
                                        ...List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 14)),
                                        const Icon(Icons.star_half, color: Colors.amber, size: 14),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    children: [
                                      _buildRatingBar(5, 0.85),
                                      _buildRatingBar(4, 0.10),
                                      _buildRatingBar(3, 0.03),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.rate_review, size: 18),
                              label: const Text("Tulis Ulasan Saya"),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryColor,
                                side: const BorderSide(color: primaryColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                minimumSize: const Size(double.infinity, 44),
                                textStyle: GoogleFonts.lexend(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Review Items
                      _buildReviewItem("RW", "Rina Wati", "2 hari lalu", "Materi sangat mudah dipahami untuk pemula seperti saya. Terima kasih coach Budi penjelasannya detail sekali!", Colors.purple),
                      const SizedBox(height: 12),
                      _buildReviewItem("DA", "Dimas Anggara", "1 minggu lalu", "Kursus yang bagus, tapi saya berharap ada lebih banyak studi kasus di modul visual hierarchy.", Colors.blue),
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
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.bottomCenter,
                   end: Alignment.topCenter,
                   colors: [Colors.white, Colors.white.withOpacity(0.9), Colors.transparent],
                   stops: const [0.0, 0.5, 1.0],
                 ),
               ),
               padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => const UxUiLearningPage()),
                   );
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: primaryColor,
                   foregroundColor: Colors.white,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                   elevation: 4,
                   shadowColor: primaryColor.withOpacity(0.5),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Mulai Kursus Sekarang',
                       style: GoogleFonts.lexend(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
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
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[500], size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.lexend(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1c0d0d),
            ),
          ),
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
          const Icon(Icons.check_circle, color: Color(0xFFf20d0d), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.notoSans(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleValues(int id, String title, String subtitle, bool isExpanded, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1c0d0d))),
                    const SizedBox(height: 2),
                    Text(subtitle, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[500])),
                  ],
                ),
                Icon(isExpanded ? Icons.expand_less : Icons.expand_more, color: Colors.grey[400]),
              ],
            ),
          ),
          if (isExpanded) ...children,
        ],
      ),
    );
  }

  Widget _buildLessonItem(String title, String duration, bool isPlayable, bool isFree) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isPlayable ? const Color(0xFFf20d0d).withOpacity(0.1) : const Color(0xFFF3F4F6),
            ),
            child: Icon(
              isPlayable ? Icons.play_arrow : Icons.lock,
              size: 18,
              color: isPlayable ? const Color(0xFFf20d0d) : Colors.grey[400],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF1c0d0d))),
                if (isFree)
                  Text("Gratis", style: GoogleFonts.lexend(fontSize: 10, fontWeight: FontWeight.w500, color: const Color(0xFFf20d0d))),
              ],
            ),
          ),
          Text(duration, style: GoogleFonts.lexend(fontSize: 12, color: Colors.grey[400])),
        ],
      ),
    );
  }
  
  Widget _buildRatingBar(int star, double percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(width: 12, child: Text(star.toString(), style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.w500))),
          Expanded(
            child: Container(
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(3),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String initials, String name, String time, String text, MaterialColor color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color[100],
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text(initials, style: GoogleFonts.lexend(fontSize: 12, fontWeight: FontWeight.bold, color: color[700]))),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1c0d0d))),
                    Text(time, style: GoogleFonts.lexend(fontSize: 10, color: Colors.grey[500])),
                  ],
                ),
              ],
            ),
            Row(children: List.generate(5, (index) => const Icon(Icons.star, size: 14, color: Colors.amber))),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Text(text, style: GoogleFonts.notoSans(fontSize: 13, color: Colors.grey[700], height: 1.5)),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
