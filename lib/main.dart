import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const BirthdayApp());

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birthday Quest',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE77931),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.fredokaTextTheme(ThemeData.dark().textTheme),
        primaryTextTheme:
            GoogleFonts.fredokaTextTheme(ThemeData.dark().primaryTextTheme),
        scaffoldBackgroundColor: const Color(0xFF17131F),
      ),
      home: const BirthdayPage(),
    );
  }
}

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const CustomPaint(painter: PixelNightPainter()),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => CustomPaint(
              painter: FallingLeavesPainter(_animation.value),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 820),
                  child: const _BirthdayCard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BirthdayCard extends StatelessWidget {
  const _BirthdayCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 34, 24, 30),
      decoration: BoxDecoration(
        color: const Color(0xE6291E31),
        border: Border.all(color: const Color(0xFFFFA347), width: 4),
        boxShadow: const [
          BoxShadow(color: Color(0xFF09070D), offset: Offset(9, 9)),
          BoxShadow(color: Color(0xFF7D3A2A), offset: Offset(-5, -5)),
        ],
      ),
      child: Column(
        children: [
          const _PixelPumpkin(),
          const SizedBox(height: 24),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'HAPPY BIRTHDAY M!!',
              semanticsLabel: 'Happy birthday M!',
              style: TextStyle(
                color: const Color(0xFFFFD36A),
                fontSize: 52,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                shadows: const [
                  Shadow(color: Color(0xFF9B3F2B), offset: Offset(4, 4)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'May your next trip around the sun be full of\nrare loot, cozy nights, and excellent adventures.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFF1CE),
              fontSize: 17,
              height: 1.55,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'LEVEL UP  +25',
            style: TextStyle(
              color: Color(0xFFB9D66B),
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _PixelPumpkin extends StatelessWidget {
  const _PixelPumpkin();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'A smiling pixel pumpkin wearing a party hat',
      child: const SizedBox(
        width: 150,
        height: 130,
        child: CustomPaint(painter: PumpkinPainter()),
      ),
    );
  }
}

class PumpkinPainter extends CustomPainter {
  const PumpkinPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const p = 10.0;
    final orange = Paint()..color = const Color(0xFFE9652B);
    final light = Paint()..color = const Color(0xFFFF9138);
    final dark = Paint()..color = const Color(0xFF4A2331);
    final green = Paint()..color = const Color(0xFF77934A);
    final yellow = Paint()..color = const Color(0xFFFFD36A);

    void block(Paint paint, double x, double y, double w, double h) {
      canvas.drawRect(Rect.fromLTWH(x * p, y * p, w * p, h * p), paint);
    }

    block(green, 6, 1, 3, 2);
    block(dark, 4, 3, 7, 1);
    block(orange, 2, 4, 11, 7);
    block(light, 1, 5, 3, 5);
    block(light, 11, 5, 3, 5);
    block(dark, 4, 6, 2, 2);
    block(dark, 9, 6, 2, 2);
    block(dark, 5, 9, 5, 1);
    block(dark, 3, 10, 2, 1);
    block(dark, 10, 10, 2, 1);
    block(yellow, 7, 0, 1, 1);
    block(yellow, 9, 1, 1, 1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PixelNightPainter extends CustomPainter {
  const PixelNightPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final sky = Paint()..color = const Color(0xFF17131F);
    canvas.drawRect(Offset.zero & size, sky);

    final moon = Paint()..color = const Color(0xFFFFD36A);
    canvas.drawRect(
      Rect.fromLTWH(size.width * .78, size.height * .09, 64, 64),
      moon,
    );
    final moonCut = Paint()..color = const Color(0xFF17131F);
    canvas.drawRect(
      Rect.fromLTWH(size.width * .78 + 20, size.height * .09, 50, 48),
      moonCut,
    );

    final hill = Paint()..color = const Color(0xFF241A2A);
    final path = Path()
      ..moveTo(0, size.height * .78)
      ..quadraticBezierTo(
        size.width * .3,
        size.height * .64,
        size.width * .58,
        size.height * .78,
      )
      ..quadraticBezierTo(
        size.width * .8,
        size.height * .89,
        size.width,
        size.height * .72,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, hill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FallingLeavesPainter extends CustomPainter {
  FallingLeavesPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const colors = [
      Color(0xFFE77931),
      Color(0xFFB64A2F),
      Color(0xFFFFCA70),
      Color(0xFF77934A),
    ];
    final random = math.Random(31);
    for (var i = 0; i < 30; i++) {
      final startX = random.nextDouble() * size.width;
      final speed = .45 + random.nextDouble() * .75;
      final y =
          ((random.nextDouble() + progress * speed) % 1.0) * (size.height + 30);
      final x = startX + math.sin(progress * math.pi * 2 + i) * 22;
      final paint = Paint()..color = colors[i % colors.length];
      canvas.save();
      canvas.translate(x, y - 15);
      canvas.rotate(progress * math.pi * 2 + i);
      canvas.drawRect(const Rect.fromLTWH(-5, -3, 10, 6), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant FallingLeavesPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
