/*
createtrans
edittrans
refreshtrans

*/
use axum::extract::{self, State};
use axum::http::StatusCode;
use axum::response::IntoResponse;
use axum::Json;
use serde_json::json;
use sqlx::PgPool;

use super::db;
use super::models::{Createtask, Refreshtask, Task, Updatetask};

pub async fn createtask(
    extract::State(pool): extract::State<PgPool>,
    Json(newtask): Json<Createtask>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::addtodb(pool, newtask).await;
    match trans {
        Ok(transdata) => {
            let json_response = serde_json::json!({
                "message": "successfull added",
                "data": transdata
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

pub async fn getall(State(pool): State<PgPool>) -> Result<impl IntoResponse, Json<Vec<Task>>> {
    let results = db::alltask(pool).await.unwrap();
    Ok(Json(results))
}

pub async fn edittask(
    extract::State(pool): extract::State<PgPool>,
    Json(uptask): Json<Updatetask>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::edittask(pool, uptask).await;
    match trans {
        Ok(edtrans) => {
            let json_response = serde_json::json!({
                "status": "success",
                "data": edtrans
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

pub async fn refreshtask(
    State(pool): State<PgPool>,

    Json(refagent): Json<Refreshtask>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let now = chrono::Utc::now();
    let results = db::refeshtask(pool, refagent).await;

    match results {
        Ok(results) => {
            let json_response = serde_json::json!({
                "data": results,
                "message": "successfull updated",
                "timestamp":now.to_owned()
            });
            Ok(Json(json_response).into_response())
        }
        Err(err) => {
            return Err((
                StatusCode::INTERNAL_SERVER_ERROR,
                Json(json!({
                    "status": "error",
                    "message": format!("{:?}", err)})),
            ));
        }
    }
}
