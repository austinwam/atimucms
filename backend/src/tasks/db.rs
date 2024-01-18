use sqlx::PgPool;

use super::models::{Createtask, Refreshtask, Task, Updatetask};

pub async fn addtodb(pool: PgPool, createtran: Createtask) -> Result<Task, sqlx::Error> {
    let sqlurl = "INSERT INTO task 
    (about,status,createdby) VALUES ($1,$2,$3)  RETURNING  *";
    let nagent = sqlx::query_as::<_, Task>(sqlurl)
        .bind(createtran.about)
        .bind(createtran.status)
        .bind(createtran.createdby)
        .fetch_one(&pool)
        .await?;
    Ok(nagent)
}
// CREATE TABLE task
// (
//   taskid     serial       NULL    ,
//   about      varchar(200) NULL    ,
//   status     varchar(20)  NULL    ,
//   userid     int          NOT NULL,
//   createdby  int          NOT NULL,
//   updated_at timestamptz  NOT NULL DEFAULT NOW,
//   created_at timestamptz  NOT NULL DEFAULT NOW,
//   PRIMARY KEY (taskid)
// );

pub async fn alltrans(pool: PgPool) -> Result<Vec<Task>, sqlx::Error> {
    let fnsql = "SELECT * FROM task";
    let agents = sqlx::query_as::<_, Task>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn edittrans(pool: PgPool, edittrans: Updatetask) -> Result<Task, sqlx::Error> {
    let fnsql: &str =
        "UPDATE task SET status = $1,userid=$2,about=$3,updated_at= Now() WHERE transid = $4 RETURNING *";
    let edagent = sqlx::query_as::<_, Task>(fnsql)
        .bind(edittrans.status)
        .bind(edittrans.userid)
        .bind(edittrans.about)
        .bind(edittrans.transid)
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
