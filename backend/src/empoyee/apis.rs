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
use super::models::{Createtrans, Refreshtrans, Transaction, Transupdate};

pub async fn createtrans(
    extract::State(pool): extract::State<PgPool>,
    Json(ntrans): Json<Createtrans>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::addtodb(pool, ntrans).await;
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
        } // Ok(agent) => Ok(Json(Transaction::from(agent))),
          // Err(e) => Err(ApiError::new_internal(e.to_string())),
    }
}

pub async fn getall(
    State(pool): State<PgPool>,
) -> Result<impl IntoResponse, Json<Vec<Transaction>>> {
    let results = db::alltrans(pool).await.unwrap();
    Ok(Json(results))
}

pub async fn edittrans(
    extract::State(pool): extract::State<PgPool>,
    Json(editran): Json<Transupdate>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::edittrans(pool, editran).await;
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

pub async fn refreshtrans(
    State(pool): State<PgPool>,
    Json(refagent): Json<Refreshtrans>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let now = chrono::Utc::now();
    let results = db::refeshtrans(pool, refagent).await;

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
