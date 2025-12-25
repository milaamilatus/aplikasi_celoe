import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalMarketingCoursePage extends StatefulWidget {
  const DigitalMarketingCoursePage({super.key});

  @override
  State<DigitalMarketingCoursePage> createState() => _DigitalMarketingCoursePageState();
}

class _DigitalMarketingCoursePageState extends State<DigitalMarketingCoursePage> {
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
    const Color primaryColor = Color(0xFFef4444); // Red-500
    const Color backgroundLight = Color(0xFFffffff);
    const Color textColor = Color(0xFF1c0d0d);

    return Scaffold(
      backgroundColor: backgroundLight,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Header
              SliverAppBar(
                backgroundColor: Colors.white.withOpacity(0.95),
                elevation: 0,
                pinned: true,
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, color: textColor, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _isScrolled ? 1.0 : 0.0,
                  child: Text(
                    "Pemasaran Digital",
                    style: GoogleFonts.lexend(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.bookmark_border, color: textColor, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Image
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Container(
                          width: double.infinity,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: NetworkImage(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAvl06qrZyp2LKHyr_Gzn6ygmP5JEwy61XQ9qo5fMyrJv01m8TmlRRiKLF0mm7p05QnWs7TSWTH6ZgmdaaCMd2yqfTCWcFKVtCW__wUUw98IVD3GCshwpk4xcOwHQ7UI9LnyI8NrWjtHlulc1XyVR2Wogi_kPJz0LYbcULm--EN9xbhhKl0M7-agFUL_gJ-6_TEpFGmTpZahYHm4Erk4EiTVBWhs7hYFliV1hjrbNVc07RPc2WV66MC_M7b6rfZUjPLbSah1J6wroV8'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
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
                        ),
                      ),

                      // Title & Badges
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pemasaran Digital',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                _buildBadge(Icons.signal_cellular_alt, 'Pemula', Colors.red[50]!, Colors.red[600]!),
                                _buildBadge(Icons.schedule, '4 Minggu', Colors.grey[100]!, Colors.grey[600]!),
                                _buildBadge(Icons.verified, 'Sertifikat', Colors.grey[100]!, Colors.grey[600]!),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
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
                                      Icons.star,
                                      color: Colors.yellow[700],
                                      size: 18,
                                    );
                                  }),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(120 ulasan)',
                                  style: GoogleFonts.lexend(
                                    color: Colors.grey[500],
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const Divider(thickness: 1, color: Color(0xFFF3F4F6), indent: 20, endIndent: 20),

                      // About
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.lexend(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  height: 1.6,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Kuasai dasar-dasar pemasaran digital, termasuk SEO, SEM, dan strategi media sosial yang disesuaikan untuk pasar Indonesia. Kursus ini dirancang untuk membekali Anda dengan keterampilan praktis. ',
                                  ),
                                  TextSpan(
                                    text: 'Baca selengkapnya',
                                    style: GoogleFonts.lexend(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9FAFB),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[100]!),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://lh3.googleusercontent.com/aida-public/AB6AXuDVyRGhJQHfrzu7G5qCdrQneS5q2f8DK2BY3ktSppRO8Nc1Chfbswvn8yOJ5dh8nHyrBnYJNuG4VF_A_z1u-HswtpwUuefweLuUvTHHWJfYTx_ydnVaH2LnWSOL8cQNZ9IIoFEGJb_nLhMQN8SyY09uC2O3Ehswe50-o5gSAJyzMsnSM6zsQT7OZcpvi6j5t2Cc6DX-qaTv62eX0E82NJMbW7WkTAMzv3Dl8xtmpnhtpLmwGZ8JIsavz6xcZfVV9hSXwEfZliSbv3kW'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sarah Wijaya',
                                          style: GoogleFonts.lexend(
                                            color: textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Digital Marketing Expert',
                                          style: GoogleFonts.lexend(
                                            color: Colors.grey[500],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.red[50], // red-100
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Follow',
                                      style: GoogleFonts.lexend(
                                        color: Colors.red[600],
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // What You'll Learn
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yang Akan Anda Pelajari',
                              style: GoogleFonts.lexend(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildCheckList('Memahami fundamental SEO dan cara kerjanya.'),
                            const SizedBox(height: 12),
                            _buildCheckList('Membuat kampanye Facebook Ads yang efektif.'),
                            const SizedBox(height: 12),
                            _buildCheckList('Setup dan analisis data menggunakan Google Analytics.'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Curriculum
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          border: Border(top: BorderSide(color: Colors.grey[100]!)),
                          boxShadow: [
                             BoxShadow(
                               color: Colors.black.withOpacity(0.05),
                               blurRadius: 40,
                               offset: const Offset(0, -10),
                             ),
                           ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kurikulum',
                                      style: GoogleFonts.lexend(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '5 Modul • 12 Jam Total',
                                      style: GoogleFonts.lexend(
                                        color: Colors.grey[500],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Lihat Semua',
                                  style: GoogleFonts.lexend(
                                    color: Colors.red[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildModuleItem(1, 'Pengenalan Digital', '15 mnt', 'Definisi, sejarah, dan mengapa digital marketing penting.', false),
                            _buildModuleItem(2, 'Strategi Konten', '45 mnt', 'Merencanakan kalender konten dan copywriting dasar.', false),
                            _buildModuleItem(3, 'Media Sosial', '', '', true),
                            _buildModuleItem(4, 'SEO Dasar', '', '', true),
                          ],
                        ),
                      ),

                      // Reviews
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ulasan Siswa',
                                      style: GoogleFonts.lexend(
                                        color: textColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          '4.8',
                                          style: GoogleFonts.lexend(
                                            color: textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Row(
                                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow[700], size: 14)),
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          '(120)',
                                          style: GoogleFonts.lexend(color: Colors.grey[500], fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit, size: 16, color: Colors.red[600]),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Tulis Ulasan',
                                        style: GoogleFonts.lexend(
                                          color: Colors.red[600],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildReviewCard('Budi Santoso', '2 hari yang lalu', 'Materi sangat mudah dipahami untuk pemula. Penjelasannya runtut dan contoh kasusnya relevan dengan pasar lokal.', 'https://lh3.googleusercontent.com/aida-public/AB6AXuA8IoTqHHLEgFYhAYj45kw-LYRW72B3NSeFhbqOWGg8Gmpob8y9GgBhG40u_GqD6TCeKsSw0LCMM08Ram8SFrjuYOA2XlaQFWsShM-555PYUknxZDK5z8fM8SgtckaMOWuZnDGTNn4WelT4tsCeFo-Hazb3kQ9tlj2xtCcKPHa8Jk6OdSC3Ds3kNcJO9P-lW0Nm37xjcB7wHaRmwi5lbbFpAOrsI0cuZctM7j7eFLm43n84bdp0NRyGCb1Q-oTr_79b5_wgTHipzc7d', null),
                            const SizedBox(height: 12),
                            _buildReviewCard('Dian Anggraini', '1 minggu yang lalu', 'Sangat membantu karir saya. Modul SEO-nya daging banget! Hanya saja audio di modul 3 agak kecil sedikit.', null, 'DA'),
                            const SizedBox(height: 16),
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
                                  'Lihat Semua Ulasan',
                                  style: GoogleFonts.lexend(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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

          // Sticky Bottom Button
          Positioned(
             bottom: 0,
             left: 0,
             right: 0,
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                   begin: Alignment.bottomCenter,
                   end: Alignment.topCenter,
                   colors: [Colors.white, Colors.white.withOpacity(0)],
                 ),
               ),
               padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 48),
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: primaryColor,
                   foregroundColor: Colors.white,
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                   elevation: 10,
                   shadowColor: Colors.red.withOpacity(0.3),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Start Course',
                       style: GoogleFonts.lexend(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         letterSpacing: 0.5,
                       ),
                     ),
                     const SizedBox(width: 8),
                     const Icon(Icons.arrow_forward, size: 20),
                   ],
                 ),
               ),
             ),
          ),
          
          // Note: The HTML design has a bottom nav bar *on top* of the sticky button area or below it.
          // Usually valid detail pages don't have bottom nav. I'll stick with just the Start button as per modern UX.
        ],
      ),
    );
  }

