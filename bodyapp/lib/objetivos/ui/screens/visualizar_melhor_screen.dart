import 'package:bodyapp/objetivos/ui/screens/objetivos_screen.dart';
import 'package:bodyapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisualizarMelhorScreen extends StatelessWidget {
  static const String pageName = 'visualizar';
  final Objetivo objetivo;

  VisualizarMelhorScreen({required this.objetivo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Hero(
                tag: objetivo.cover,
                child: Image.asset(
                  'assets/images/${objetivo.cover}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            Positioned.fill(
              top: 181 / 568 * height,
              child: Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      objetivo.title,
                      style: GoogleFonts.lato(
                        color: AppColors.teal,
                        fontSize: 18 / 568 * height,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      objetivo.text,
                      style: GoogleFonts.lato(
                        fontSize: 14 / 568 * height,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
