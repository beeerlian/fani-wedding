import 'package:arstate/arstate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../widgets/common/custom_paged_list_view.dart';
import '../../../../network/domain_manager.dart';
import '../../../../network/model/common/pagination_type.dart';
import '../../../../network/model/order/order.dart';
import '../../widgets/order_item.dart';

class BodySection extends StatefulWidget {
  const BodySection({super.key});

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {
  final PagingController<int, Order> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  Widget build(BuildContext context) {
    return XPagedListView<int, Order>(
      pagingController: _pagingController,
      repository: _repository,
      nexPageKey: (int pageKey) => pageKey + 1,
      itemBuilder: (context, item, index) => OrderItem(
        order: item,
      ),
    );
  }

  Future<ApiResult<PaginationType<Order>>> _repository(int pageKey) async {
    return await GetIt.I<DomainManager>().orderRepository.index(
          pageNumber: pageKey,
        );
  }
}
