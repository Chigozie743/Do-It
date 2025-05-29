// import 'dart:ui';
import 'package:liberty_app/constants/utils/exports.dart';


class TaskModel {
  final String endDate;
  final String startDate;
  final String taskTitle;
  final String createdTime;
  final double percentage;
  final String percentageText;
  final List<String> members;

  TaskModel({
    required this.percentage,
    required this.endDate,
    required this.startDate,
    required this.taskTitle,
    required this.createdTime,
    required this.percentageText,
    required this.members,
  });
}


///////////////////////////////////////////////////////////////////////////////
/// NEWS CATEGORY LIST
//////////////////////////////////////////////////////////////////////////////
class TaskModelListData {
  static final List<TaskModel> taskList = [
    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '40%',
      percentage: 0.40,
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),
    TaskModel(
      taskTitle: 'DO IT App',
      percentageText: '70%',
      percentage: 0.70,
      createdTime: '3d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team3Image,
      ],
    ),
    TaskModel(
      taskTitle: 'Other App',
      percentageText: '20%',
      percentage: 0.20,
      createdTime: '7d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
      ],
    ),
    TaskModel(
      taskTitle: 'Liberty Development App',
      percentageText: '50%',
      percentage: 0.50,
      createdTime: '3d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team3Image,
      ],
    ),

    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '10%',
      percentage: 0.10,
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),

    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '40%',
      percentage: 0.40,
      createdTime: '5d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),

    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '40%',
      percentage: 0.40,
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),

    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '40%',
      percentage: 0.40,
      createdTime: '7d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),

    TaskModel(
      taskTitle: 'Liberty Pay Loan App',
      percentageText: '40%',
      percentage: 0.40,
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
      members: [
        DoItAssetsPath.team1Image,
        DoItAssetsPath.team2Image,
        DoItAssetsPath.team3Image,
      ],
    ),

  ];

  static List<TaskModel> getTaskList() {
    return taskList;
  }
}