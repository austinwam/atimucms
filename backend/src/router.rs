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
            "/users",
            post(users::apis::create_user).get(users::apis::get_users), // .put(users::apis::edit_user),
        )
        .route(
            "/auth/login",
            post(users::apis::login), //.post(users::apis::get_users), // .put(users::apis::edit_user),
        )
        .route(
            "/auth/register",
            post(users::apis::register), //.post(users::apis::get_users), // .put(users::apis::edit_user),
        )
        .with_state(pool)
}
