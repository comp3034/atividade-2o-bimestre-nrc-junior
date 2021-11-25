import 'package:bodyapp/shared/colors.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuStyle = GoogleFonts.lato(
      fontSize: MediaQuery.of(context).size.height * (24 / 568),
      fontWeight: FontWeight.w700,
    );

    var subMenuStyle = GoogleFonts.lato(
      fontSize: MediaQuery.of(context).size.height * (14 / 568),
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopBarWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * (48 / 568),
            ),
            Column(
              children: [
                MenuItemWidget(
                  icon: Boxicons.bx_ruler,
                  label: 'Medidas',
                  textStyle: menuStyle,
                  iconSize: MediaQuery.of(context).size.height * (24 / 568),
                ),
                MenuItemWidget(
                  icon: Boxicons.bx_target_lock,
                  label: 'Objetivos',
                  textStyle: menuStyle,
                  iconSize: MediaQuery.of(context).size.height * (24 / 568),
                ),
                MenuItemWidget(
                  icon: Boxicons.bx_line_chart,
                  label: 'Progressão',
                  textStyle: menuStyle,
                  iconSize: MediaQuery.of(context).size.height * (24 / 568),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                children: [
                  MenuItemWidget(
                    icon: Boxicons.bx_slider_alt,
                    label: 'Configurações',
                    textStyle: subMenuStyle,
                    iconSize: MediaQuery.of(context).size.height * (16 / 568),
                  ),
                  MenuItemWidget(
                    icon: Boxicons.bx_log_out,
                    label: 'Logout',
                    textStyle: subMenuStyle,
                    iconSize: MediaQuery.of(context).size.height * (16 / 568),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final TextStyle? textStyle;
  final double? iconSize;

  MenuItemWidget({
    this.icon,
    this.label = 'Label',
    this.textStyle,
    this.iconSize = 24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * (43 / 320),
          top: MediaQuery.of(context).size.width * (24 / 568),
          bottom: MediaQuery.of(context).size.width * (24 / 568),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.info_outline,
              size: iconSize,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * (18 / 320)),
              child: Text(
                '$label',
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.teal,
      height: MediaQuery.of(context).size.height * (161 / 568),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(child: SizedBox()),
              Container(
                width: (MediaQuery.of(context).size.width * (128 / 320)),
                height: MediaQuery.of(context).size.height * (161 / 568),
                child: CustomPaint(
                  painter: Triangule(color: AppColors.teal[300]),
                ),
              ),
            ],
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          (MediaQuery.of(context).size.width * (22 / 320))),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.height * (32 / 568),
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  'John Doe',
                  style: GoogleFonts.lato(
                    fontSize: MediaQuery.of(context).size.height * (36 / 568),
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Triangule extends CustomPainter {
  final Color? color;

  Triangule({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height - 20);
    path.close();

    Paint paint = Paint()
      ..color = color ?? Colors.green
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    // final Rect rect = Offset.zero & size;
    // const RadialGradient gradient = RadialGradient(
    //   center: Alignment(0.7, -0.6),
    //   radius: 0.2,
    //   colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
    //   stops: <double>[0.4, 1.0],
    // );
    // canvas.drawRect(
    //   rect,
    //   Paint()..shader = gradient.createShader(rect),
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
