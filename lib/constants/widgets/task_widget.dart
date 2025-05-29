import 'package:liberty_app/constants/utils/exports.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    required this.percentage,
    required this.endDate,
    required this.startDate,
    required this.taskTitle,
    required this.createdTime,
    required this.percentageText,
    required this.members,
    super.key});

  final String endDate;
  final String startDate;
  final String taskTitle;
  final String createdTime;
  final double percentage;
  final String percentageText;
  final List<String> members;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: DoItColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DoItText(
                  text: taskTitle,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  textColor: DoItColors.black,
                ),
                SizedBox(height: 10.sp,),

                DoItText(
                  text: 'Team members',
                  fontSize: 12.sp,
                ),

                Wrap(
                  children: [
                    ...List.generate(members.length, (index)
                    => Row(
                      children: [
                        Container(
                          width: 30.sp,
                          height: 30.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              members[index],
                              height: 30.sp,
                              width: 30.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.sp,),
                      ],
                    )),
                  ],
                ),
                SizedBox(height: 20.sp,),

                Row(
                  children: [
                    Container(
                      width: 30.sp,
                      height: 30.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffFFE3DE),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          DoItAssetsPath.calender,
                          height: 15.sp,
                          width: 15.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.sp,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DoItText(
                          text: 'Start',
                          fontSize: 8.sp,
                          textColor: DoItColors.red,
                        ),
                        DoItText(
                          text: startDate,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(width: 10.sp,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        DoItText(
                          text: 'end',
                          fontSize: 8.sp,
                          textColor: DoItColors.green,
                        ),
                        DoItText(
                          text: endDate,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),


            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: DoItColors.blue,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                    child: DoItText(
                      text: createdTime,
                      fontSize: 12.sp,
                      textColor: DoItColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50.sp,),

                CircularPercentIndicator(
                  radius: 28.r,
                  lineWidth: 3.0,
                  percent: percentage,
                  center: DoItText(
                    text: percentageText,
                    fontSize: 16.sp,
                    textColor: Colors.green,
                  ),
                  backgroundColor: DoItColors.yellow,
                  progressColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}