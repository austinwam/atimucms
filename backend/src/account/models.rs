use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
pub struct CreateAccount {
    pub userid: i32,
    pub status: String,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Account {
    pub accountid: i32,
    pub userid: i32,
    pub status: String,
    pub amount: i32,
    pub updated_at: chrono::DateTime<chrono::Utc>,
    pub created_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct Updateacc {
    pub accountid: i32,
    pub amount: i32,
    pub status: String,
}

#[derive(Deserialize)]
pub struct Refreshacc {
    pub startdt: chrono::DateTime<chrono::Utc>,
}


 