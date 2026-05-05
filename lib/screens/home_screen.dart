import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

const Color kPink = Color(0xFFE84393);
const Color kPinkLight = Color(0xFFFDF2F8);
const Color kBg = Color(0xFFF8F8F8);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  final List<String> _quotes = [
    "Always start with Bismillahi Tawakkaltu Ala Allah"
    "Every expert was once a beginner.",
    "What will happen, will happen.",
    "For my future, here I am.",
  ];
  int _quoteIndex = 0;
  Timer? _quoteTimer;
  bool _bioExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() => _scrollOffset = _scrollController.offset);
    });
    _quoteTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() => _quoteIndex = (_quoteIndex + 1) % _quotes.length);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _quoteTimer?.cancel();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    const heroHeight = 280.0;
    final heroOpacity = (1 - _scrollOffset / 150).clamp(0.0, 1.0);
    final parallaxOffset = _scrollOffset * 0.35;

    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        children: [
          // ── HERO IMAGE ──────────────────────────────────────────
          Positioned(
            top: 0, left: 0, right: 0,
            height: heroHeight,
            child: Opacity(
              opacity: heroOpacity,
              child: ClipRect(
                child: Transform.translate(
                  offset: Offset(0, parallaxOffset),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/hero_bg.jpg',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x66000000),
                              Color(0x33000000),
                              Color(0x00000000),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 60, left: 22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, I am',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Shafiena\nUsri',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w900,
                                height: 1.05,
                                shadows: [
                                  Shadow(
                                    color: Color(0xCC000000),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Front End Designer | Part Time Dev',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── SCROLLABLE CONTENT ──────────────────────────────────
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 230),
                Container(
                  color: kBg,
                  child: Column(
                    children: [

                      // ── OVAL PROFILE PHOTO ────────────────────
                      Transform.translate(
                        offset: const Offset(0, -55),
                        child: Container(
                          width: 96,
                          height: 116,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 24,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(56),
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Transform.translate(
                        offset: const Offset(0, -44),
                        child: Column(
                          children: [

                            // ── NAME & TITLE ─────────────────────
                            const Text(
                              'Shafiena Binti Usri',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'SOFTWARE ENGINEERING · UPSI',
                              style: TextStyle(
                                fontSize: 10,
                                color: kPink,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Divider(
                              height: 1,
                              color: Color(0xFFF0F0F0),
                              indent: 20,
                              endIndent: 20,
                            ),
                            const SizedBox(height: 16),

                            // ── STATS ROW ────────────────────────
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  _StatCard(value: '3.96', label: 'CGPA'),
                                  SizedBox(width: 8),
                                  _StatCard(value: 'Yr 3', label: 'Year'),
                                  SizedBox(width: 8),
                                  _StatCard(value: 'FKMT', label: 'Faculty'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),

                            // ── PERSONAL INFO ─────────────────────
                            const _SectionCard(
                              title: 'Personal Info',
                              child: Column(
                                children: [
                                  _InfoRow(icon: Icons.cake_outlined, label: 'Date of Birth', value: '6 July 2004'),
                                  _InfoRow(icon: Icons.location_on_outlined, label: 'State', value: 'Kuala Lumpur, Malaysia'),
                                  _InfoRow(icon: Icons.school_outlined, label: 'Faculty', value: 'FKMT, UPSI'),
                                  _InfoRow(icon: Icons.badge_outlined, label: 'Student ID', value: 'D20231106426'),
                                  _InfoRow(icon: Icons.calendar_today_outlined, label: 'Semester', value: '6th Semester'),
                                  _InfoRow(icon: Icons.email_outlined, label: 'Email', value: 'shafienausri@gmail.com'),
                                  _InfoRow(icon: Icons.phone_outlined, label: 'Phone', value: '+60 11-1971 0155', isLast: true),
                                ],
                              ),
                            ),

                            // ── ABOUT ME ──────────────────────────
                            _SectionCard(
                              title: 'Who am I ?',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _bioExpanded
                                        ? 'A part time developer | Student in Universiti Pendidikan Sultan Idris, Tanjong Malim. Passionate about front-end design and mobile development. '
                                        : 'A part time developer | Student in Universiti Pendidikan Sultan Idris, Tanjong Malim.',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF555555),
                                      height: 1.7,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () => setState(() => _bioExpanded = !_bioExpanded),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kPink),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        _bioExpanded ? 'Read Less ▲' : 'Read More ▼',
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: kPink,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ── QUOTE ROTATOR ─────────────────────
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: const Border(
                                    left: BorderSide(color: kPink, width: 3),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.06),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '💬  QUOTE',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: kPink,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 400),
                                      child: Text(
                                        '"${_quotes[_quoteIndex]}"',
                                        key: ValueKey(_quoteIndex),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF444444),
                                          fontStyle: FontStyle.italic,
                                          height: 1.6,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        _quotes.length,
                                        (i) => AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          margin: const EdgeInsets.symmetric(horizontal: 2),
                                          width: i == _quoteIndex ? 14 : 5,
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: i == _quoteIndex ? kPink : const Color(0xFFE5E7EB),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // ── CONTACT ICONS ─────────────────────
                            _SectionCard(
                              title: 'Contact Me',
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _ContactBtn(
                                    icon: Icons.email_outlined,
                                    label: 'Email',
                                    onTap: () => _launchUrl('mailto:shafienausri@gmail.com'),
                                  ),
                                  _ContactBtn(
                                    icon: Icons.phone_outlined,
                                    label: 'Phone',
                                    onTap: () => _launchUrl('tel:+601119710155'),
                                  ),
                                  _ContactBtn(
                                    icon: Icons.code,
                                    label: 'GitHub',
                                    onTap: () => _launchUrl('https://github.com/MissFiena/'),
                                  ),
                                  _ContactBtn(
                                    icon: Icons.work_outline,
                                    label: 'LinkedIn',
                                    onTap: () => _launchUrl('https://linkedin.com/in/missfiena-abc123'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── WIDGETS ───────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String value, label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: kPink)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 9, color: Color(0xFF9CA3AF), letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF1A1A1A))),
            const SizedBox(height: 4),
            Container(width: 28, height: 2.5, decoration: BoxDecoration(color: kPink, borderRadius: BorderRadius.circular(4))),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final bool isLast;
  const _InfoRow({required this.icon, required this.label, required this.value, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF9CA3AF)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 9, color: Color(0xFF9CA3AF), letterSpacing: 0.5)),
                  const SizedBox(height: 1),
                  Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
                ],
              ),
            ),
          ],
        ),
        if (!isLast) ...[
          const SizedBox(height: 8),
          const Divider(height: 1, color: Color(0xFFF9F9F9)),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _ContactBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactBtn({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              color: kPinkLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kPink.withOpacity(0.2)),
              boxShadow: [BoxShadow(color: kPink.withOpacity(0.1), blurRadius: 8)],
            ),
            child: Icon(icon, color: kPink, size: 22),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 9, color: Color(0xFF888888), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}