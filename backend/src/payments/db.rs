use sqlx::PgPool;

use super::models::{Createpayment, Payment, Refreshpayment, Updatepayment};

pub async fn addtodb(pool: PgPool, creatpay: Createpayment) -> Result<Payment, sqlx::Error> {
    let sqlurl="INSERT INTO payments(amount,status,kind,method,userid) VALUES ($1,$2,$3,$4,$5)  RETURNING  *";
    let nagent = sqlx::query_as::<_, Payment>(sqlurl)
        .bind(creatpay.amount)
        .bind(creatpay.status)
        .bind(creatpay.kind)
        .bind(creatpay.method)
        .bind(creatpay.userid)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}

pub async fn alltrans(pool: PgPool) -> Result<Vec<Payment>, sqlx::Error> {
    let fnsql = "SELECT * FROM payments";
    let agents = sqlx::query_as::<_, Payment>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn edittrans(pool: PgPool, editpay: Updatepayment) -> Result<Payment, sqlx::Error> {
    let fnsql: &str =
        "UPDATE payments SET status = $1,updated_at= Now() WHERE transid = $2 RETURNING *";
    let edagent = sqlx::query_as::<_, Payment>(fnsql)
        .bind(editpay.status)
        .bind(editpay.transid)
        .fetch_one(&pool)
        .await?;
    Ok(edagent)
}
pub async fn refeshtrans(pool: PgPool, repay: Refreshpayment) -> Result<Vec<Payment>, sqlx::Error> {
    let fnsql: &str = "SELECT * FROM payments WHERE updated_at BETWEEN $1 AND Now()";
    let edagent = sqlx::query_as::<_, Payment>(fnsql)
        .bind(repay.startdt)
        .fetch_all(&pool)
        .await?;
    Ok(edagent)
}
