class VisitResultLov {
  List<Items>? _items;

  VisitResultLov({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  VisitResultLov.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._items != null) {
      data['items'] = this._items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? _d;
  String? _r;

  Items({String? d, String? r}) {
    if (d != null) {
      this._d = d;
    }
    if (r != null) {
      this._r = r;
    }
  }

  String? get d => _d;
  set d(String? d) => _d = d;
  String? get r => _r;
  set r(String? r) => _r = r;

  Items.fromJson(Map<String, dynamic> json) {
    _d = json['d'];
    _r = json['r'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['d'] = this._d;
    data['r'] = this._r;
    return data;
  }
}