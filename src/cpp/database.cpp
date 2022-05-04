#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QEventLoop>
#include <QJsonDocument>
#include <QJsonObject>

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
    QString uri = "http://10.0.0.22:3000/game_user/3"; // Passar como paramento o id do usuario

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getInfoGame(QString &game_id)
{
    QString uri = "http://10.0.0.22:3000/info_game/" + game_id; // Passar como paramento o id do usuario

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

QByteArray Database::getInfoProfile(QString &user_id)
{
    QString uri = "http://10.0.0.22:3000/info_profile/" + user_id; // Passar como paramento o id do usuario

    QByteArray request = requestGet(uri);

    QJsonDocument document = QJsonDocument::fromJson(request);

    return document.toJson(QJsonDocument::Compact);
}

bool Database::postUser(QString &name, QString &userName, QString &state_id, QString &city_id,
                             QString &twitter, QString &instagram, QString &description, QString email)
{
    QString uri = "http://10.0.0.22:3000/users";

    QJsonObject obj;
    obj["name"] = name;
    obj["username"] = userName;
    obj["email"] = email;
    obj["twitter"] = twitter;
    obj["instagram"] = instagram;
    obj["description"] = description;

    QByteArray request = requestPost(uri, obj);

    QJsonDocument document = QJsonDocument::fromJson(request);

    int id = document.object()["id"].toInt();
    QString id_s = QString::number(id);

    if(id >= 1)
    {
        bool ok = postAddress(state_id, city_id, id_s);
        if(ok)
        {
            return true;
        }
    }
    return false;
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

    if(documentValues >= 1){
        return true;
    }
    return false;
}

QByteArray Database::postGame(QString &sport_id, QString &state_id, QString &city_id,
                              QString &address, QString &date, QString &description, QString &start, QString &end)
{
    QString uri = "http://10.0.0.22:3000/games";

    QJsonObject obj;
    obj["user_id"] = "3"; // Ter um banco de dados interno
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


