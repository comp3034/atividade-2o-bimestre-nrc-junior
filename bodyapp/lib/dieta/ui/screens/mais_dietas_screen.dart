import 'package:bodyapp/objetivos/objetivos.dart';
import 'package:bodyapp/shared/colors.dart';
import 'package:flutter/material.dart';

class MaisDietasScreen extends StatelessWidget {
  static const String pageName = 'mais-dietas';

  final List<Objetivo> objetivos = [
    Objetivo(
      title: 'Comer de 3 em 3 horas',
      cover: 'image_01.png',
      text:
          'Comer a cada 3 horas é importante para aumentar o consumo de calorias ao longo do dia e favorecer o ganho de peso, já que é recomendado ',
      isSelected: true,
    ),
    Objetivo(
      title: 'Incluir proteínas em todas as refeições',
      cover: 'image_02.png',
      text:
          'Incluir proteínas em todas as refeições do dia faz com que os níveis de aminoácidos no sangue fiquem ',
      isSelected: true,
    ),
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
    Objetivo(
        title: 'Exercícios para glúteos e posterior da coxa',
        cover: 'image_05.png',
        text:
            '1. Agachamento \n O agachamento pode ser feito com o peso do próprio corpo ou com a barra'),
    Objetivo(
        title: 'Fazer algum exercício físico',
        cover: 'image_06.png',
        text:
            'O tipo do exercício não é o mais importante, mas sim a regularidade da prática, que deve ser feita pelo menos 3 vezes por semana. Além disso, ')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mais Dietas'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: objetivos.length,
        itemBuilder: (context, index) {
          Objetivo objetivo = objetivos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Opacity(
              opacity: objetivo.isSelected ? .6 : 1,
              child: Stack(
                children: [
                  DietaCardWidget(objetivo: objetivo),
                  Positioned(
                    bottom: 24,
                    right: 16,
                    child: objetivo.isSelected
                        ? Icon(
                            Icons.remove,
                            color: AppColors.teal,
                          )
                        : Icon(
                            Icons.add,
                            color: AppColors.teal,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 8),
      ),
    );
  }
}
