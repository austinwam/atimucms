use axum::{extract::State, response::IntoResponse, Json};
use hyper::StatusCode;
use sqlx::PgPool;

use crate::account::models::Refreshtrans;

pub async fn refresh(
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
