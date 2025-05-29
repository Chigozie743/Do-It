// import 'dart:ui';
import 'package:liberty_app/constants/utils/exports.dart';


class AnalyticsModel {
  final String title;
  final String number;
  final String icon;
  final Color bigBoxColor;
  final Color smallBoxColor;

  AnalyticsModel({
    required this.title,
    required this.number,
    required this.icon,
    required this.bigBoxColor,
    required this.smallBoxColor
  });
}


///////////////////////////////////////////////////////////////////////////////
/// NEWS CATEGORY LIST
//////////////////////////////////////////////////////////////////////////////
class AnalyticsModelListData {
  static final List<AnalyticsModel> analyticsList = [
    AnalyticsModel(
      title: "Projects",
      number: "15",
      icon: DoItAssetsPath.tripleGoodIcon,
      bigBoxColor: const Color(0xFFFCF4F0),
      smallBoxColor: const Color(0xFFF7A325),
    ),
    AnalyticsModel(
      title: "Tacks",
      number: "24",
      icon: DoItAssetsPath.boardIcon,
      bigBoxColor: const Color(0xFFF4F9FF),
      smallBoxColor: const Color(0xFF217AC0),
    ),
    AnalyticsModel(
      title: "Completed Task",
      number: "12",
      icon: DoItAssetsPath.singleGoodIcon,
      bigBoxColor: const Color(0xFFE9FFF0),
      smallBoxColor: const Color(0xFF12B76A),
    ),
    AnalyticsModel(
      title: "Overdue Task",
      number: "2",
      icon: DoItAssetsPath.boardRemoveIcon,
      bigBoxColor: const Color(0xFFF4F1F6),
      smallBoxColor: const Color(0xFFD1D1D1),
    ), 
  ];

  static List<AnalyticsModel> getAnalyticsList() {
    return analyticsList;
  }
}