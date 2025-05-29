import 'package:liberty_app/constants/utils/exports.dart';
import 'package:liberty_app/screens/projects/create_projects.dart';
import 'package:liberty_app/screens/task/add_task.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key, this.pageIndex = 0, this.childIndex = 0});
  final int pageIndex;
  final int childIndex; 
  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.pageIndex;
  }

  bool isKeyboardShowing = false;

 
  late List<Widget> tabOptions = [
    const HomeScreen(),
    const CreateProjectScreen(),
    Container(),
  ];

  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic) {
          if (didPop) {
            return;
          }
        },
        child: Scaffold(
          body: SizedBox(
            child: tabOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: CustomBottomAppBar(
            activeindex: selectedIndex,
            onTabSelected: _selectedTab,
            color: DoItColors.blue,
            selectedColor: selectedIndex == 0
                ? DoItColors.blue
                : DoItColors.blue,
            notchedShape: const CircularNotchedRectangle(),
            items: [
              CustomBottomAppBarItem( selectedIndex == 0 ? 30.sp : 36.sp,selectedIndex == 0 ? 30.sp : 36.sp,
                selectedIndex == 0 ? DoItAssetsPath.homeShadeIcon : DoItAssetsPath.homeOutlineIcon, ''),
              CustomBottomAppBarItem( 30.sp, 30.sp,
                selectedIndex == 1 ? DoItAssetsPath.goodShadeIcon : DoItAssetsPath.goodOutlineIcon, ''),
              CustomBottomAppBarItem( 30.sp, 30.sp,
                  DoItAssetsPath.profileOutlineIcon, ''),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              isKeyboardShowing ? null : _customFloatingButton(context),
        ),
      ),
    );
  }

  Widget _customFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        nextScreenReplace(context, AddTaskScreen());
      },
      backgroundColor: DoItColors.blue,
      foregroundColor: Colors.white,
      tooltip: 'add',
      elevation: 5.sp,
      shape: const CircleBorder(),
      child: Center(
        child: Icon(
          Icons.add,
          size: 40.sp,
        ),
      ),
    );
  }
}
