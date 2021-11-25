import 'dart:convert';

import 'package:bodyapp/dieta/dieta.dart';
import 'package:bodyapp/objetivos/ui/screens/screens.dart';
import 'package:bodyapp/shared/widgets/widgets.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';

import 'package:bodyapp/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ObjetivosScreen extends StatefulWidget {
  static const String pageName = 'objetivos';

  @override
  _ObjetivosScreenState createState() => _ObjetivosScreenState();
}

class _ObjetivosScreenState extends State<ObjetivosScreen> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Objetivos'),
          centerTitle: true,
          bottom: ColoredTabBar(
            color: Colors.white,
            tabBar: TabBar(
              onTap: (index) {
                setState(() {
                  tabIndex = index;
                });
              },
              indicatorColor: AppColors.teal,
              labelColor: AppColors.teal,
              tabs: [Tab(text: 'Personalizado'), Tab(text: 'Recomendado')],
            ),
          ),
        ),
        body: TabBarView(
          children: [PersonalizadoViewWidget(), RecomendadoViewWidget()],
        ),
        floatingActionButton: tabIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MaisDietasScreen(),
                    ),
                  );
                },
                backgroundColor: AppColors.teal,
                child: Icon(Icons.add, color: Colors.white),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class RecomendadoViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 24),
          CardsSectionWidget(),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Peso ideal: 75 kg'),
                        Container(
                          color: Colors.orange,
                          width: 128,
                          height: 2,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Objetivo:'),
                    Text('Ganhar 5 kg'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: FittedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, right: 32),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DietaScreen(),
                  ),
                );
              },
              child: Container(
                height: (32 / 568 * MediaQuery.of(context).size.height),
                width: (107 / 320 * MediaQuery.of(context).size.width),
                alignment: Alignment.center,
                child: Text('Dieta',
                    style: GoogleFonts.roboto(
                        fontSize:
                            (18 / 568 * MediaQuery.of(context).size.height))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardsSectionWidget extends StatelessWidget {
  const CardsSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MeasureCard(
          label: 'peso atual',
          value: '73',
          measure: 'kg',
        ),
        SizedBox(width: 16),
        MeasureCard(
          label: 'imc'.toUpperCase(),
          value: '22',
          measure: '',
          type: CardType.white,
        ),
      ],
    );
  }
}

class PersonalizadoViewWidget extends StatelessWidget {
  final String value = '';
  final List<String> _items = [
    "Chicken grilled",
    "Pork grilled",
    "Vegetables as is",
    "Cheese as is",
    "Bread tasty"
  ];

  final List<Objetivo> objetivos = [
    Objetivo(
        title: 'Comer de 3 em 3 horas',
        cover: 'image_01.png',
        text:
            'Comer a cada 3 horas é importante para aumentar o consumo de calorias ao longo do dia e favorecer o ganho de peso, já que é recomendado '),
    Objetivo(
        title: 'Incluir proteínas em todas as refeições',
        cover: 'image_02.png',
        text:
            'Incluir proteínas em todas as refeições do dia faz com que os níveis de aminoácidos no sangue fiquem '),
    Objetivo(
        title: 'Consumir gorduras boas',
        cover: 'image_03.png',
        text:
            'Alimentos fontes de gorduras boas como castanhas, amendoim, abacate, coco, azeite e sementes são ótimas opções para aumentar as calorias da '),
    Objetivo(
        title: 'Comer pelo menos 3 frutas por dia',
        cover: 'image_04.png',
        text:
            'Consumir pelo menos 3 frutas por dia e adicionar salada de verduras ou legumes no almoço e no jantar ajuda '),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return DirectSelectContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24.0,
            right: 16,
            left: 16,
          ),
          child: Column(
            children: [
              SelectObjetivoWidget(items: _items),
              SizedBox(height: 16),
              Container(
                height: 320.0 * objetivos.length,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: objetivos.length,
                  itemBuilder: (context, index) {
                    Objetivo objetivo = objetivos[index];
                    return DietaCardWidget(objetivo: objetivo);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DietaCardWidget extends StatelessWidget {
  const DietaCardWidget({
    Key? key,
    required this.objetivo,
  }) : super(key: key);

  final Objetivo objetivo;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VisualizarMelhorScreen(
                objetivo: objetivo,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 80 / 568 * height,
                  child: Hero(
                    tag: objetivo.cover,
                    child: Image.asset(
                      'assets/images/${objetivo.cover}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${objetivo.title}',
                        style: GoogleFonts.lato(
                          fontSize: 13 / 568 * height,
                          color: AppColors.teal,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${objetivo.text}',
                        style: GoogleFonts.lato(fontSize: 10 / 568 * height),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ],
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

class Objetivo {
  String title;
  String cover;
  String text;
  bool isSelected;

  Objetivo({
    required this.title,
    required this.cover,
    required this.text,
    this.isSelected = false,
  });

  @override
  String toString() => 'Objetivos(title: $title, cover: $cover, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Objetivo &&
        other.title == title &&
        other.cover == cover &&
        other.text == text;
  }

  @override
  int get hashCode => title.hashCode ^ cover.hashCode ^ text.hashCode;
}

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  ColoredTabBar({this.color = AppColors.teal, required this.tabBar})
      : super(color: color, child: tabBar);

  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}
