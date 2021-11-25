import 'package:bodyapp/shared/colors.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bodyapp/shared/widgets/widgets.dart';

class DietaScreen extends StatelessWidget {
  static const String pageName = 'dieta';

  final meals = ['café da manhã', 'almoço', 'café da tarde', 'jantar'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dieta'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DirectSelectContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Sugestões para refeições',
                  style: GoogleFonts.roboto(fontSize: 18 / 568 * height),
                ),
              ),
              SelectObjetivoWidget(
                items: ['dieta recomendada'],
              ),
              ...meals.map(
                (m) => MealCard(meal: m),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String meal;

  const MealCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 12,
        child: Container(
          height: 95 / 568 * height,
          width: 261 / 320 * width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$meal:',
                  style: GoogleFonts.roboto(
                    color: AppColors.teal,
                    fontSize: 14 / 568 * height,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
