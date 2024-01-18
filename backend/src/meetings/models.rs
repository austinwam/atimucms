use serde::{Deserialize, Serialize};

// meetid: ID
// userid: Int
// about: String
// status: String
// updateAt: String
// createdAt: String
// datetime: String
#[derive(Deserialize)]
pub struct Createmeet {
    pub userid: i32,
    pub about: String,
    pub status: String,
    pub datetime: String,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Meet {
    pub transid: i32,
    pub userid: i32,
    pub username: String,
    pub status: String,
    pub count: i32,
    pub amount: i32,
    pub updated_at: chrono::DateTime<chrono::Utc>,
    pub created_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct Transupdate {
    pub transid: i32,
    pub status: String,
}

#[derive(Deserialize)]
pub struct Refreshtrans {
    pub startdt: chrono::DateTime<chrono::Utc>,
}
