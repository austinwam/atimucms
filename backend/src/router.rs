use axum::{
    routing::{post},
    Router,
};
use sqlx::{Pool, Postgres};

use crate::{account, users};

pub fn build_routes(pool: Pool<Postgres>) -> Router {
    Router::new()
        // .route(
        //     "/api/agents",
        //     post(market::apis::create_agent)
        //         .get(market::apis::get_agents)
        //         .put(market::apis::edit_agent),
        // )
        // .route(
        //     "/api/transaction",
        //     post(transaction::apis::createtrans)
        //         .get(transaction::apis::getall)
        //         .put(transaction::apis::edittrans),
        // )
        // .route(
        //     "/api/transaction/refresh",
        //     post(transaction::apis::refreshtrans),
        // )
        // .route("/api/agent/status", put(market::apis::editstatus))
        // .route("/api/agents/refresh", post(market::apis::refreshagent))
        // .route("/api/agent/user/:userid", get(market::apis::getbyuser))
        .route(
            "/account",
            post(account::apis::createacc)
                .put(account::apis::editacc),
        )
        .route("/auth/login", post(users::apis::login))
        .route("/auth/register", post(users::apis::register))
        .route("/user/refresh", post(users::apis::refreshuser))
        .with_state(pool)
}
