use serde::{Deserialize, Serialize};

// meetid: ID
// userid: Int
// about: String
// status: String
// datetime: String
// updateAt: String
// createdAt: String

#[derive(Deserialize)]
pub struct Createmeet {
    pub userid: i32,
    pub about: String,
    pub status: String,
    pub datetime: String,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Meet {
    pub meetid: i32,
    pub userid: i32,
    pub about: String,
    pub status: String,
    pub datetime: String,
    pub updated_at: chrono::DateTime<chrono::Utc>,
    pub created_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct Updatemeet {
    pub transid: i32,
    pub status: String,
}

#[derive(Deserialize)]
pub struct Refreshmeet {
    pub startdt: chrono::DateTime<chrono::Utc>,
}
