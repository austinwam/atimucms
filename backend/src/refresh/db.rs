pub fn getrefresh() -> i32 {
    1
}

pub async fn addtodb(pool: PgPool, createtran: Createtrans) -> Result<Transaction, sqlx::Error> {
    let sqlurl="INSERT INTO account (userid,username,status,count,amount) VALUES ($1,$2,$3,$4,$5)  RETURNING  *";
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
