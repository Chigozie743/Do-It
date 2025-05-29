import 'package:liberty_app/constants/utils/exports.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  TextEditingController commentController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();

  List<String> teamList = [];

  List<String> tagList = [];
  List<Color> tagBoxColorList = [];
  List<Color> tagTextColorList = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: DoItColors.thinGrey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp,
              top: 30.sp, bottom: 30.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///////////////////////////////////////////////////////////
                  ///*************** HEADER SECTION ******************/
                  ///////////////////////////////////////////////////////////
                  HeaderWidget(
                    headText: 'Add Task',
                    firstBodyText: ' ',
                    secondBodyText: ' ',
                    thirdBodyText: '',
                    onBackTap: () => nextScreenReplace(context, const MainPage(pageIndex: 0,)),
                  ),
                  SizedBox(height: 30.sp,),
            
                  ///////////////////////////////////////////////////////////
                  ///*************** BODY SECTION *******************/
                  ///////////////////////////////////////////////////////////
                  ///*************** Task Name Text Field ******************/
                  SizedBox(
                    child: TextFieldBox(
                      height: 35.sp,
                      controller: taskNameController,
                      headText: "Task Name",
                      hintText: "",
                      labelText: '',
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 10.sp),
                      fillColor: DoItColors.transparentColor,
                      keyboardType: TextInputType.text,
                      borderType: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: DoItColors.grey,
                          width: 1.5.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),

                  Row(
                    children: [
                      ///*************** Start Date Text Field ******************/
                      Expanded(
                        child: SizedBox(
                          child: TextFieldBox(
                            height: 35.sp,
                            controller: startDateController,
                            headText: "Created (from)",
                            hintText: "",
                            labelText: '',
                            readOnly: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 10.sp),
                            fillColor: DoItColors.transparentColor,
                            prefixIcon: Transform.scale(
                              scale: 0.8.sp,
                              child: SvgPicture.asset(
                                DoItAssetsPath.calender,
                                color: DoItColors.grey,
                                height: 13.sp,
                                width: 13.sp,
                              ),
                            ),
                            borderType: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: DoItColors.grey,
                                width: 1.5.sp,
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null) {
                                String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                setState(() {
                                  startDateController.text = formattedDate;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 30.sp,),

                      ///*************** End Date Text Field ******************/
                      Expanded(
                        child: SizedBox(
                          child: TextFieldBox(
                            height: 35.sp,
                            controller: endDateController,
                            headText: "End (to)",
                            hintText: "",
                            labelText: '',
                            readOnly: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 10.sp),
                            fillColor: DoItColors.transparentColor,
                            prefixIcon: Transform.scale(
                              scale: 0.8.sp,
                              child: SvgPicture.asset(
                                DoItAssetsPath.calender,
                                color: DoItColors.grey,
                                height: 13.sp,
                                width: 13.sp,
                              ),
                            ),
                            borderType: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: DoItColors.grey,
                                width: 1.5.sp,
                              ),
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );

                              if (pickedDate != null) {
                                String formattedDate = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                                setState(() {
                                  endDateController.text = formattedDate;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),

                  ///*************** Add Team Text Field ******************/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoItText(
                        text: 'Assign Task:',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textColor: DoItColors.grey,
                      ),
                      SizedBox(height: 10.sp,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              ...List.generate(teamList.length, (index)
                              => Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: DoItColors.red,
                                        width: 1.5.sp,
                                      ),
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        teamList[index],
                                        height: 25.sp,
                                        width: 25.sp,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 0.sp,),
                                ],
                              )),
                            ],
                          ),
                          

                          InkWell(
                            onTap: () {
                              handleBottomNav(context, AssignTaskModal(
                                onTeamSelected: (List<String> team) {
                                  setState(() {
                                    teamList = team;
                                  });
                                },
                              ));
                            },
                            child: SvgPicture.asset(
                              DoItAssetsPath.addIcon,
                              height: 22.sp,
                              width: 22.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: DoItColors.grey,
                        thickness: 1.5.sp,)
                    ],
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),


                  ///*************** Tag Task Text Field ******************/
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoItText(
                        text: 'Tags:',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textColor: DoItColors.grey,
                      ),
                      SizedBox(height: 10.sp,),

                      InkWell(
                        onTap: () {
                          handleBottomNav(
                            context,
                            TagModal(
                              onTagSelected: (List<String> tagName,
                                  List<Color> tagBoxColor,
                                  List<Color> tagTextColor) {
                                setState(() {
                                  tagList = tagName;
                                  tagBoxColorList = tagBoxColor;
                                  tagTextColorList = tagTextColor;
                                });
                              },
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 30.sp,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(tagList.length, (index) => Row(
                                children: [
                                  Container(
                                    width: 75.sp,
                                    decoration: BoxDecoration(
                                      color: tagBoxColorList[index],
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(50.r),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                                    child: Center(
                                      child: DoItText(
                                        text: tagList[index],
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        textColor: tagTextColorList[index],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.sp),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: DoItColors.grey,
                        thickness: 1.5.sp,)
                    ],
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),


                  ///*************** Email Address Text Field ******************/
                  SizedBox(
                    child: TextFieldBox(
                      height: 120.sp,
                      controller: commentController,
                      headText: "Comment",
                      hintText: "Enter Comment",
                      labelText: '',
                      maxLines: 10,
                      fillColor: DoItColors.transparentColor,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),

                ],
              ),
            ),
          ),
        ),

        ///////////////////////////////////////////////////////////////////////
        ///*************** Submit Button ******************/
        ///////////////////////////////////////////////////////////////////////
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: DoItButton(
              text: 'Add Task',
              width: double.infinity,
              backgroundColor: DoItColors.blue,
              onClick: () {
                nextScreen(context, const AllTaskScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}