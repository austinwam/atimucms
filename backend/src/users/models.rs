use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
pub struct CreateUser {
    pub name: String,
    pub useruid: String,
    pub phone: String,
    pub email: String,
    pub status: String,
}

#[derive(sqlx::FromRow, Deserialize, Serialize, Debug)]
pub struct User {
    pub userid: i32,
    pub useruid: Option<String>,
    pub name: String,
    pub email: String,
    pub phone: String,
    pub status: Option<String>,
    pub paid: i32,
    pub unpaid: i32,
    pub amount: i32,
    pub created_at: chrono::DateTime<chrono::Utc>,
    pub updated_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct EditUser {
    pub userid: i32,
    pub name: String,
    pub phone: String,
    pub email: String,
    pub status: String,
    pub paid: i32,
    pub unpaid: i32,
    pub amount: i32,
}

#[derive(Deserialize, Debug, Clone)]
pub struct Userpay {
    pub useruid: String,
    pub count: i32,
    pub status: String,
}
