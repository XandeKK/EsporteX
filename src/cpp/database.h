#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSqlDatabase>
#include <QJsonDocument>
#include <QVariant>

class Database : public QObject
{
    Q_OBJECT
public:
    explicit Database(QObject *parent = nullptr);

    QByteArray requestPost(QString &uri, QJsonObject &obj);
    QByteArray requestGet(QString &uri);
    QByteArray requestPut(QString &uri, QJsonObject &obj);

    Q_INVOKABLE QByteArray getStates();
    Q_INVOKABLE QByteArray getCities(QString &state);

    Q_INVOKABLE QByteArray getSports();

    Q_INVOKABLE QByteArray getGames(QString &sport_id);
    Q_INVOKABLE QByteArray getGamesUser();
    Q_INVOKABLE QByteArray getInfoGame(QString &game_id);
    Q_INVOKABLE QByteArray getInfoProfile(QString &user_id);

    Q_INVOKABLE bool postUser(QString &name,
                              QString &userName,
                              QString &state_id,
                              QString &city_id,
                              QString &twitter,
                              QString &instagram,
                              QString &description,
                              QString email = ""
            );
    bool postAddress(QString &state_id,
                     QString &city_id,
                     QString &user_id
                     );

    Q_INVOKABLE QByteArray postGame(QString &sport_id,
                              QString &state_id,
                              QString &city_id,
                              QString &address,
                              QString &date,
                              QString &description,
                              QString &start,
                              QString &end
                              );


signals:

};

#endif // DATABASE_H
