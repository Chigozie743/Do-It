import 'package:liberty_app/constants/utils/exports.dart';
import 'package:liberty_app/constants/widgets/project_wiget.dart';

class AllProjectsScreen extends StatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  State<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends State<AllProjectsScreen> {

  List<ProjectModel> task = ProjectModelListData.getProjectList();

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
                  headText: 'Projects',
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
                      ProjectWidget(
                        taskTitle: task[index].taskTitle,
                        createdTime: task[index].createdTime,
                        startDate: task[index].startDate,
                        endDate: task[index].endDate,
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