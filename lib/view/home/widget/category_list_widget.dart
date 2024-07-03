part of '../home_view.dart';

class _CategoryListWidget extends StatelessWidget {
  const _CategoryListWidget({
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return categoryChipWidget(
            category: categoryList[index],
            isActive: categoryList[index].id ==
                context.read<HomeProvider>().choosenCategoryId,
            onClick: () => context
                .read<HomeProvider>()
                .changeChoosenCategory(categoryList[index].id!),
          );
        });
  }

  Widget categoryChipWidget({
    required CategoryModel category,
    required void Function() onClick,
    required bool isActive,
  }) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Chip(
          labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
          color: WidgetStatePropertyAll(
              isActive ? ColorConstants.brownColor : ColorConstants.silverGrey),
          label: Text(
            category.categoryName ?? '',
            style: TextStyleConstants.whiteText14.copyWith(
                color: isActive ? ColorConstants.white : ColorConstants.black),
          ),
        ),
      ),
    );
  }
}
