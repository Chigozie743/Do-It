import 'package:liberty_app/constants/utils/exports.dart';

class AssignTaskModal extends StatefulWidget {
  const AssignTaskModal({
    required this.onTeamSelected,
    super.key});

  final Function(List<String>) onTeamSelected;

  @override
  State<AssignTaskModal> createState() => _AssignTaskModalState();
}

class _AssignTaskModalState extends State<AssignTaskModal> {
  Set<String> selectedTeam = {};

  List<String> teamImage = [
    DoItAssetsPath.team1Image, DoItAssetsPath.team3Image,
    DoItAssetsPath.team5Image, DoItAssetsPath.team4Image,
    DoItAssetsPath.team2Image
  ];

  List<String> teamName = [
    'Itachi Uchiha', 'Sakura Haruno', 'Sasuke Uchiha',
    'Naruto Uzumaki', 'Ichigo Kurosaki',
  ];

  @override
  Widget build(BuildContext context) {
    return ShowModalWidget(
      headerText: 'Assign Task',
      bodyWidget: Padding(
        padding: EdgeInsets.only( top: 15,
            left: 15.sp, right: 15.sp, bottom: 5.sp),
        child: Column(
          children: [
            SizedBox(
              height: 400.sp,
              child: ListView.builder(
                itemCount: teamImage.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            final item = teamImage[index];
                            if (selectedTeam.contains(item)) {
                              selectedTeam.remove(item);
                              widget.onTeamSelected(selectedTeam.toList());
                            } else if (selectedTeam.length < 5) {
                              selectedTeam.add(item);
                              widget.onTeamSelected(selectedTeam.toList());
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        teamImage[index],
                                        height: 45.sp,
                                        width: 45.sp,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 15.sp,),
                                    DoItText(
                                      text: teamName[index],
                                      fontSize: 16.sp,
                                      textColor: DoItColors.black,
                                    ),
                                  ],
                                ),
                        
                                Container(
                                  width: 20.sp,
                                  height: 20.sp,
                                  decoration: BoxDecoration(
                                    color: selectedTeam.contains(teamImage[index]) ? DoItColors.blue : DoItColors.white,
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(color: 
                                    selectedTeam.contains(teamImage[index]) 
                                      ? DoItColors.blue : DoItColors.grey, width: 0.9.sp),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 12.sp,
                                    color: selectedTeam.contains(teamImage[index]) 
                                    ? DoItColors.white : DoItColors.grey,
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              color: DoItColors.grey,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.sp,)
                    ],
                  );
                }
              ),
            ),
            SizedBox(height: 40.sp,),

            DoItButton(
              text: 'Choose',
              width: double.infinity,
              backgroundColor: DoItColors.blue,
              onClick: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 50.sp,),
          ],
        ),
      ),
    );
  }
}