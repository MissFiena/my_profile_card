import 'package:flutter/material.dart';

const Color kPink = Color(0xFFE84393);

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _pastCategories = [
    {
      'category': 'MAJOR',
      'courses': [
        {'code': 'DTN3043', 'name': 'Operating Systems', 'credit': 3},
        {'code': 'DEK3033', 'name': 'Kaedah Berangka Bagi Komputeran', 'credit': 3},
        {'code': 'DTS3083', 'name': 'Struktur Data', 'credit': 3},
        {'code': 'DTN3023', 'name': 'Rangkaian Komputer', 'credit': 3},
        {'code': 'DES3023', 'name': 'Keperluan dan Spesifikasi Perisian', 'credit': 3},
        {'code': 'DEK3023', 'name': 'Kebarangkalian dan Analisis Data', 'credit': 3},
        {'code': 'DTS3013', 'name': 'Pengaturcaraan Berstruktur', 'credit': 3},
        {'code': 'DES3013', 'name': 'Prinsip Dalam Kejuruteraan Perisian', 'credit': 3},
        {'code': 'DTK3013', 'name': 'Struktur Diskrit', 'credit': 3},
        {'code': 'DTN3013', 'name': 'Organisasi dan Senibina Komputer', 'credit': 3},
        {'code': 'DEP3033', 'name': 'Pentaksiran dalam Pendidikan', 'credit': 3},
        {'code': 'DMG3033', 'name': 'Interaksi Manusia-Komputer', 'credit': 3},
        {'code': 'DES3053', 'name': 'Pengujian dan Kualiti Perisian', 'credit': 3},
        {'code': 'DEP3023', 'name': 'Model Pengajaran / Model Instruksi', 'credit': 3},
        {'code': 'DES3043', 'name': 'Reka Bentuk Perisian', 'credit': 3},
        {'code': 'DTD3013', 'name': 'Sistem Pangkalan Data', 'credit': 3},
      ],
    },
    {
      'category': 'FOCUS',
      'courses': [
        {'code': 'DEP3043', 'name': 'Reka Bentuk dalam Pembangunan Koswer', 'credit': 3},
        {'code': 'DTD3033', 'name': 'Pengaturcaraan Web Berpandukan Pangkalan Data', 'credit': 3},
      ],
    },
    {
      'category': 'ELECTIVE',
      'courses': [
        {'code': 'DEP3053', 'name': 'Pengenalan Kepada Psikologi Untuk Komputeran', 'credit': 3},
        {'code': 'KPP3014', 'name': 'Pembelajaran Dan Perkembangan Pelajar', 'credit': 4},
      ],
    },
    {
      'category': 'UNIVERSITY',
      'courses': [
        {'code': 'UBD2012', 'name': 'Kemahiran Bakat Digital', 'credit': 2},
        {'code': 'UPU2122', 'name': 'Penghayatan Etika dan Peradaban', 'credit': 2},
        {'code': 'UBI3292', 'name': 'Comprehensive English 2', 'credit': 2},
        {'code': 'UPU2342', 'name': 'Integriti dan Antirasuah', 'credit': 2},
        {'code': 'UBM3262', 'name': 'Keterampilan Wacana Bahasa Melayu', 'credit': 2},
        {'code': 'UBI3282', 'name': 'Comprehensive English 1', 'credit': 2},
        {'code': 'UPU3222', 'name': 'Budaya Keusahawanan', 'credit': 2},
        {'code': 'UPU3112', 'name': 'Falsafah dan Isu Semasa', 'credit': 2},
      ],
    },
    {
      'category': 'CO-CURRICULUM',
      'courses': [
        {'code': 'CPT2081', 'name': 'Asas Pengaturcaraan Web', 'credit': 1},
        {'code': 'CSR2021', 'name': 'Kembara Alam', 'credit': 1},
      ],
    },
    {
      'category': 'ENRICHMENT',
      'courses': [
        {'code': 'BCK3012', 'name': 'Bahasa Mandarin Komunikasi I', 'credit': 2},
        {'code': 'BCK3122', 'name': 'Asas Komunikasi Bahasa Cina II', 'credit': 2},
        {'code': 'BCK3132', 'name': 'Asas Komunikasi Bahasa Cina III', 'credit': 2},
        {'code': 'BAK3112', 'name': 'Asas Komunikasi Bahasa Arab I', 'credit': 2},
      ],
    },
  ];

  final List<Map<String, dynamic>> _currentCourses = [
    {'code': 'DES3113', 'name': 'Reka Bentuk dan Pembangunan Aplikasi Mobil', 'credit': 3, 'cat': 'FOCUS'},
    {'code': 'DEI3123', 'name': 'Aplikasi Data Sains Pendidikan', 'credit': 3, 'cat': 'ELECTIVE'},
    {'code': 'DES3073', 'name': 'Projek Kejuruteraan Perisian', 'credit': 3, 'cat': 'MAJOR'},
    {'code': 'DEQ3063', 'name': 'Pengurusan Projek Perisian', 'credit': 3, 'cat': 'MAJOR'},
  ];

  final List<Map<String, dynamic>> _upcomingCourses = [
    {'code': 'DEQ3093', 'name': 'Pengurusan Konfigurasi Perisian', 'credit': 3, 'cat': 'FOCUS'},
    {'code': 'DES3083', 'name': 'Proses Kejuruteraan Perisian', 'credit': 3, 'cat': 'FOCUS'},
    {'code': 'DES3103', 'name': 'Pengesahan dan Verifikasi Perisian', 'credit': 3, 'cat': 'FOCUS'},
    {'code': 'DEI3033', 'name': 'Kepintaran Buatan', 'credit': 3, 'cat': 'ELECTIVE'},
    {'code': 'DMA3023', 'name': 'Grafik dan Animasi Berkomputer', 'credit': 3, 'cat': 'ELECTIVE'},
    {'code': 'DER3994', 'name': 'Projek Tahun Akhir 2', 'credit': 4, 'cat': 'PROJECT'},
    {'code': 'DLI30112', 'name': 'Latihan Industri', 'credit': 12, 'cat': 'LATIHAN INDUSTRI'},
  ];

  List<Map<String, dynamic>> _groupByCategory(
      List<Map<String, dynamic>> courses) {
    final Map<String, List<Map<String, dynamic>>> grouped = {};
    for (final c in courses) {
      final cat = c['cat'] as String;
      grouped.putIfAbsent(cat, () => []).add(c);
    }
    return grouped.entries
        .map((e) => {'category': e.key, 'courses': e.value})
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Courses',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A1A))),
            Text('Universiti Pendidikan Sultan Idris · FKMT',
                style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF))),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: kPink,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: kPink.withOpacity(0.4), blurRadius: 8)
                ],
              ),
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF9CA3AF),
              labelStyle: const TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w700),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Past'),
                Tab(text: 'Current'),
                Tab(text: 'Upcoming'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _CategoryList(
              categories: _pastCategories, isActive: false),
          _CategoryList(
              categories: _groupByCategory(_currentCourses),
              isActive: true),
          _CategoryList(
              categories: _groupByCategory(_upcomingCourses),
              isActive: false,
              isUpcoming: true),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final bool isActive;
  final bool isUpcoming;

  const _CategoryList({
    required this.categories,
    required this.isActive,
    this.isUpcoming = false,
  });

  static const Map<String, Color> catColors = {
    'MAJOR':            Color(0xFF3B82F6),
    'FOCUS':            Color(0xFF8B5CF6),
    'ELECTIVE':         Color(0xFFF59E0B),
    'UNIVERSITY':       Color(0xFF10B981),
    'CO-CURRICULUM':    Color(0xFFEF4444),
    'ENRICHMENT':       Color(0xFFF97316),
    'PROJECT':          Color(0xFFEC4899),
    'LATIHAN INDUSTRI': Color(0xFF6B7280),
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: categories.length,
      itemBuilder: (context, i) {
        final cat = categories[i]['category'] as String;
        final courses =
            categories[i]['courses'] as List<Map<String, dynamic>>;
        final color = catColors[cat] ?? kPink;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: color.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 8, height: 8,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: color.withOpacity(0.5), blurRadius: 6)
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(cat,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: color,
                          letterSpacing: 1)),
                  const Spacer(),
                  Text('${courses.length} subj.',
                      style: const TextStyle(
                          fontSize: 9, color: Color(0xFF9CA3AF))),
                ],
              ),
            ),
            ...courses.map((c) => Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 9),
                  decoration: BoxDecoration(
                    color: isActive
                        ? color.withOpacity(0.04)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isActive
                          ? color.withOpacity(0.15)
                          : const Color(0xFFF0F0F0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c['name'] as String,
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF1A1A1A),
                                  fontWeight: FontWeight.w600,
                                  height: 1.35),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${c['code']}  ·  ${c['credit']} credit',
                              style: const TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF9CA3AF)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (!isActive && !isUpcoming)
                        const Text('✅',
                            style: TextStyle(fontSize: 14))
                      else if (isActive)
                        Container(
                          width: 8, height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x6610B981),
                                  blurRadius: 6)
                            ],
                          ),
                        )
                      else
                        const Text('📅',
                            style: TextStyle(fontSize: 13)),
                    ],
                  ),
                )),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
