use crate::common::errors::ApiError;
use crate::market::models::Agent;

use crate::user::db;
use axum::extract::{self, Path, State};
use axum::http::StatusCode;
use axum::response::IntoResponse;
use axum::Json;
use serde_json::json;
use sqlx::PgPool;

use super::models::{CreateUser, EditUser, User, Userpay};

pub async fn getauser(
    State(pool): State<PgPool>,
    Path(useruid): Path<String>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let user: Result<User, sqlx::Error> = db::getauser(pool, useruid).await;
    match user {
        Ok(userdata) => {
            let json_response = serde_json::json!({
                "status": "success",
                "data": userdata
            });
            return Ok(Json(json_response));
        }
        Err(err) => {
            return Err((
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({"status": "error","message": format!("{:?}", err)})),
            ));
        }
    }
}

pub async fn get_users(State(pool): State<PgPool>) -> Result<impl IntoResponse, Json<Vec<Agent>>> {
    let results = db::allusers(pool).await.unwrap();
    Ok(Json(results))
}

pub async fn create_user(
    extract::State(pool): extract::State<PgPool>,
    Json(newiuser): Json<CreateUser>,
) -> Result<Json<User>, ApiError> {
    let agent = db::addtodb(pool, newiuser).await;
    match agent {
        Ok(agent) => Ok(Json(User::from(agent))),
        Err(e) => Err(ApiError::new_internal(e.to_string())),
    }
}

pub async fn edit_user(
    extract::State(pool): extract::State<PgPool>,
    Json(euser): Json<EditUser>,
) -> Result<Json<User>, ApiError> {
    let newuser = db::edit_user(pool, euser).await;
    match newuser {
        Ok(newuser) => Ok(Json(User::from(newuser))),
        Err(e) => Err(ApiError::new_internal(e.to_string())),
    }
}

pub async fn userpay(extract::State(pool): extract::State<PgPool>, Json(userf): Json<Userpay>) {
    let user: Result<User, sqlx::Error> = db::getauser(pool, userf.useruid.clone()).await;
    match user {
        Ok(userdata) => {
            println!("{:?}", userdata);
            println!("{:?}", userf);
            if userf.status == "add" {
                println!("addedd======");
                let newupaid = userdata.unpaid + userf.count;
                println!("new count=={}", newupaid)
            } else if userf.status == "pay" {
                println!("pay======");
            } else {
                println!(" show error");
            }
        }
        Err(err) => {
            println!("{}", err)
        }
    }
}
// pub async fn delete_user(
//     extract::State(pool): extract::State<PgPool>,
//     Json(newagent): Json<CreateAgent>,
// ) -> Result<Json<Agent>, ApiError> {
//     let agent = db::addtodb(pool, newagent).await;
//     match agent {
//         Ok(agent) => Ok(Json(Agent::from(agent))),
//         Err(e) => Err(ApiError::new_internal(e.to_string())),
//     }
// }
