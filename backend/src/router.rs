use axum::{
    routing::{get, post, put},
    Router,
};
use sqlx::{Pool, Postgres};

use crate::{market, transaction, user};

pub fn build_routes(pool: Pool<Postgres>) -> Router {
    Router::new()
        .route(
            "/api/agents",
            post(market::apis::create_agent)
                .get(market::apis::get_agents)
                .put(market::apis::edit_agent),
        )
        .route(
            "/api/transaction",
            post(transaction::apis::createtrans)
                .get(transaction::apis::getall)
                .put(transaction::apis::edittrans),
        )
        .route(
            "/api/transaction/refresh",
            post(transaction::apis::refreshtrans),
        )
        .route("/api/agent/status", put(market::apis::editstatus))
        .route("/api/agents/refresh", post(market::apis::refreshagent))
        .route("/api/agent/user/:userid", get(market::apis::getbyuser))
        .route(
            "/api/users",
            post(user::apis::create_user)
                .get(user::apis::get_users)
                .put(user::apis::edit_user),
        )
        .route("/api/user/:useruid", get(user::apis::getauser))
        .route("/api/user/pay", post(user::apis::userpay))
        .with_state(pool)
}
