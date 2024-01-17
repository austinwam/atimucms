
CREATE TABLE account
(
  accountid  serial     ,
  userid     int        ,
  amount     int         DEFAULT 0,
  status     VARCHAR(15),
  updated_at timestamptz DEFAULT NOW,
  created_at timestamptz DEFAULT NOW,
  PRIMARY KEY (accountid)
);

CREATE TABLE meetings
(
  meetid     serial      ,
  about      varchar(150),
  status     varchar(20) ,
  update_at  timestamptz  DEFAULT NOW,
  created_at              DEFAULT NOW,
  PRIMARY KEY (meetid)
);

CREATE TABLE task
(
  taskid serial      ,
  about  varchar(200),
  status varchar(20) ,
  userid int          NOT NULL,
  PRIMARY KEY (taskid)
);

CREATE TABLE users
(
  userid     SERIAL     ,
  username   VARCHAR(70) NOT NULL,
  email      VARCHAR(80) NOT NULL,
  phone      VARCHAR(20) NOT NULL,
  status     VARCHAR(20),
  paid       int         DEFAULT 0,
  unpaid     int         DEFAULT 0,
  amount     int         DEFAULT 0,
  role       json       ,
  password   VARCHAR(90),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW,
  PRIMARY KEY (userid)
);
