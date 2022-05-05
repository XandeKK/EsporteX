#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QEventLoop>
#include <QJsonDocument>
#include <QJsonObject>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QVariant>
#include <QGraphicsObject>
#include <QBuffer>

#include "database.h"

Database::Database(QObject *parent)
    : QObject{parent}
{

}


QByteArray Database::requestPost(QString &uri, QJsonObject &obj)
{
    QUrl url(uri);
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    QNetworkReply *reply = manager->post(request, data);

    QEventLoop loop;
    connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    QByteArray data_response = reply->readAll();

    reply->deleteLater();
    return data_response;

}

QByteArray Database::requestGet(QString &uri)
{
    QUrl url(uri);
    QNetworkRequest request(url);

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QNetworkReply *reply = manager->get(request);

    QEventLoop loop;
    connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    QByteArray data_response = reply->readAll();

    reply->deleteLater();
    return data_response;
}

QByteArray Database::requestPut(QString &uri, QJsonObject &obj)
{
    QUrl url(uri);
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QJsonDocument doc(obj);
    QByteArray data = doc.toJson();

    QNetworkReply *reply = manager->put(request, data);

    QEventLoop loop;
    connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    QByteArray data_response = reply->readAll();

    reply->deleteLater();
    return data_response;
}

QByteArray Database::requestDelete(QString &uri)
{
    QUrl url(uri);
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);

    QNetworkReply *reply = manager->deleteResource(request);

    QEventLoop loop;
    connect(reply, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    QByteArray data_response = reply->readAll();

    reply->deleteLater();
    return data_response;
}

