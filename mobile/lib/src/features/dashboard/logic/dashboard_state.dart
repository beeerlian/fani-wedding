part of 'dashboard_bloc.dart';

enum TapIndex {
  home,
  product,
  order,
  account,
}

extension ETapIndex on TapIndex {
  String nameOf() {
    return nameAt(index);
  }

  Widget iconOf() {
    switch (this) {
      case TapIndex.home:
        return const HeroIcon(HeroIcons.home);
      case TapIndex.product:
        return const HeroIcon(HeroIcons.buildingStorefront);
      case TapIndex.order:
        return const HeroIcon(HeroIcons.clipboard);
      default:
        return const HeroIcon(HeroIcons.user);
    }
  }

  static String nameAt(int index) {
    if (index == TapIndex.product.index) {
      return 'Produk';
    } else if (index == TapIndex.order.index) {
      return 'Order';
    }
    if (index == TapIndex.account.index) {
      return 'Account';
    } else {
      return 'Beranda';
    }
  }
}

class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object?> get props => [];
}
