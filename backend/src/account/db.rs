use sqlx::PgPool;

use super::models::{Account, CreateAccount, Refreshacc, Updateacc};

pub async fn addtodb(pool: PgPool, createtran: CreateAccount) -> Result<Account, sqlx::Error> {
    let sqlurl = "INSERT INTO account (userid,status) VALUES ($1,$2)  RETURNING  *";
    let nagent = sqlx::query_as::<_, Account>(sqlurl)
        .bind(createtran.userid)
        .bind(createtran.status)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}

pub async fn allaccs(pool: PgPool) -> Result<Vec<Account>, sqlx::Error> {
    let fnsql = "SELECT * FROM account";
    let agents = sqlx::query_as::<_, Account>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn editaccs(pool: PgPool, editaccs: Updateacc) -> Result<Account, sqlx::Error> {
    let fnsql: &str =
        "UPDATE account SET status = $1,updated_at= Now() WHERE accsid = $2 RETURNING *";
    let edagent = sqlx::query_as::<_, Account>(fnsql)
        .bind(editaccs.status)
        .bind(editaccs.accountid)
        .fetch_one(&pool)
        .await?;
    Ok(edagent)
}

pub async fn refeshaccs(
    pool: PgPool,
    refreshaccs: Refreshacc,
) -> Result<Vec<Account>, sqlx::Error> {
    let fnsql: &str = "SELECT * FROM Accounts WHERE updated_at BETWEEN $1 AND Now()";
    let edagent = sqlx::query_as::<_, Account>(fnsql)
        .bind(refreshaccs.startdt)
        .fetch_all(&pool)
        .await?;
    Ok(edagent)
}
