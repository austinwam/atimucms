use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
pub struct Createtrans {
    pub userid: i32,
    pub username: String,
    pub status: String,
    pub count: i32,
    pub amount: i32,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Transaction {
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
