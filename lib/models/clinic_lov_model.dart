class ClinicLov {
  List<Items>? _items;

  ClinicLov({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  ClinicLov.fromJson(Map<String, dynamic> json) {
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
  String? _abkid;
  String? _abkname;
  Null? _adr;
  Null? _mobile;
  Null? _email;

  Items(
      {String? abkid, String? abkname, Null? adr, Null? mobile, Null? email}) {
    if (abkid != null) {
      this._abkid = abkid;
    }
    if (abkname != null) {
      this._abkname = abkname;
    }
    if (adr != null) {
      this._adr = adr;
    }
    if (mobile != null) {
      this._mobile = mobile;
    }
    if (email != null) {
      this._email = email;
    }
  }

  String? get abkid => _abkid;
  set abkid(String? abkid) => _abkid = abkid;
  String? get abkname => _abkname;
  set abkname(String? abkname) => _abkname = abkname;
  Null? get adr => _adr;
  set adr(Null? adr) => _adr = adr;
  Null? get mobile => _mobile;
  set mobile(Null? mobile) => _mobile = mobile;
  Null? get email => _email;
  set email(Null? email) => _email = email;

  Items.fromJson(Map<String, dynamic> json) {
    _abkid = json['abkid'];
    _abkname = json['abkname'];
    _adr = json['adr'];
    _mobile = json['mobile'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abkid'] = this._abkid;
    data['abkname'] = this._abkname;
    data['adr'] = this._adr;
    data['mobile'] = this._mobile;
    data['email'] = this._email;
    return data;
  }
}