  Widget _buildBadge(IconData icon, String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bgColor == Colors.red[50] ? Colors.red[100]! : Colors.transparent),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.lexend(
              color: textColor == Colors.red[600] ? Colors.red[600] : const Color(0xFF1c0d0d),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckList(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.lexend(
              color: Colors.grey[700],
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModuleItem(int number, String title, String duration, String desc, bool isLocked) {
    return Opacity(
      opacity: isLocked ? 0.75 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 2,
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
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isLocked ? Colors.grey[200] : Colors.red[100],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          number.toString(),
                          style: GoogleFonts.lexend(
                            color: isLocked ? Colors.grey[500] : Colors.red[600],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: GoogleFonts.lexend(
                        color: const Color(0xFF1c0d0d),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (isLocked)
                   const Icon(Icons.lock, color: Colors.grey, size: 18)
                else
                  Text(
                    duration,
                    style: GoogleFonts.lexend(
                      color: Colors.grey[500],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
            if (desc.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 44, top: 4),
                child: Text(
                  desc,
                  style: GoogleFonts.lexend(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(String name, String time, String content, String? imageUrl, String? initials) {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (imageUrl != null)
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      ),
                    )
                  else
                     Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple[100],
                      ),
                      child: Center(
                        child: Text(
                          initials ?? '?',
                          style: GoogleFonts.lexend(
                            color: Colors.purple[600],
                            fontSize: 12,
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
                          color: const Color(0xFF1c0d0d),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        time,
                        style: GoogleFonts.lexend(
                          color: Colors.grey[400],
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: List.generate(5, (index) => Icon(Icons.star, color: Colors.yellow[700], size: 14)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: GoogleFonts.lexend(
              color: Colors.grey[600],
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
