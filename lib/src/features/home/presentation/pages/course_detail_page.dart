import 'package:edtech/src/features/home/domain/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/constraints/app_constraints.dart';
import '../../../../core/constants/enum/enum.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../domain/entities/teachers.dart';
import '../blocs/course_detail_cubit/course_detail_cubit.dart';
import '../widgets/classroom_tile.dart';
import '../widgets/course_description_widget.dart';
import '../widgets/educator_basic_details_tile.dart';
import '../widgets/faq_expansion_tile_list.dart';
import '../widgets/key_details_widget.dart';
import '../widgets/video_tile.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      // canPop: true,
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            leadingWidth: 30.0,
            title: const Text(
              "SSC CGL Mains 2023 SSC CGL Mains 2023",
              maxLines: 2,
            ),
          ),
          body: CustomScrollView(
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: AspectRatio(
                  aspectRatio: 19 / 9,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: CustomImage(path: PlaceHolderImg.courseThumbnail),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstraints.large),
                  child: Text(
                    "SSC CGL Mains 2023",
                    style: textTheme.titleLarge,
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 7 / 2,
                ),
                delegate: SliverChildListDelegate([
                  const KeyDetailsWidget(
                      type: KeyDetailType.duration, text: "10 Months"),
                  const KeyDetailsWidget(
                      type: KeyDetailType.type, text: "Live + Recorded"),
                  const KeyDetailsWidget(
                      type: KeyDetailType.validity, text: "18 Months"),
                  const KeyDetailsWidget(
                      type: KeyDetailType.language, text: "English | Hindi"),
                ]),
              ),
              const SliverGap(AppConstraints.medium),
              const SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                title: TabBar(
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Overview"),
                    Tab(text: "Classroom"),
                    Tab(text: "Demo Video"),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    overViewTab(context, controller),
                    classRoomTab(context, controller),
                    demoVideoTab(context, controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget overViewTab(BuildContext context, ScrollController controller) {
    return ListView(
      controller: controller,
      shrinkWrap: true,
      children: [
        const CourseDescriptionWidget(),
        const Gap(AppConstraints.extraLarge),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstraints.large),
          child: Text(
            "Meet Your Educators",
            style: textTheme.titleSmall,
          ),
        ),
        const Gap(AppConstraints.medium),
        SizedBox(
          height: 100.0,
          child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.symmetric(horizontal: AppConstraints.large),
              itemBuilder: (context, index) {
                return EducatorBasicDetailsTile(
                  index: index,
                  length: 5,
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(AppConstraints.large),
          child: Text(
            "FAQ's",
            style: textTheme.titleSmall,
          ),
        ),
        const FAQExpansionTileList(),
      ],
    );
  }

  Widget classRoomTab(BuildContext context, ScrollController controller) {
    return ListView.builder(
      itemCount: 20,
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: AppConstraints.large),
      itemBuilder: (context, index) {
        return ClassRoomTile(
          onTap: () {},
          title: "Exam Analysis",
          videos: 3,
          notes: 0,
        );
      },
    );
  }

  Widget demoVideoTab(BuildContext context, ScrollController controller) {
    return ListView.builder(
      itemCount: 20,
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: AppConstraints.large),
      itemBuilder: (context, index) {
        return VideoTile(
          onTap: () {},
          title:
              "UPSC Prelims 2023 Exam Analysis || Polity & UP special by Khan Sir",
          date: DateTime.now(),
          duration: 70,
        );
      },
    );
  }
}
