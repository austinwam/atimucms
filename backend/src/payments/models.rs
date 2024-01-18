use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
pub struct Createpayment {
    pub userid: i32,
    pub method: String,
    pub status: String,
    pub kind: String,
    pub amount: i32,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Payment {
    pub paymentid: i32,
    pub userid: i32,
    pub username: String,
    pub status: String,
    pub kind: String,
    pub method: String,
    pub amount: i32,
    pub updated_at: chrono::DateTime<chrono::Utc>,
    pub created_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct Updatepayment {
    pub transid: i32,
    pub status: String,
}

#[derive(Deserialize)]
pub struct Refreshpayment {
    pub startdt: chrono::DateTime<chrono::Utc>,
}
