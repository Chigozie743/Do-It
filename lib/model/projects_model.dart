
class ProjectModel {
  final String endDate;
  final String startDate;
  final String taskTitle;
  final String createdTime;

  ProjectModel({
    required this.endDate,
    required this.startDate,
    required this.taskTitle,
    required this.createdTime,
  });
}


///////////////////////////////////////////////////////////////////////////////
/// NEWS CATEGORY LIST
//////////////////////////////////////////////////////////////////////////////
class ProjectModelListData {
  static final List<ProjectModel> projectList = [
    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),
    ProjectModel(
      taskTitle: 'DO IT App',
      createdTime: '3d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),
    ProjectModel(
      taskTitle: 'Other App',
      createdTime: '7d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),
    ProjectModel(
      taskTitle: 'Liberty Development App',
      createdTime: '3d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '5d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '7d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

    ProjectModel(
      taskTitle: 'Liberty Pay Loan App',
      createdTime: '4d',
      startDate: '27-3-2022',
      endDate: '27-3-2022',
    ),

  ];

  static List<ProjectModel> getProjectList() {
    return projectList;
  }
}