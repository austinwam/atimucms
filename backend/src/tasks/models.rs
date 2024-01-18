use serde::{Deserialize, Serialize};

// type Meetings {
//     meetid: ID
//     userid: Int
//     about: String
//     status: String
//     datetime: String
//     updateAt: String
//     createdAt: String
//   }

#[derive(Deserialize)]
pub struct Createtask {
    pub userid: i32,
    pub about: String,
    pub status: String,
    pub datetime: i32,
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
    pub taskid: i32,
    pub status: String,
    pub userid: i32,
    pub about: String,
}

#[derive(Deserialize)]
pub struct Refreshtask {
    pub startdt: chrono::DateTime<chrono::Utc>,
}
