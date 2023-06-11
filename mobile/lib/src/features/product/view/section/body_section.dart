import 'package:arstate/arstate.dart';
import 'package:arx/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../widgets/common/custom_paged_list_view.dart';
import '../../../../network/domain_manager.dart';
import '../../../../network/model/common/pagination_type.dart';
import '../../../../network/model/product/product.dart';
import '../../widgets/product_item.dart';

class BodySection extends StatefulWidget {
  const BodySection({super.key});

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            Constants.kPaddingL,
            Constants.kPaddingL,
            Constants.kPaddingL,
            0,
          ),
          child: Text(
            'Produk Kami',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Expanded(
          child: XPagedListView<int, Product>(
            type: PagedListViewType.grid,
            pagingController: _pagingController,
            repository: _repository,
            nexPageKey: (int pageKey) => pageKey + 1,
            itemBuilder: (context, item, index) => ProductItem(
              product: item,
            ),
          ),
        ),
      ],
    );
  }

  Future<ApiResult<PaginationType<Product>>> _repository(int pageKey) async {
    return await GetIt.I<DomainManager>().productRepository.index(
          pageNumber: pageKey,
        );
  }
}
