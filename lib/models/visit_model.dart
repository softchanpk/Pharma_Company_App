class VisitModel {
  List<Items>? _items;

  VisitModel({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  VisitModel.fromJson(Map<String, dynamic> json) {
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
  int? _crtrnvstPk;
  int? _vstno;
  String? _vsttrndt;
  String? _vstschdt;
  String? _vsttypid;
  String? _vsttypdsc;
  String? _abkidSite;
  String? _sprid;
  String? _sprname;
  String? _schremarks;
  String? _usrid;
  String? _usrname;

  Items(
      {int? crtrnvstPk,
        int? vstno,
        String? vsttrndt,
        String? vstschdt,
        String? vsttypid,
        String? vsttypdsc,
        String? abkidSite,
        String? sprid,
        String? sprname,
        String? schremarks,
        String? usrid,
        String? usrname}) {
    if (crtrnvstPk != null) {
      this._crtrnvstPk = crtrnvstPk;
    }
    if (vstno != null) {
      this._vstno = vstno;
    }
    if (vsttrndt != null) {
      this._vsttrndt = vsttrndt;
    }
    if (vstschdt != null) {
      this._vstschdt = vstschdt;
    }
    if (vsttypid != null) {
      this._vsttypid = vsttypid;
    }
    if (vsttypdsc != null) {
      this._vsttypdsc = vsttypdsc;
    }
    if (abkidSite != null) {
      this._abkidSite = abkidSite;
    }
    if (sprid != null) {
      this._sprid = sprid;
    }
    if (sprname != null) {
      this._sprname = sprname;
    }
    if (schremarks != null) {
      this._schremarks = schremarks;
    }
    if (usrid != null) {
      this._usrid = usrid;
    }
    if (usrname != null) {
      this._usrname = usrname;
    }
  }

  int? get crtrnvstPk => _crtrnvstPk;
  set crtrnvstPk(int? crtrnvstPk) => _crtrnvstPk = crtrnvstPk;
  int? get vstno => _vstno;
  set vstno(int? vstno) => _vstno = vstno;
  String? get vsttrndt => _vsttrndt;
  set vsttrndt(String? vsttrndt) => _vsttrndt = vsttrndt;
  String? get vstschdt => _vstschdt;
  set vstschdt(String? vstschdt) => _vstschdt = vstschdt;
  String? get vsttypid => _vsttypid;
  set vsttypid(String? vsttypid) => _vsttypid = vsttypid;
  String? get vsttypdsc => _vsttypdsc;
  set vsttypdsc(String? vsttypdsc) => _vsttypdsc = vsttypdsc;
  String? get abkidSite => _abkidSite;
  set abkidSite(String? abkidSite) => _abkidSite = abkidSite;
  String? get sprid => _sprid;
  set sprid(String? sprid) => _sprid = sprid;
  String? get sprname => _sprname;
  set sprname(String? sprname) => _sprname = sprname;
  String? get schremarks => _schremarks;
  set schremarks(String? schremarks) => _schremarks = schremarks;
  String? get usrid => _usrid;
  set usrid(String? usrid) => _usrid = usrid;
  String? get usrname => _usrname;
  set usrname(String? usrname) => _usrname = usrname;

  Items.fromJson(Map<String, dynamic> json) {
    _crtrnvstPk = json['crtrnvst_pk'];
    _vstno = json['vstno'];
    _vsttrndt = json['vsttrndt'];
    _vstschdt = json['vstschdt'];
    _vsttypid = json['vsttypid'];
    _vsttypdsc = json['vsttypdsc'];
    _abkidSite = json['abkid_site'];
    _sprid = json['sprid'];
    _sprname = json['sprname'];
    _schremarks = json['schremarks'];
    _usrid = json['usrid'];
    _usrname = json['usrname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crtrnvst_pk'] = this._crtrnvstPk;
    data['vstno'] = this._vstno;
    data['vsttrndt'] = this._vsttrndt;
    data['vstschdt'] = this._vstschdt;
    data['vsttypid'] = this._vsttypid;
    data['vsttypdsc'] = this._vsttypdsc;
    data['abkid_site'] = this._abkidSite;
    data['sprid'] = this._sprid;
    data['sprname'] = this._sprname;
    data['schremarks'] = this._schremarks;
    data['usrid'] = this._usrid;
    data['usrname'] = this._usrname;
    return data;
  }
}