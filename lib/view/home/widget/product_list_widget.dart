part of '../home_view.dart';

class _ProductListWidget extends StatelessWidget {
  const _ProductListWidget({required this.productList});
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => CustomPaddings.customPadding(8),
        shrinkWrap: true,
        itemCount: productList.length,
        itemBuilder: (cntx, index) =>
            productContainerWidget(productList[index], cntx));
  }

  Widget productContainerWidget(Product product, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ColorConstants.brownColor),
              left: BorderSide(color: ColorConstants.brownColor),
              top: BorderSide(color: ColorConstants.brownColor)),
          borderRadius:
              const BorderRadius.horizontal(left: Radius.circular(12))),
      child: Row(
        children: [
          Container(
              height: context.dynamicHeight(0.1),
              width: context.dynamicHeight(0.1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: product.productImageUrl != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.productImageUrl!),
                      )
                    : null,
              )),
          const CustomSizedBox.paddingWidth(widthValue: 12),
          Text(product.productName ?? ''),
          const Expanded(flex: 2, child: SizedBox()),
          Text("${product.price}\$"),
          const CustomSizedBox.paddingWidth(widthValue: 8),
        ],
      ),
    );
  }
}
