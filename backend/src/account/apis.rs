use super::db;
use super::models::{Account, CreateAccount, Refreshacc, Updateacc};
use axum::extract::{self, State};
use axum::http::StatusCode;
use axum::response::IntoResponse;
use axum::Json;
use hyper::HeaderMap;
use serde_json::json;
use sqlx::PgPool;

pub async fn createacc(
    headers: HeaderMap,
    extract::State(pool): extract::State<PgPool>,
    Json(accountn): Json<CreateAccount>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::addtodb(pool, accountn).await;
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

pub async fn getaccs(State(pool): State<PgPool>) -> Result<impl IntoResponse, Json<Vec<Account>>> {
    let results = db::allaccs(pool).await.unwrap();
    Ok(Json(results))
}

pub async fn editacc(
    extract::State(pool): extract::State<PgPool>,
    Json(editran): Json<Updateacc> ,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let trans = db::editaccs(pool, editran).await;
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
                Json(json!(
                    {
                    "status": "error",
                    "message": format!("{:?}", err)
                })),
            ));
        }
    }
}

pub async fn refreshacc(
    State(pool): State<PgPool>,
    Json(refagent): Json<Refreshacc>,
) -> Result<impl IntoResponse, (StatusCode, Json<serde_json::Value>)> {
    let now = chrono::Utc::now();
    let results = db::refeshaccs(pool, refagent).await;

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
