import 'package:liberty_app/constants/utils/exports.dart';

class AllTaskScreen extends StatefulWidget {
  const AllTaskScreen({super.key});

  @override
  State<AllTaskScreen> createState() => _AllTaskScreenState();
}

class _AllTaskScreenState extends State<AllTaskScreen> {

  List<TaskModel> task = TaskModelListData.getTaskList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DoItColors.thinGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20.sp,
            top: 20.sp, bottom: 30.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///////////////////////////////////////////////////////////
                ///*************** HEADER SECTION ******************/
                ///////////////////////////////////////////////////////////
                HeaderWidget(
                  headText: 'All task',
                  firstBodyText: ' ',
                  secondBodyText: ' ',
                  thirdBodyText: '',
                ),
                SizedBox(height: 30.sp,),
          
                ///////////////////////////////////////////////////////////
                ///*************** BODY SECTION *******************/
                ///////////////////////////////////////////////////////////
                ...List.generate(task.length, (index)
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}