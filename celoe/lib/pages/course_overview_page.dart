import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'web_design_learning_page.dart';

class CourseOverviewPage extends StatefulWidget {
  const CourseOverviewPage({super.key});

  @override
  State<CourseOverviewPage> createState() => _CourseOverviewPageState();
}

class _CourseOverviewPageState extends State<CourseOverviewPage> {
  // Use scroll controller to handle sticky header transition if needed
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Colors from HTML/Tailwind config
    const Color primaryColor = Color(0xFFee2b2b);
    const Color backgroundLight = Color(0xFFffffff);
    const Color textColor = Color(0xFF1b0d0d);
    
    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Header
              SliverAppBar(
                backgroundColor: backgroundLight.withOpacity(0.95),
                elevation: 0,
                pinned: true,
                centerTitle: true,
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isScrolled ? 1.0 : 0.0,
                  child: Text(
                    "Desain Web Dasar",
                    style: GoogleFonts.lexend(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: textColor),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share, color: primaryColor),
                    onPressed: () {},
                  ),
                ],
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100), // Space for bottom bar
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 4 / 3,
                                  child: Image.network(
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuC1mr8QjEVOwYR_PYl22TfLjauk3Ge0ly6NTTOUdARX85wdUDI8IVVZESCa1MFjnqsSQ-6g7A3S_d21eLCLu0DjkT36NNE6Dknmlao9UNHFStOn6z9IfGyaHgTJyWXr6qj3fqoQRbxPtx-Bx8KFJt-L3VXpK_skUD1WgqPazUvsoL20BbRQ6UnQ2qcK3OsyPP7vwx_GbBSDX7cUSdg7FXo8v07pKaiB4VklRRxWWTSkjXmcyZDuJTMLW1MzQ-xjezD2Epc3Mv0OG41e',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        color: Colors.grey[200],
                                        child: const Center(
                                          child: CircularProgressIndicator(color: primaryColor),
                                        ),
                                      );
                                    },
                                    errorBuilder: (_, __, ___) => Container(
                                      color: Colors.grey[200],
                                      child: const Icon(Icons.broken_image, color: Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  left: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Best Seller',
                                      style: GoogleFonts.lexend(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Desain Web Dasar',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Master HTML & CSS dalam 4 minggu',
                              style: GoogleFonts.lexend(
                                color: Colors.grey[500],
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Rating
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              '4.8',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < 4 ? Icons.star : Icons.star_half,
                                  color: Colors.yellow[700],
                                  size: 20,
                                );
                              }),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(120 ulasan)',
                              style: GoogleFonts.lexend(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Stats Row
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB).withOpacity(0.5),
                          border: Border(
                            top: BorderSide(color: Colors.grey[100]!),
                            bottom: BorderSide(color: Colors.grey[100]!),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStatItem(Icons.timer, '4 Minggu', primaryColor),
                            Container(width: 1, height: 32, color: Colors.grey[200]),
                            _buildStatItem(Icons.bar_chart, 'Pemula', primaryColor),
                            Container(width: 1, height: 32, color: Colors.grey[200]),
                            _buildStatItem(Icons.group, '1.2k Siswa', primaryColor),
                          ],
                        ),
                      ),
                      
                      // About Course
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tentang Kursus',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Pelajari dasar-dasar pembuatan website modern dari nol. Kursus ini dirancang khusus untuk pemula yang ingin memahami cara kerja web tanpa pengalaman coding sebelumnya. Anda akan membangun portofolio pertama Anda.',
                              style: GoogleFonts.lexend(
                                color: Colors.grey[600],
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // What You'll Learn
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yang Akan Dipelajari',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[100]!),
                              ),
                              child: Column(
                                children: [
                                  _buildCheckItem('Struktur Dokumen HTML5', primaryColor),
                                  const SizedBox(height: 16),
                                  _buildCheckItem('Styling & Layout dengan CSS3', primaryColor),
                                  const SizedBox(height: 16),
                                  _buildCheckItem('Responsive Design (Mobile Friendly)', primaryColor),
                                  const SizedBox(height: 16),
                                  _buildCheckItem('Flexbox & Grid Systems', primaryColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Curriculum
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Kurikulum',
                                  style: GoogleFonts.lexend(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '8 Modul',
                                  style: GoogleFonts.lexend(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildCurriculumItem('1. Pengenalan Web', 'Gratis • 10 menit', Icons.play_arrow, true, primaryColor),
                            _buildCurriculumItem('2. HTML Basics', '45 menit', Icons.code, false, primaryColor),
                            _buildCurriculumItem('3. CSS Styling', '50 menit', Icons.style, false, primaryColor),
                            _buildCurriculumItem('4. Responsive Layouts', '60 menit', Icons.devices, false, primaryColor),
                            
                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Lihat Semua Modul',
                                  style: GoogleFonts.lexend(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Instructor
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Instruktur',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[100]!),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                      image: const DecorationImage(
                                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuApA7ebIe908A5QkeJX7TjohsbXuHdCikudG5IAQ12sS2dmcf5JrBhSBc0typrkk4Ae4AiN-4KcXbPjdvvUYkUztEd7mp7VVkJtqkRo_uEkfU99v-uDurlrdNRP5MjOczO8j2k13NDTDV8tgqyPUJbyvrns1BtcUrF2aqe3o_E_IWMqmOODkD2n94AB6__7hczJO9VmTO95F7y4pZ1eKpovVoiyXtbiXpfcdzIUV71LYLcV_NqYwr0njU-_v3cvaRhjOqGC6-Z0rw7b'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sarah Wijaya',
                                          style: GoogleFonts.lexend(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Senior Frontend Developer',
                                          style: GoogleFonts.lexend(
                                            color: Colors.grey[500],
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.star, color: Colors.orange, size: 14),
                                            const SizedBox(width: 4),
                                            Text(
                                              '4.9',
                                              style: GoogleFonts.lexend(
                                                color: Colors.grey[700],
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '• 15 Kursus',
                                              style: GoogleFonts.lexend(
                                                color: Colors.grey[400],
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Review Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ulasan Pengguna',
                                  style: GoogleFonts.lexend(
                                    color: textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.edit_square, color: primaryColor, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Tulis Ulasan',
                                        style: GoogleFonts.lexend(
                                          color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildReviewItem('AP', 'Andi Pratama', '1 hari lalu', 'Kursus yang sangat bagus untuk pemula. Penjelasannya mudah dipahami.', 5, Colors.orange[100]!, Colors.orange[800]!),
                            const SizedBox(height: 12),
                            _buildReviewItem('SA', 'Siti Aminah', '3 hari lalu', 'Materinya lengkap, tapi ada beberapa bagian di CSS yang agak cepat penjelasannya.', 4, Colors.blue[100]!, Colors.blue[600]!),
                            
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xFFF9FAFB),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Lihat Semua 120 Ulasan',
                                  style: GoogleFonts.lexend(
                                    color: Colors.grey[500],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
              padding: const EdgeInsets.only(top: 16, bottom: 24, left: 16, right: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.0),
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, -8),
                    ),
                  ],
                  border: Border.all(color: Colors.grey[100]!),
                ),
                child: Row(
                  children: [
                    // Price removed as requested
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WebDesignLearningPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shadowColor: primaryColor.withOpacity(0.3),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Mulai Belajar',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.lexend(
            color: Colors.grey[700],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckItem(String text, Color primaryColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 12, color: primaryColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lexend(
              color: Colors.grey[700],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurriculumItem(String title, String subtitle, IconData icon, bool isOpen, Color primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOpen ? primaryColor.withOpacity(0.3) : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isOpen ? primaryColor.withOpacity(0.1) : Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isOpen ? primaryColor : Colors.grey[400],
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lexend(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.lexend(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isOpen ? Icons.lock_open : Icons.lock,
            color: isOpen ? primaryColor : Colors.grey[300],
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String initials, String name, String time, String review, int stars, Color bg, Color text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
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
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: bg,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        initials,
                        style: GoogleFonts.lexend(
                          color: text,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < stars ? Icons.star : Icons.star_border,
                            color: Colors.yellow[700],
                            size: 14,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                time,
                style: GoogleFonts.lexend(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '"$review"',
            style: GoogleFonts.lexend(
              color: Colors.grey[600],
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
