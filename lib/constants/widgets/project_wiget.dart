import 'package:liberty_app/constants/utils/exports.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    required this.endDate,
    required this.startDate,
    required this.taskTitle,
    required this.createdTime,
    super.key});

  final String endDate;
  final String startDate;
  final String taskTitle;
  final String createdTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.sp,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        DoItAssetsPath.libertyLogo,
                        height: 26.sp,
                        width: 26.sp,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.sp,),
                    DoItText(
                      text: taskTitle,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      textColor: DoItColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 10.sp,),

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: DoItColors.green,
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

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: DoItColors.blue, width: 1.sp),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                    child: DoItText(
                      text: 'Add Task',
                      fontSize: 12.sp,
                      textColor: DoItColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}