import 'package:liberty_app/constants/utils/exports.dart';

class TagModal extends StatefulWidget {
  const TagModal({
    required this.onTagSelected,
    super.key});

  final Function(List<String>, List<Color>, List<Color>) onTagSelected;

  @override
  State<TagModal> createState() => _TagModalState();
}

class _TagModalState extends State<TagModal> {
  Set<String> selectedTag = {};

  List<String> tagType = [
    'Design', 'Frontend', 'Backend',
  ];

  List<Color> tagBoxColor = [
    const Color(0xFF9EFFCC), const Color(0xFFFFE5BE), const Color(0xFFC0E2FF),
  ];

  List<Color> tagTextColor = [
    const Color(0xFF009A49), const Color(0xFFF7A325), const Color(0xFF217AC0),
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
                itemCount: tagType.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            final item = tagType[index];
                            if (selectedTag.contains(item)) {
                              selectedTag.remove(item);
                            } else if (selectedTag.length < 3) {
                              selectedTag.add(item);
                            }

                            List<Color> selectedBoxColors = selectedTag.map((tag) {
                              int idx = tagType.indexOf(tag);
                              return tagBoxColor[idx];
                            }).toList();

                            List<Color> selectedTextColors = selectedTag.map((tag) {
                              int idx = tagType.indexOf(tag);
                              return tagTextColor[idx]; 
                            }).toList();

                            widget.onTagSelected(
                              selectedTag.toList(),
                              selectedBoxColors,
                              selectedTextColors,
                            );
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DoItText(
                                  text: tagType[index],
                                  fontSize: 18.sp,
                                  textColor: DoItColors.black,
                                ),
                        
                                Container(
                                  width: 20.sp,
                                  height: 20.sp,
                                  decoration: BoxDecoration(
                                    color: selectedTag.contains(tagType[index]) ? DoItColors.blue : DoItColors.white,
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(color: 
                                    selectedTag.contains(tagType[index]) 
                                      ? DoItColors.blue : DoItColors.grey, width: 0.9.sp),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 12.sp,
                                    color: selectedTag.contains(tagType[index]) 
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