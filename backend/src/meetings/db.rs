use sqlx::PgPool;

use super::models::{Createmeet, Meet, Updatemeet, Refreshmeet};

pub async fn addtodb(pool: PgPool, createtran: Createmeet) -> Result<Meet, sqlx::Error> {
    let sqlurl = "INSERT INTO meetings (userid,about,status,datetime) VALUES ($1,$2,$3,$4 )  RETURNING  *";
    let nagent = sqlx::query_as::<_, Meet>(sqlurl)
        .bind(createtran.userid)
        .bind(createtran.about)
        .bind(createtran.status)
        .bind(createtran.datetime)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}

pub async fn allmeet(pool: PgPool) -> Result<Vec<Meet>, sqlx::Error> {
    let fnsql = "SELECT * FROM meetings";
    let agents = sqlx::query_as::<_, Meet>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn editmeet(pool: PgPool, edittrans: Updatemeet) -> Result<Meet, sqlx::Error> {
    let fnsql: &str =
        "UPDATE meetings SET status = $1,updated_at= Now() WHERE transid = $2 RETURNING *";
    let edagent = sqlx::query_as::<_, Meet>(fnsql)
        .bind(edittrans.status)
        .bind(edittrans.transid)
        .fetch_one(&pool)
        .await?;
    Ok(edagent)
}
pub async fn refeshmeet(
    pool: PgPool,
    refreshtrans: Refreshmeet,
) -> Result<Vec<Meet>, sqlx::Error> {
    let fnsql: &str = "SELECT * FROM meetings WHERE updated_at BETWEEN $1 AND Now()";
    let edagent = sqlx::query_as::<_, Meet>(fnsql)
        .bind(refreshtrans.startdt)
        .fetch_all(&pool)
        .await?;
    Ok(edagent)
}
