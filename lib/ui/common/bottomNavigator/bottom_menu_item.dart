/*import 'package:visitbj/export.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onTap, required this.color,
      })
      : super(key: key);
  final String label;
  final String icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppInkwell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset( icon,width: 24,height: 24,
          ),
          const SpaceH(6),
          Text(
              label,
              style:  AppTypography().authText.copyWith(color: color,fontSize: 14)
          )        ],
      ),
    );
  }
}
*/