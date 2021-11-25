import 'package:bodyapp/shared/colors.dart';
import 'package:bodyapp/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressaoScreen extends StatelessWidget {
  final List<String> medidas = [
    'altura',
    'peso',
    'pescoço',
    'peito',
    'cintura',
    'biceps',
    'coxa',
    'quadril',
    'panturrilha'
  ];
  ProgressaoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: (55 / 568) * MediaQuery.of(context).size.height,
        title: Text(
          'Progressão',
          style: GoogleFonts.roboto(
            fontSize: (24 / 568) * MediaQuery.of(context).size.height,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: MeasureFeatureOptions(features: medidas),
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MeasureCard(
                label: 'peso atual',
                value: '73',
                measure: 'kg',
              ),
              SizedBox(width: 24),
              MeasureCard(
                label: 'altura atual',
                value: '173',
                measure: 'cm',
                type: CardType.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MeasureFeatureOptions extends StatefulWidget {
  final List<String>? features;

  MeasureFeatureOptions({Key? key, this.features}) : super(key: key);

  @override
  _MeasureFeatureOptionsState createState() => _MeasureFeatureOptionsState();
}

class _MeasureFeatureOptionsState extends State<MeasureFeatureOptions> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List<Widget>.generate(
        widget.features!.length,
        (int index) {
          return ChoiceChip(
            label: Text('${widget.features![index]}'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
            backgroundColor: Colors.white,
            selectedColor: AppColors.teal,
          );
        },
      ).toList(),
    );
  }
}
