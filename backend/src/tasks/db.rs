use sqlx::PgPool;

use super::models::{Createtask, Refreshtask, Task, Updatetask};

pub async fn addtodb(pool: PgPool, createtran: Createtask) -> Result<Task, sqlx::Error> {
    let sqlurl =
        "INSERT INTO task(userid,about,status,datetime) VALUES ($1,$2,$3,$4)  RETURNING  *";
    let nagent = sqlx::query_as::<_, Task>(sqlurl)
        .bind(createtran.userid)
        .bind(createtran.about)
        .bind(createtran.status)
        .bind(createtran.datetime)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}

pub async fn alltask(pool: PgPool) -> Result<Vec<Task>, sqlx::Error> {
    let fnsql = "SELECT * FROM task";
    let agents = sqlx::query_as::<_, Task>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn edittask(pool: PgPool, edittrans: Updatetask) -> Result<Task, sqlx::Error> {
    let fnsql: &str =
        "UPDATE task SET status = $1,userid=$2,about=$3,updated_at= Now() WHERE transid = $4 RETURNING *";
    let edagent = sqlx::query_as::<_, Task>(fnsql)
        .bind(edittrans.status)
        .bind(edittrans.userid)
        .bind(edittrans.about)
        .bind(edittrans.taskid)
        .fetch_one(&pool)
        .await?;
    Ok(edagent)
}

pub async fn refeshtask(pool: PgPool, refreshtask: Refreshtask) -> Result<Vec<Task>, sqlx::Error> {
    let fnsql: &str = "SELECT * FROM task WHERE updated_at BETWEEN $1 AND Now()";
    let edagent = sqlx::query_as::<_, Task>(fnsql)
        .bind(refreshtask.startdt)
        .fetch_all(&pool)
        .await?;
    Ok(edagent)
}
