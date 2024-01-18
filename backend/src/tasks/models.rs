use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
pub struct Createtask {
    pub createdby: i32,
    pub status: String,
    pub userid: i32,
    pub about: String,
}

#[derive(sqlx::FromRow, Deserialize, Serialize)]
pub struct Task {
    pub taskid: i32,
    pub createdby: i32,
    pub status: String,
    pub userid: i32,
    pub about: String,
    pub updated_at: chrono::DateTime<chrono::Utc>,
    pub created_at: chrono::DateTime<chrono::Utc>,
}

#[derive(Deserialize)]
pub struct Updatetask {
    pub transid: i32,
    pub status: String,
    pub userid: i32,
    pub about: String,
}

#[derive(Deserialize)]
pub struct Refreshtask {
    pub startdt: chrono::DateTime<chrono::Utc>,
}
