import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class MedidasScreen extends StatelessWidget {
  const MedidasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medidas'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              height: height - 64,
              child: Image.asset(
                'assets/images/women-silhouette.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 8,
              left: width * .3,
              child: Text('atualizado em ${DateTime.now()}'),
            ),
            Positioned(
              right: 48,
              top: 48,
              child: Row(
                children: [
                  MeasureLabelWidget(
                    label: 'Altura',
                    value: '170',
                    measure: 'cm',
                  ),
                  SizedBox(width: 16),
                  MeasureLabelWidget(
                    label: 'Peso',
                    value: '70',
                    measure: 'kg',
                  ),
                ],
              ),
            ),
            NestedMeasureWidget(
              top: 188,
              left: 0,
              width: width * .5,
              label: 'Pescoço',
              value: '95',
              measure: ' cm',
            ),
            NestedMeasureWidget(
              top: 188 + 48,
              left: 0,
              width: width * .6,
              label: 'Peito',
              value: '95',
              measure: ' cm',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class NestedMeasureWidget extends StatelessWidget {
  NestedMeasureWidget({
    Key? key,
    required this.width,
    this.top = 0,
    this.left = 0,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  final double width;
  final double top;
  final double left;
  final String label;
  final String value;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8),
                child: DottedLine(
                  dashGapLength: 8,
                ),
              ),
            ),
            MeasureLabelWidget(
              label: '$label',
              value: '$value',
              measure: '$measure',
            ),
          ],
        ),
      ),
    );
  }
}

class MeasureLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final String measure;

  const MeasureLabelWidget({
    Key? key,
    required this.label,
    required this.value,
    this.measure = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label'),
        RichText(
          text: TextSpan(
            text: '$value',
            style: TextStyle(
              fontSize: 36,
            ),
            children: [
              TextSpan(
                text: ' $measure',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
