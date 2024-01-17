class Accountmodel {
  int? accountid, agentid, propertyid, amount, balance, amountpaid;
  String? propertyname,
      propertypic,
      status,
      edited,
      rate,
      update,
      owneruid,
      timestamp,
      useruid,
      ratetype;
  bool? active;
  Accountmodel({
    this.accountid,
    this.agentid,
    this.timestamp,
    this.propertyname,
    this.propertyid,
    this.propertypic,
    this.balance,
    this.owneruid,
    this.useruid,
    this.rate,
    this.ratetype,
    this.amount,
    this.amountpaid,
    this.status,
    this.update,
    this.active,
  });
  Accountmodel.fromMap(Map<String, dynamic> map) {
    accountid = map['accountid'];
    propertyid = map["propertyid"];
    agentid = map['agentid'];
    owneruid = map["owneruid"];
    propertyname = map["propertyname"];
    useruid = map["useruid"];
    amount = map["amount"];
    amountpaid = map["amountpaid"];
    balance = map["balance"];
    rate = map["rate"];
    ratetype = map["ratetype"];
    status = map['status'];
    active = map["active"];
    update = map["update"];
    timestamp = map['timestamp'];
  }
}

class Reportmodel {
  int? updateint, amount, reportid, agentid, accountid;
  String? about, username, assignedto, contact, update, status, timestamp;
  Reportmodel({
    this.reportid,
    this.amount,
    this.agentid,
    this.username,
    this.assignedto,
    this.about,
    this.status,
    this.accountid,
    this.updateint,
    this.update,
    this.timestamp,
  });

  Reportmodel.fromMap(Map<String, dynamic> map) {
    reportid = map['reportid'];
    accountid = map['accountid'];
    contact = map['contact'];
    amount = map['amount'];
    assignedto = map["assignedto"];
    username = map['username'];
    agentid = map['agentid'];
    status = map['status'];
    about = map['about'];
    updateint = map["updateint"];
    update = map["update"];
    timestamp = map['timestamp'];
  }
}

class Ownmodel {
  bool? active;
  String? contact, createat, editat, name;
  int? managedby, ownerid;

  Ownmodel({
    this.active,
    this.contact,
    this.createat,
    this.editat,
    this.managedby,
    this.name,
    this.ownerid,
  });

  Ownmodel.fromMap(Map<String, dynamic> map) {
    active = map['active'];
    contact = map['contact'];
    createat = map['createat'];
    editat = map['editat'];
    managedby = map['managedby'];
    name = map['name'];
    ownerid = map['ownerid'];
  }
}

class Paymodemodel {
  int? paymodeid, agentid;
  String? kind, kindid, userphone;
  bool? active;
  Paymodemodel(
      {this.paymodeid, this.agentid, this.kind, this.userphone, this.active});
  Paymodemodel.fromMap(Map<String, dynamic> map) {
    paymodeid = map["paymodeid"];
    agentid = map['agentid'];
    kind = map["kind"];
    kindid = map['kindid'];
    userphone = map['userphone'];
    active = map['active'];
  }
}

class Agentmodel {
  bool? active;
  int? agentid, amount;
  String? contact, exdate, timestamp, location, managedby, name, image, about;
  Agentmodel({
    this.agentid,
    this.amount,
    this.contact,
    this.timestamp,
    this.location,
    this.managedby,
    this.name,
    this.image,
    this.about,
    this.active,
    this.exdate,
  });

  Agentmodel.fromMap(Map<String, dynamic> map) {
    agentid = map['agentid'];
    amount = map["amount"];
    name = map['name'];
    about = map['about'];
    active = map['active'];
    contact = map['contact'];
    location = map['location'];
    managedby = map['managedby'];
    image = map["image"];
    exdate = map["exdate"];
    timestamp = map['timestamp'];
  }
}

class Repairmodel {
  String? about, contact, createdat, image, name;
  bool? active;
  int? repairid, userid;
  Repairmodel({
    this.about,
    this.active,
    this.contact,
    this.createdat,
    this.image,
    this.name,
    this.repairid,
    this.userid,
  });

  Repairmodel.fromMap(Map<String, dynamic> map) {
    about = map['about'];
    active = map['active'];
    contact = map['contact'];
    createdat = map['createdat'];
    image = map['image'];
    name = map['name'];
    repairid = map['repairid'];
    userid = map['userid'];
  }
}

class Usermodel {
  int? updateint, userid, useragentid, agentid, amount;
  String? username,
      useruid,
      process,
      phone,
      rolekind,
      userrole,
      timestamp,
      role,
      update;
  bool? active;
  Usermodel(
      {this.useragentid,
      this.userid,
      this.useruid,
      this.username,
      this.phone,
      this.amount,
      this.active,
      this.rolekind,
      this.userrole,
      this.agentid,
      this.role,
      this.process,
      this.updateint,
      this.update,
      this.timestamp});
  Usermodel.fromMap(Map<String, dynamic> map) {
    useragentid = map['useragentid'];
    agentid = map['agentid'];
    userid = map["userid"];
    useruid = map["useruid"];
    amount = map['amount'];
    role = map['role'];
    rolekind = map["rolekind"];
    userrole = map['userrole'];
    phone = map['phone'];
    username = map['username'];
    active = map['active'];
    updateint = map["updateint"];
    update = map["update"];
    timestamp = map['timestamp'];
  }
}
