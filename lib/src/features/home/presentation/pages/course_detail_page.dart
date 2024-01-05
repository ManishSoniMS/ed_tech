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
    context.read<CourseDetailCubit>().fetch(id);
    final controller = ScrollController();
    final size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocBuilder<CourseDetailCubit, CourseDetailState>(
        builder: (context, state) {
          return state.map(
            initial: (initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (loaded) {
              return DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Scaffold(
                  appBar: AppBar(
                    leading: const BackButton(),
                    leadingWidth: 30.0,
                    title: Text(
                      loaded.course.title,
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
                              child: CustomImage(path: loaded.course.image),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppConstraints.large),
                          child: Text(
                            loaded.course.title,
                            style: textTheme.titleLarge,
                          ),
                        ),
                      ),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 7 / 2,
                        ),
                        delegate: SliverChildListDelegate([
                          KeyDetailsWidget(
                            type: KeyDetailType.duration,
                            text: ["${loaded.course.duration} Months"],
                          ),
                          KeyDetailsWidget(
                            type: KeyDetailType.type,
                            text: loaded.course.type,
                          ),
                          KeyDetailsWidget(
                            type: KeyDetailType.validity,
                            text: ["${loaded.course.validity} Months"],
                          ),
                          KeyDetailsWidget(
                            type: KeyDetailType.language,
                            text: loaded.course.language,
                          ),
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
                            overViewTab(context, controller, loaded.course,
                                loaded.teachers),
                            classRoomTab(context, controller),
                            demoVideoTab(context, controller),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: SafeArea(
                    child: BottomAppBar(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Price",
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                              Text(
                                "₹ ${loaded.course.price}",
                                style: textTheme.titleLarge,
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            height: AppConstraints.textFieldHeight,
                            width: size.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF313275),
                              ),
                              child: Text(
                                "Buy Now",
                                style: textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            error: (error) {
              return Center(
                child: Text(error.failure.message),
              );
            },
          );
        },
      ),
    );
  }

  Widget overViewTab(
    BuildContext context,
    ScrollController controller,
    Course course,
    List<Teachers> teachers,
  ) {
    return ListView(
      controller: controller,
      shrinkWrap: true,
      children: [
        CourseDescriptionWidget(aboutCourse: course.about),
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
            itemCount: teachers.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstraints.large),
            itemBuilder: (context, index) {
              final teacher = teachers[index];
              return EducatorBasicDetailsTile(
                index: index,
                length: 5,
                name: teacher.name,
                subject: teacher.subject,
                img: teacher.image,
              );
            },
          ),
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
