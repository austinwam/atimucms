
CREATE TABLE account
(
  accountid  serial      NULL    ,
  userid     int         NULL    ,
  amount     int         NULL     DEFAULT 0,
  status     VARCHAR(15) NULL    ,
  updated_at timestamptz NULL     DEFAULT NOW,
  created_at timestamptz NULL     DEFAULT NOW,
  PRIMARY KEY (accountid)
);

CREATE TABLE document
(
  documentid serial       NULL    ,
  url        varchar(200) NULL    ,
  kind                    NULL    ,
  PRIMARY KEY (documentid)
);

CREATE TABLE employee
(
  eid        serial      NULL    ,
  userid     int         NULL    ,
  status     varchar(20) NULL    ,
  update_at  timestamptz NULL     DEFAULT NOW,
  created_at timestamptz NULL     DEFAULT NOW,
  level                  NULL    ,
  PRIMARY KEY (eid)
);

CREATE TABLE lead
(
  leadid     serial       NULL    ,
  name       varchar(100) NULL    ,
  status     varchar(20)  NULL    ,
  phone      varchar(15)  NULL    ,
  note       text         NULL    ,
  userid     int          NULL    ,
  update_at  timestamptz  NOT NULL DEFAULT NOW,
  created_at timestamptz  NULL     DEFAULT NOW,
  PRIMARY KEY (leadid)
);

CREATE TABLE meetings
(
  meetid     serial       NULL    ,
  about      varchar(150) NULL    ,
  status     varchar(20)  NULL    ,
  update_at  timestamptz  NULL     DEFAULT NOW,
  created_at              NULL     DEFAULT NOW,
  PRIMARY KEY (meetid)
);

CREATE TABLE payments
(
  payid      serial       NULL    ,
  amount     int          NOT NULL DEFAULT 0,
  status     varchar(20)  NOT NULL,
  userid     int          NULL    ,
  url        varchar(200) NULL    ,
  method     varchar(20)  NULL    ,
  update_at  timestamptz  NOT NULL DEFAULT NOW,
  created_at timestamptz  NOT NULL DEFAULT NOW,
  PRIMARY KEY (payid)
);

CREATE TABLE task
(
  taskid     serial       NULL    ,
  about      varchar(200) NULL    ,
  status     varchar(20)  NULL    ,
  userid     int          NOT NULL,
  updated_at timestamptz  NOT NULL DEFAULT NOW,
  created_at timestamptz  NOT NULL DEFAULT NOW,
  PRIMARY KEY (taskid)
);

CREATE TABLE users
(
  userid     serial      NULL    ,
  username   VARCHAR(70) NOT NULL,
  email      VARCHAR(80) NOT NULL,
  phone      VARCHAR(20) NOT NULL,
  status     VARCHAR(20) NULL    ,
  paid       int         NULL     DEFAULT 0,
  unpaid     int         NULL     DEFAULT 0,
  amount     int         NULL     DEFAULT 0,
  role       json        NULL    ,
  password   VARCHAR(90) NULL    ,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW,
  PRIMARY KEY (userid)
);