QByteArray Database::getStates()
{
    QString uri = "http://10.0.0.22:3000/states";

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getCities(QString &idState)
{
    QString uri = "http://10.0.0.22:3000/cities/" + idState;

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getSports()
{
    QString uri = "http://10.0.0.22:3000/sports";

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getGames(QString &sport_id)
{
    QString uri = "http://10.0.0.22:3000/games/" + sport_id;

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getGamesUser()
{
    QString id = getUserId();

    QString uri = "http://10.0.0.22:3000/game_user/" + id;

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getInfoGame(QString &game_id)
{
    QString uri = "http://10.0.0.22:3000/info_game/" + game_id;

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getInfoProfile(QString &user_id)
{
    QString uri = "http://10.0.0.22:3000/info_profile/" + user_id;

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

bool Database::postUser(QString &name, QString &userName, QString &state_id, QString &city_id,
                        QString &twitter, QString &instagram, QString &description, QString &state, QString &city, QString email)
{
    QString uri = "http://10.0.0.22:3000/users";

    QJsonObject obj;
    obj["name"] = name;
    obj["username"] = userName;
    obj["email"] = email;
    obj["twitter"] = twitter;
    obj["instagram"] = instagram;
    obj["description"] = description;
    obj["image"] = image_profile;

    QByteArray request = requestPost(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);

    int id = document.object()["id"].toInt();
    QString id_s = QString::number(id);

    if(id >= 1)
    {
        bool ok = postAddress(state_id, city_id, id_s);
        if(ok)
        {
            insertUser(id_s, name, userName, email, twitter, instagram, description, state, city, state_id, city_id);
            return true;
        }
    }
    return false;
}

bool Database::putUser(QString &name, QString &twitter, QString &instagram, QString &description, QString &state, QString &city, QString &state_id, QString &city_id)
{
    QString id = getUserId();

    QString uri = "http://10.0.0.22:3000/users/" + id;

    QJsonObject obj;
    obj["name"] = name;
    obj["twitter"] = twitter;
    obj["instagram"] = instagram;
    obj["description"] = description;

    QByteArray request = requestPut(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["id"].toInt();

    if(documentValues >= 1){
        bool ok = putAddress(state_id, city_id, id);
        if(ok)
        {
            updateUser(name, twitter, instagram, description, state, city, state_id, city_id);
            return true;
        }
    }
    return false;
}

void Database::putImage(QVariant var)
{
    QSqlQuery query;

    QString id = getUserId();

    QByteArray ba;
    QBuffer bu(&ba);

    QImage img = qvariant_cast<QImage>(var);
    img.save(&bu, "JPG");

    QString uri = "http://10.0.0.22:3000/users/" + id;
    QJsonObject obj;
    obj["image"] = QString(ba.toBase64());

    requestPut(uri, obj);

    query.prepare("UPDATE user set image = :imagem where id = :id");
    query.bindValue(":imagem", QString(ba.toBase64()));
    query.bindValue(":id", id);

    query.exec();
}

void Database::deleteImage()
{
    QSqlQuery query;

    QString id = getUserId();

    QString uri = "http://10.0.0.22:3000/users/" + id;
    QJsonObject obj;
    obj["image"] = image_profile;

    requestPut(uri, obj);

    query.prepare("UPDATE user set image = :imagem where id = :id");
    query.bindValue(":imagem", image_profile);
    query.bindValue(":id", id);

    query.exec();
}

bool Database::postAddress(QString &state_id, QString &city_id, QString &user_id)
{
    QString uri = "http://10.0.0.22:3000/user_adresses";

    QJsonObject obj;
    obj["state_id"] = state_id;
    obj["city_id"] = city_id;
    obj["user_id"] = user_id;

    QByteArray request = requestPost(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["id"].toInt();
    this->address_id = documentValues;

    if(documentValues >= 1){
        return true;
    }
    return false;
}

bool Database::putAddress(QString &state_id, QString &city_id, QString &user_id)
{
    QSqlQuery query("SELECT id FROM user_address");
    int user_address_id = query.record().indexOf("id");
    QString id;

    while (query.next()){
        id = query.value(user_address_id).toString();
    }

    QString uri = "http://10.0.0.22:3000/user_adresses/" + id;

    QJsonObject obj;
    obj["state_id"] = state_id;
    obj["city_id"] = city_id;
    obj["user_id"] = user_id;

    QByteArray request = requestPut(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["id"].toInt();
    this->address_id = documentValues;

    if(documentValues >= 1){
        return true;
    }
    return false;
}

QByteArray Database::postGame(QString &sport_id, QString &state_id, QString &city_id,
                              QString &address, QString &date, QString &description, QString &start, QString &end)
{
    QString uri = "http://10.0.0.22:3000/games";

    QString id = getUserId();

    QJsonObject obj;
    obj["user_id"] = id;
    obj["sport_id"] = sport_id;
    obj["state_id"] = state_id;
    obj["city_id"] = city_id;
    obj["address"] = address;
    obj["date"] = date;
    obj["start"] = start;
    obj["end"] = end;
    obj["description"] = description;

    QByteArray request = requestPost(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::putGame(QString &game_id, QString &sport_id, QString &state_id, QString &city_id, QString &address, QString &date, QString &description, QString &start, QString &end)
{
    QString uri = "http://10.0.0.22:3000/games/" + game_id;

    QJsonObject obj;
    obj["sport_id"] = sport_id;
    obj["state_id"] = state_id;
    obj["city_id"] = city_id;
    obj["address"] = address;
    obj["date"] = date;
    obj["start"] = start;
    obj["end"] = end;
    obj["description"] = description;

    QByteArray request = requestPut(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

bool Database::deleteGame(QString &game_id)
{
    QString uri = "http://10.0.0.22:3000/games/" + game_id;

    QByteArray request = requestDelete(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);
    qDebug() << document;
    int documentValues = document.object()["sucess"].toInt();

    if(documentValues >= 1){
        return true;
    }
    return false;
}

bool Database::isParticipate(QString &game_id)
{
    QString id = getUserId();

    QString uri = "http://10.0.0.22:3000/participations/" + game_id + "?user_id=" + id + "&task=1";

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["participate"].toInt();

    if(documentValues == 1){
        return true;
    }
    return false;
}

bool Database::postParticipation(QString &game_id)
{
    QString uri = "http://10.0.0.22:3000/participations";

    QString id = getUserId();

    QJsonObject obj;
    obj["user_id"] = id;
    obj["game_id"] = game_id;

    QByteArray request = requestPost(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);

    int documentValues = document.object()["sucess"].toInt();

    if(documentValues >= 1){
        return true;
    }
    return false;
}

bool Database::deleteParticipation(QString &game_id)
{
    QString id = getUserId();

    QString uri = "http://10.0.0.22:3000/participations/" + game_id + "?user_id=" + id;

    QByteArray request = requestDelete(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["sucess"].toInt();

    if(documentValues >= 1){
        return true;
    }
    return false;
}

QByteArray Database::getListParticipant(QString &game_id)
{
    QString uri = "http://10.0.0.22:3000/participations/" + game_id + "?task=2";

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

int Database::countParticipation(QString &user_id)
{
    QString uri = "http://10.0.0.22:3000/participations/0?user_id=" + user_id + "&task=3";

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);
    int documentValues = document.object()["count"].toInt();

    return documentValues;
}

void Database::openSqliteDatabase()
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("database.db");

    if(!m_db.open()){
        qDebug() << "Error: connection with database failed";
    }else {
        qDebug() << "Database: connection ok";
    }
}

void Database::dropAndCreateTables()
{
    QSqlQuery query;
    query.exec("DROP TABLE IF EXISTS user");
    query.exec("CREATE TABLE user(id int, name VARCHAR(50), username VARCHAR(50),"
               "email VARCHAR(100), twitter VARCHAR(255), instagram VARCHAR(255), description TEXT, image TEXT)");

    query.exec("DROP TABLE IF EXISTS user_address");
    query.exec("CREATE TABLE user_address(id int, state_id INT, city_id INT, city VARCHAR(50) NOT NULL, state VARCHAR(50) not null)");
}

void Database::insertUser(QString &user_id, QString &name, QString &username, QString &email, QString &twitter,
                          QString &instagram, QString &description, QString &state, QString &city, QString &state_id, QString &city_id)
{
    QSqlQuery query;
    query.prepare("INSERT INTO user VALUES (:user_id, :name, :username, :email, :twitter, :instagram, :description, :image)");
    query.bindValue(":user_id", user_id);
    query.bindValue(":name", name);
    query.bindValue(":username", username);
    query.bindValue(":email", email);
    query.bindValue(":twitter", twitter);
    query.bindValue(":instagram", instagram);
    query.bindValue(":description", description);
    query.bindValue(":image", image_profile);

    query.exec();

    query.prepare("INSERT INTO user_address VALUES(:id, :state_id, :city_id, :city, :state)");
    query.bindValue(":id", address_id);
    query.bindValue(":state_id", state_id);
    query.bindValue(":city_id", city_id);
    query.bindValue(":city", city);
    query.bindValue(":state", state);

    query.exec();
}

void Database::updateUser(QString &name, QString &twitter, QString &instagram, QString &description, QString &state, QString &city, QString &state_id, QString &city_id)
{
    QSqlQuery query;

    QString id = getUserId();


    query.prepare("UPDATE user SET name = :name,"
                  " twitter = :twitter,"
                  " instagram = :instagram,"
                  " description = :description where id = :id");
    query.bindValue(":id", id);
    query.bindValue(":name", name);
    query.bindValue(":twitter", twitter);
    query.bindValue(":instagram", instagram);
    query.bindValue(":description", description);

    query.exec();

    query.exec("DELETE FROM user_address");

    query.prepare("INSERT INTO user_address VALUES(:id, :state_id, :city_id, :city, :state)");
    query.bindValue(":id", address_id);
    query.bindValue(":state_id", state_id);
    query.bindValue(":city_id", city_id);
    query.bindValue(":city", city);
    query.bindValue(":state", state);

    query.exec();
}

QString Database::getUser()
{
    QSqlQuery query("SELECT * FROM user");
    int user_id = query.record().indexOf("id");
    int name_id = query.record().indexOf("name");
    int username_id = query.record().indexOf("username");
    int twitter_id = query.record().indexOf("twitter");
    int instagram_id = query.record().indexOf("instagram");
    int description_id = query.record().indexOf("description");
    int image_id = query.record().indexOf("image");

    QJsonObject mainObject;

    while (query.next()){
        mainObject.insert("id", query.value(user_id).toString());
        mainObject.insert("name", query.value(name_id).toString());
        mainObject.insert("username", query.value(username_id).toString());
        mainObject.insert("twitter", query.value(twitter_id).toString());
        mainObject.insert("instagram", query.value(instagram_id).toString());
        mainObject.insert("description", query.value(description_id).toString());
        mainObject.insert("image", query.value(image_id).toString());
    }

    query.exec("SELECT * FROM user_address");
    int city_id = query.record().indexOf("city");
    int state_id = query.record().indexOf("state");
    int city_id_int = query.record().indexOf("city_id");
    int state_id_int = query.record().indexOf("state_id");

    while (query.next()){
        mainObject.insert("city_id", query.value(city_id_int).toString());
        mainObject.insert("state_id", query.value(state_id_int).toString());
        mainObject.insert("city", query.value(city_id).toString());
        mainObject.insert("state", query.value(state_id).toString());
    }

    QJsonDocument jsonDoc;
    jsonDoc.setObject(mainObject);

    return jsonDoc.toJson(QJsonDocument::Compact);
}

QString Database::getUserId()
{
    QSqlQuery query("SELECT id FROM user");
    int user_id = query.record().indexOf("id");
    QString id;

    while (query.next()){
        id = query.value(user_id).toString();
    }

    return id;
}


