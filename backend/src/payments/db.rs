use sqlx::PgPool;

use super::models::{Createtrans, Refreshtrans, Transaction, Transupdate};

pub async fn addtodb(pool: PgPool, createtran: Createtrans) -> Result<Transaction, sqlx::Error> {
    let sqlurl="INSERT INTO transactions (userid,username,status,count,amount) VALUES ($1,$2,$3,$4,$5)  RETURNING  *";
    let nagent = sqlx::query_as::<_, Transaction>(sqlurl)
        .bind(createtran.userid)
        .bind(createtran.username)
        .bind(createtran.status)
        .bind(createtran.count)
        .bind(createtran.amount)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}

pub async fn alltrans(pool: PgPool) -> Result<Vec<Transaction>, sqlx::Error> {
    let fnsql = "SELECT * FROM transactions";
    let agents = sqlx::query_as::<_, Transaction>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn edittrans(pool: PgPool, edittrans: Transupdate) -> Result<Transaction, sqlx::Error> {
    let fnsql: &str =
        "UPDATE transactions SET status = $1,updated_at= Now() WHERE transid = $2 RETURNING *";
    let edagent = sqlx::query_as::<_, Transaction>(fnsql)
        .bind(edittrans.status)
        .bind(edittrans.transid)
        .fetch_one(&pool)
        .await?;
    Ok(edagent)
}
pub async fn refeshtrans(
    pool: PgPool,
    refreshtrans: Refreshtrans,
) -> Result<Vec<Transaction>, sqlx::Error> {
    let fnsql: &str = "SELECT * FROM transactions WHERE updated_at BETWEEN $1 AND Now()";
    let edagent = sqlx::query_as::<_, Transaction>(fnsql)
        .bind(refreshtrans.startdt)
        .fetch_all(&pool)
        .await?;
    Ok(edagent)
}
