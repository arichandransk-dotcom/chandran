import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ArichandranPortfolioApp());
}

class ArichandranPortfolioApp extends StatelessWidget {
  const ArichandranPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arichandran - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF2563EB),
          secondary: Color(0xFF7C3AED),
          surface: Color(0xFF151829),
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: const Color(0xFFE2E8F0),
          displayColor: Colors.white,
        ),
      ),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _certificationsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A1A).withOpacity(0.95),
        elevation: 0,
        title: RichText(
          text: TextSpan(
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800),
            children: const [
              TextSpan(text: 'Ari', style: TextStyle(color: Color(0xFF60A5FA))),
              TextSpan(text: 'chandran', style: TextStyle(color: Color(0xFFEC4899))),
            ],
          ),
        ),
        actions: isDesktop
            ? [
                _navButton('About', _aboutKey),
                _navButton('Skills', _skillsKey),
                _navButton('Experience', _experienceKey),
                _navButton('Projects', _projectsKey),
                _navButton('Education', _educationKey),
                _navButton('Certifications', _certificationsKey),
                _navButton('Contact', _contactKey),
                const SizedBox(width: 20),
              ]
            : null,
      ),
      drawer: isDesktop
          ? null
          : Drawer(
              backgroundColor: const Color(0xFF0A0A1A),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF7C3AED)]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Arichandran', style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white)),
                        Text('MERN & Flutter Developer', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFFE2E8F0))),
                      ],
                    ),
                  ),
                  _drawerItem('About', _aboutKey),
                  _drawerItem('Skills', _skillsKey),
                  _drawerItem('Experience', _experienceKey),
                  _drawerItem('Projects', _projectsKey),
                  _drawerItem('Education', _educationKey),
                  _drawerItem('Certifications', _certificationsKey),
                  _drawerItem('Contact', _contactKey),
                ],
              ),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(key: _heroKey, child: _buildHeroSection(isDesktop)),
            _buildStatsSection(isDesktop),
            Container(key: _aboutKey, child: _buildAboutSection(isDesktop)),
            Container(key: _skillsKey, child: _buildSkillsSection(isDesktop)),
            Container(key: _experienceKey, child: _buildExperienceSection(isDesktop)),
            Container(key: _projectsKey, child: _buildProjectsSection(isDesktop)),
            Container(key: _educationKey, child: _buildEducationSection(isDesktop)),
            Container(key: _certificationsKey, child: _buildCertificationsSection(isDesktop)),
            Container(key: _contactKey, child: _buildContactSection(isDesktop)),
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(title, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _drawerItem(String title, GlobalKey key) {
    return ListTile(
      title: Text(title, style: GoogleFonts.inter(color: const Color(0xFFE2E8F0), fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key);
      },
    );
  }

  // ==================== HERO SECTION ====================
  Widget _buildHeroSection(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 40.0),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: isDesktop ? 2 : 0,
            child: Column(
              crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF2563EB).withOpacity(0.2), const Color(0xFF7C3AED).withOpacity(0.2)]),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.waving_hand, size: 14, color: Color(0xFF60A5FA)),
                      const SizedBox(width: 8),
                      Text("Hello, I'm", style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF60A5FA), fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Arichandran",
                  style: GoogleFonts.inter(fontSize: isDesktop ? 54 : 36, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1),
                ),
                const SizedBox(height: 10),
                Text(
                  "MERN & Flutter Developer · Basic Java Programmer · DSA Programmer · B.Sc IT",
                  textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                  style: GoogleFonts.inter(fontSize: isDesktop ? 18 : 14, color: const Color(0xFF94A3B8), height: 1.5),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color(0xFF2563EB).withOpacity(0.15), const Color(0xFF7C3AED).withOpacity(0.15)]),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.25)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.rocket_launch, size: 14, color: Color(0xFFA78BFA)),
                      const SizedBox(width: 8),
                      Text("Open to Software Developer & Full Stack roles · 2026", style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFFA78BFA), fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _scrollToSection(_aboutKey),
                      icon: const Icon(Icons.person, size: 16),
                      label: const Text("About"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _scrollToSection(_skillsKey),
                      icon: const Icon(Icons.code, size: 16),
                      label: const Text("Skills"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFF2563EB), width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _scrollToSection(_contactKey),
                      icon: const Icon(Icons.email, size: 16),
                      label: const Text("Contact Me"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEC4899),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isDesktop) const SizedBox(height: 40),
          Container(
            width: isDesktop ? 180 : 140,
            height: isDesktop ? 180 : 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF7C3AED), Color(0xFFEC4899)]),
              boxShadow: [BoxShadow(color: const Color(0xFF2563EB).withOpacity(0.2), blurRadius: 40, offset: const Offset(0, 10))],
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF0F172A),
                image: DecorationImage(image: AssetImage('avatar.jpg'), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================== STATS SECTION ====================
  Widget _buildStatsSection(bool isDesktop) {
    final stats = [
      {'val': '8.55', 'lbl': 'CGPA B.SC IT', 'ico': Icons.star, 'col': const Color(0xFFFBBF24)},
      {'val': '94.2%', 'lbl': 'SSLC', 'ico': Icons.school, 'col': const Color(0xFF60A5FA)},
      {'val': '3+', 'lbl': 'Hackathons', 'ico': Icons.code, 'col': const Color(0xFFA78BFA)},
      {'val': '4', 'lbl': 'Certifications', 'ico': Icons.card_membership, 'col': const Color(0xFFEC4899)},
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0A1A).withOpacity(0.7),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Center(
        child: Wrap(
          spacing: 30,
          runSpacing: 25,
          children: stats.map((stat) {
            return Container(
              width: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF151829).withOpacity(0.4),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  Text(stat['val'] as String, style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w900, color: const Color(0xFF60A5FA))),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(stat['ico'] as IconData, size: 14, color: stat['col'] as Color),
                      const SizedBox(width: 6),
                      Text(stat['lbl'] as String, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8), fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ==================== ABOUT SECTION ====================
  Widget _buildAboutSection(bool isDesktop) {
    final highlights = [
      {'emo': '🏆', 't': '1st Prize — Debugging Event', 's': 'Symposium, KPRCAS'},
      {'emo': '🏆', 't': '3rd Prize — Java Technical Quiz', 's': 'Fiesta 2025, KPRET'},
      {'emo': '🏆', 't': '2nd Prize — Paper Presentation', 's': 'Hindustan College'},
      {'emo': '🏋️', 't': '3rd Prize — Powerlifting', 's': 'Bharathiyar University'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("01 / ABOUT"),
          const SizedBox(height: 10),
          Text("A focused IT student, ready for the real world.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: isDesktop ? 2 : 0,
                child: Column(
                  children: [
                    _aboutParagraph(Icons.rocket_launch, "I'm an enthusiastic Information Technology undergraduate with a strong foundation in MERN Stack development, Data Structures & Algorithms, and problem-solving. I'm currently expanding my skills through hands-on projects and continuous learning."),
                    const SizedBox(height: 20),
                    _aboutParagraph(Icons.lightbulb_outline, "I genuinely enjoy turning ideas into working software — whether that's a full-stack web application or an AI assistant that understands context. I learn fast, communicate clearly, and treat every project like it has real users on the other side."),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [const Color(0xFF2563EB).withOpacity(0.08), const Color(0xFF7C3AED).withOpacity(0.08)]),
                        borderRadius: BorderRadius.circular(16),
                        border: const Border(left: BorderSide(color: Color(0xFF7C3AED), width: 4)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.fitness_center, color: Color(0xFFA78BFA), size: 20),
                          const SizedBox(width: 14),
                          Expanded(child: Text("Outside of code, I'm a powerlifter and a CrossFit trainer of three years. Same mindset, just different reps.", style: GoogleFonts.inter(fontSize: 15, fontStyle: FontStyle.italic, color: const Color(0xFF94A3B8), height: 1.6))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: highlights.map((h) => _highlightChip(h['emo']!, h['t']!, h['s']!)).toList(),
                    ),
                  ],
                ),
              ),
              if (!isDesktop) const SizedBox(height: 40),
              if (isDesktop) const SizedBox(width: 40),
              SizedBox(
                width: isDesktop ? 300 : double.infinity,
                child: Column(
                  children: [
                    _sidebarCard(Icons.school, "Education", "B.Sc Information Technology", "KPR College · 2024-Present"),
                    const SizedBox(height: 14),
                    _sidebarCard(Icons.work, "Experience", "MERN Developer Intern", "App Innovation Technologies"),
                    const SizedBox(height: 14),
                    _sidebarCard(Icons.emoji_events, "Awards", "4+ Competition Wins", "Technical & Sports"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _aboutParagraph(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF60A5FA), size: 18),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF94A3B8), height: 1.8))),
      ],
    );
  }

  Widget _highlightChip(String emoji, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF151829).withOpacity(0.5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold, color: const Color(0xFFE2E8F0))),
              Text(subtitle, style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF64748B))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sidebarCard(IconData icon, String category, String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF151829).withOpacity(0.5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: const Color(0xFF60A5FA)),
          const SizedBox(height: 8),
          Text(category, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: const Color(0xFFE2E8F0))),
          const SizedBox(height: 4),
          Text(title, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
          Text(subtitle, style: GoogleFonts.inter(fontSize: 11, color: const Color(0xFF475569))),
        ],
      ),
    );
  }

  // ==================== SKILLS SECTION ====================
  Widget _buildSkillsSection(bool isDesktop) {
    final skillGroups = [
      {
        't': "Web, Mobile & Programming",
        'i': Icons.code,
        'col': const Color(0xFF60A5FA),
        'chips': [
          _skillChip("Flutter", Icons.phone_android, const Color(0xFF02569B)),
          _skillChip("React.js", Icons.web, const Color(0xFF61DAFB)),
          _skillChip("Node.js", Icons.javascript, const Color(0xFF68A063)),
          _skillChip("JavaScript", Icons.javascript, const Color(0xFFFACC15)),
          _skillChip("MongoDB", Icons.storage, const Color(0xFF22C55E)),
          _skillChip("HTML5", Icons.html, const Color(0xFFF97316)),
          _skillChip("CSS3", Icons.css, const Color(0xFF3B82F6)),
          _skillChip("Python", Icons.terminal, const Color(0xFF3B82F6)),
          _skillChip("Basic Java", Icons.coffee, const Color(0xFFF97316)),
        ]
      },
      {
        't': "DSA & Core Concepts",
        'i': Icons.psychology,
        'col': const Color(0xFFA78BFA),
        'chips': [
          _skillChipText("Data Structures & Algorithms"),
          _skillChipText("Object-Oriented Programming"),
          _skillChipText("Problem Solving"),
          _skillChipText("DBMS"),
        ]
      },
      {
        't': "Tools & Version Control",
        'i': Icons.build,
        'col': const Color(0xFF22C55E),
        'chips': [
          _skillChip("Git", Icons.commit, const Color(0xFFF97316)),
          _skillChip("GitHub", Icons.code, Colors.white),
          _skillChip("VS Code", Icons.code, const Color(0xFF3B82F6)),
          _skillChip("REST APIs", Icons.dns, const Color(0xFF22C55E)),
        ]
      },
      {
        't': "Soft Skills",
        'i': Icons.groups,
        'col': const Color(0xFFFBBF24),
        'chips': [
          _skillChipText("Quick Learner"),
          _skillChipText("Team Collaboration"),
          _skillChipText("Leadership"),
          _skillChipText("Time Management"),
          _skillChipText("Logical Thinking"),
        ]
      }
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("02 / SKILLS"),
          const SizedBox(height: 10),
          Text("The tools I reach for.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          Column(
            children: skillGroups.map((g) => Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: _skillsGroup(g['t'] as String, g['i'] as IconData, g['col'] as Color, g['chips'] as List<Widget>),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _skillsGroup(String title, IconData icon, Color color, List<Widget> chips) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A1A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: color),
              const SizedBox(width: 12),
              Text(title, style: GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700, color: const Color(0xFFE2E8F0))),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(spacing: 12, runSpacing: 12, children: chips),
        ],
      ),
    );
  }

  Widget _skillChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF151829).withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF94A3B8))),
        ],
      ),
    );
  }

  Widget _skillChipText(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF151829).withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.15)),
      ),
      child: Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF94A3B8))),
    );
  }

  // ==================== EXPERIENCE SECTION ====================
  Widget _buildExperienceSection(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("03 / EXPERIENCE"),
          const SizedBox(height: 10),
          Text("Where I'm learning the craft.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            spacing: 26,
            children: [
              Expanded(
                flex: isDesktop ? 1 : 0,
                child: _experienceCard(
                  "📱",
                  "MERN Developer Intern",
                  "App Innovation Technologies · Coimbatore",
                  [
                    "Building full-stack web applications using MERN stack",
                    "Developing RESTful APIs with Node.js & Express",
                    "Creating responsive UI components with React.js",
                    "Collaborating in an agile dev team",
                  ],
                ),
              ),
              Expanded(
                flex: isDesktop ? 1 : 0,
                child: _experienceCard(
                  "👥",
                  "Class Representative",
                  "KPR College of Arts, Science & Research · 2 years",
                  [
                    "Coordinated student-faculty communication",
                    "Organised academic activities",
                    "Represented the class across departmental events",
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _experienceCard(String emoji, String role, String company, List<String> details) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A1A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 12),
          Text(role, style: GoogleFonts.inter(fontSize: 19, fontWeight: FontWeight.w700, color: Colors.white)),
          Text(company, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF94A3B8))),
          const SizedBox(height: 14),
          Column(
            children: details.map((detail) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.arrow_forward, size: 12, color: Color(0xFF60A5FA)),
                    const SizedBox(width: 12),
                    Expanded(child: Text(detail, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF94A3B8)))),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ==================== PROJECTS SECTION ====================
  Widget _buildProjectsSection(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("04 / PROJECTS"),
          const SizedBox(height: 10),
          Text("Things I've built.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            spacing: 30,
            children: [
              Expanded(
                flex: isDesktop ? 1 : 0,
                child: _projectCard(
                  "🏋️",
                  "Supplement & Performance Store",
                  "Full-stack cross-platform e-commerce application built with Flutter and Node.js. Includes offline local database fallback, anti-fraud UPI payment deep-linking, and a secure admin dashboard for sales management.",
                  ["Flutter", "Node.js", "Firebase"],
                  ["Offline database fallback (zero-downtime)", "Secure UPI payments (UTR verification)", "Admin dashboard (role-based access)"],
                ),
              ),
              Expanded(
                flex: isDesktop ? 1 : 0,
                child: _projectCard(
                  "🤖",
                  "AI-Powered Virtual Avatar",
                  "Conversational AI built with Python and NLP using a RAG-based architecture for context-aware, dynamic responses. Presented at NGPCAS and Excel Engineering College.",
                  ["Python", "NLP", "LLM APIs", "RAG"],
                  ["RAG pipeline", "Context memory", "Voice-ready"],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _projectCard(String emoji, String title, String desc, List<String> tech, List<String> features) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A1A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 10),
          Text(title, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 10),
          Text(desc, style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF94A3B8), height: 1.8)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech.map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB).withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.2)),
              ),
              child: Text(t, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xFF60A5FA))),
            )).toList(),
          ),
          const SizedBox(height: 14),
          Column(
            children: features.map((f) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 16, color: Color(0xFF22C55E)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(f, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8)))),
                ],
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // ==================== EDUCATION SECTION ====================
  Widget _buildEducationSection(bool isDesktop) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("05 / EDUCATION"),
          const SizedBox(height: 10),
          Text("Academic background.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            spacing: 22,
            children: [
              Expanded(flex: isDesktop ? 1 : 0, child: _educationCard("🎓", "B.Sc. Information Technology", "KPR College of Arts & Science", "2024 - Present", "CGPA 8.55")),
              Expanded(flex: isDesktop ? 1 : 0, child: _educationCard("📚", "HSC - Arts Stream", "AKN Higher Secondary School", "2022 - 2024", "82%")),
              Expanded(flex: isDesktop ? 1 : 0, child: _educationCard("📖", "SSLC", "AKN Higher Secondary School", "2021 - 2022", "94.2%")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _educationCard(String emoji, String degree, String institution, String years, String score) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A1A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.12)),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 10),
          Text(degree, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(institution, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF94A3B8))),
          const SizedBox(height: 4),
          Text(years, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF475569))),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF7C3AED)]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(score, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ==================== CERTIFICATIONS SECTION ====================
  Widget _buildCertificationsSection(bool isDesktop) {
    final certs = [
      {'e': "🧠", 't': "Perspectives on Neurolinguistics", 'i': "NPTEL — Elite Certification"},
      {'e': "☕", 't': "Java (Basic & Intermediate)", 'i': "HackerRank Certified"},
      {'e': "📊", 't': "Data Structures & Algorithms", 'i': "HackerRank Certified"},
      {'e': "🤖", 't': "Robotics Business Plan", 'i': "Robothan 2K26"},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("06 / CERTIFICATIONS"),
          const SizedBox(height: 10),
          Text("Credentials & courses.", style: GoogleFonts.inter(fontSize: isDesktop ? 36 : 26, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 30),
          GridView.count(
            crossAxisCount: isDesktop ? 4 : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: isDesktop ? 1.2 : 1.5,
            children: certs.map((c) => _certificationCard(c['e']!, c['t']!, c['i']!)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _certificationCard(String emoji, String title, String issuer) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A1A).withOpacity(0.6),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 36)),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFFE2E8F0))),
          const SizedBox(height: 4),
          Text(issuer, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8))),
        ],
      ),
    );
  }

  // ==================== CONTACT & FOOTER ====================
  Widget _buildContactSection(bool isDesktop) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF0A0A1A).withOpacity(0.95), const Color(0xFF140A2E).withOpacity(0.95)],
        ),
        border: const Border(top: BorderSide(color: Color(0xFF2563EB), width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60.0 : 20.0, vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.rocket_launch, color: Color(0xFFFBBF24), size: 32),
              const SizedBox(width: 14),
              Text("Let's build something.", style: GoogleFonts.inter(fontSize: isDesktop ? 40 : 28, fontWeight: FontWeight.w900, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            "I'm actively looking for software developer and full-stack roles. If you're hiring or want to collaborate, I'd love to hear from you.",
            style: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF94A3B8), height: 1.8),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email, size: 20),
                label: const Text("Email Me"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.phone, size: 20),
                label: const Text("Contact Me"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE2E8F0),
                  side: BorderSide(color: const Color(0xFF2563EB).withOpacity(0.3), width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          Wrap(
            spacing: 35,
            runSpacing: 20,
            children: [
              _contactInfoItem(Icons.phone, "+91 6382562145"),
              _contactInfoItem(Icons.location_on, "Tiruppur, Tamil Nadu"),
              _contactInfoItem(Icons.email, "arichandran.s.k@gmail.com"),
            ],
          ),
          const SizedBox(height: 50),
          const Divider(color: Color(0xFF2563EB)),
          const SizedBox(height: 25),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.code),
                    const SizedBox(width: 28),
                    _socialIcon(Icons.link),
                    const SizedBox(width: 28),
                    _socialIcon(Icons.link),
                    const SizedBox(width: 28),
                    _socialIcon(Icons.play_circle),
                  ],
                ),
                const SizedBox(height: 20),
                Text("© 2026 Arichandran. All rights reserved.", style: GoogleFonts.inter(color: const Color(0xFF475569), fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactInfoItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xFF151829).withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF60A5FA)),
          const SizedBox(width: 14),
          Text(text, style: GoogleFonts.inter(color: const Color(0xFF94A3B8), fontSize: 15)),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Icon(icon, color: const Color(0xFF475569), size: 24);
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: const Color(0xFF60A5FA), letterSpacing: 3)),
        const SizedBox(width: 12),
        Container(width: 80, height: 2, color: const Color(0xFF2563EB)),
      ],
    );
  }
}
