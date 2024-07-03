part of '../home_view.dart';

class _PromotionListWidget extends StatelessWidget {
  const _PromotionListWidget({required this.promotionList});

  final List<PromotionModel> promotionList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => CustomPaddings.customPadding(10),
      scrollDirection: Axis.horizontal,
      itemCount: promotionList.length,
      itemBuilder: (context, index) {
        return promotionContainerWidget(promotionList[index]);
      },
    );
  }

  Widget promotionContainerWidget(PromotionModel promotion) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(promotion.promotionUrl!),
        ),
      )),
    );
  }
}
