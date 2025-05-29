import 'package:liberty_app/constants/utils/exports.dart';
import 'package:liberty_app/screens/task/all_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<AnalyticsModel> analytics = AnalyticsModelListData.getAnalyticsList();

  List<TaskModel> task = TaskModelListData.getTaskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoItColors.thinGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DoItColors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp, right: 20.sp,
                  top: 20.sp, bottom: 30.sp,
                  ),
                  child: Column(
                    children: [
                      ///////////////////////////////////////////////////////////
                      ///*************** HEADER SECTION ******************/
                      ///////////////////////////////////////////////////////////
                      HomeHeaderWidget(
                        name: 'Dexter',
                        onNotificationTap: (){},
                      ),
                      SizedBox(height: 20.sp,),
                
                      ///////////////////////////////////////////////////////////
                      ///*************** BODY SECTION *******************/
                      ///////////////////////////////////////////////////////////
                      Wrap(
                        runSpacing: 20.sp,
                        spacing: 20.sp,
                        children: [
                          ...List.generate(analytics.length, (index)
                          => AnalytiticsWidgets(
                            icon: analytics[index].icon,
                            title: analytics[index].title,
                            number: analytics[index].number,
                            iconSize: index == 2 ? 14.sp : 20.sp,
                            bigBoxColor: analytics[index].bigBoxColor,
                            smallBoxColor: analytics[index].smallBoxColor,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              ///////////////////////////////////////////////////////////
              ///*************** BODY SECTION *******************/
              ///////////////////////////////////////////////////////////
              Padding(
                padding: EdgeInsets.only(left: 20.sp, right: 20.sp,
                  top: 30.sp, bottom: 30.sp,
                ),
                child: Column(
                  children: [
                    SubHeaderWidget(
                      leadText: 'Task in Progress',
                      trailText: 'See all',
                      onTap: (){
                        nextScreen(context, const AllTaskScreen());
                      },
                    ),
                    SizedBox(height: 20.sp,),

                    ...List.generate(task.length > 4 ? 4 : task.length, (index)
                    => Column(
                      children: [
                        TaskWidget(
                          taskTitle: task[index].taskTitle,
                          percentageText: task[index].percentageText,
                          percentage: task[index].percentage,
                          createdTime: task[index].createdTime,
                          startDate: task[index].startDate,
                          endDate: task[index].endDate,
                          members: task[index].members,
                        ),
                        SizedBox(height: 15.sp,)
                      ],
                    )),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}