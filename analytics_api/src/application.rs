use super::schema::applications;
use serde::{Deserialize, Serialize};
use chrono::{Utc, NaiveDateTime};
use uuid::Uuid;
use std::hash::{Hash, Hasher};
use std::collections::hash_map::DefaultHasher;
use crate::application_dao::ApplicationDao;
use crate::dao::Dao;
use diesel::{PgConnection};

#[derive(Serialize, Deserialize)]
pub struct ApplicationData<'a>{
    pub application_name: &'a str,
    pub os: &'a str
}

#[derive(Serialize, Clone, Debug, Hash, Queryable, AsChangeset, Insertable)]
#[table_name="applications"]
pub struct Application {
    pub application_id: String,
    pub application_name: String,
    pub created_time: NaiveDateTime,
    pub token: String,
    pub os: String,
}

impl Application{
    pub fn new(name: &str, os: ApplicationType) -> Application{
        let application_id: String = Uuid::new_v4().to_string();
        let get_time = Utc::now().naive_utc();
        let mut app = Application{application_name: String::from(name), os: String::from(os.as_str()), application_id, created_time: get_time, token: String::new()};
        app.token = create_token(app.clone());
        app
    }
    pub fn insert_entry(self, conn: &mut PgConnection) -> bool{
        let app_dao = ApplicationDao::new();
        app_dao.insert_entry(self, conn)
    }
}

pub fn get_all(conn:  &mut PgConnection) -> Vec<Application>{
    let app_dao = ApplicationDao::new();
    app_dao.get_all(conn)
}

#[derive(Hash, Debug)]
pub enum ApplicationType { IOS, Android, Web, NotFound }
impl ApplicationType {
    pub fn as_str(&self) -> &'static str {
        match *self {
            ApplicationType::IOS => "ios",
            ApplicationType::Android => "android",
            ApplicationType::Web => "web",
            ApplicationType::NotFound => "notFound",
        }
    }
    pub fn from_str(str: &str) ->  ApplicationType {
        match str{
            "ios" => ApplicationType::IOS,
            "android" => ApplicationType::Android,
            "web" => ApplicationType::Web,
            "notFound" => ApplicationType::NotFound,
            _ => ApplicationType::NotFound
        }
    }
}


fn create_token(app: Application) -> String{
    let mut s = DefaultHasher::new();
    app.hash(&mut s);
    s.finish().to_string()
}

