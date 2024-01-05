use sqlx::PgPool;

use super::models::{CreateUser, EditUser, User};

pub async fn addtodb(pool: PgPool, newuser: CreateUser) -> Result<User, sqlx::Error> {
    let sqlurl =
        "INSERT INTO users (useruid,name,phone,email,status) VALUES ($1,$2,$3,$4,$5)  RETURNING  *";
    let nuser = sqlx::query_as::<_, User>(sqlurl)
        .bind(newuser.useruid)
        .bind(newuser.name)
        .bind(newuser.phone)
        .bind(newuser.email)
        .bind(newuser.status)
        .fetch_one(&pool)
        .await?;
    Ok(nuser)
}
// pub assignedto: i32,
pub async fn allusers(pool: PgPool) -> Result<Vec<User>, sqlx::Error> {
    let fnsql = "SELECT * FROM users";
    let agents = sqlx::query_as::<_, User>(fnsql)
        .fetch_all(&pool)
        .await
        .unwrap();
    Ok(agents)
}

pub async fn edit_user(pool: PgPool, edituser: EditUser) -> Result<User, sqlx::Error> {
    let fnsql: &str =
        "UPDATE users SET name = $1,phone = $2,status = $3,paid = $4,unpaid = $5, amount = $6 WHERE agentid = $7 RETURNING *";
    let newuser = sqlx::query_as::<_, User>(fnsql)
        .bind(edituser.name)
        .bind(edituser.phone)
        .bind(edituser.status)
        .bind(edituser.paid)
        .bind(edituser.unpaid)
        .bind(edituser.amount)
        .bind(edituser.userid)
        .fetch_one(&pool)
        .await?;
    Ok(newuser)
}

pub async fn getauser(pool: PgPool, useruid: String) -> Result<User, sqlx::Error> {
    let fnsql = "SELECT * FROM users where useruid = $1";
    let newuser: User = sqlx::query_as::<_, User>(fnsql)
        .bind(useruid)
        .fetch_one(&pool)
        .await?;
    Ok(newuser)
}
