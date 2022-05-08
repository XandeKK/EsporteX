#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>
#include <qqmlcontext.h>

#include "src/cpp/database.h"
#include "src/cpp/desktopservices.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::Round);

    Database database;
    database.openSqliteDatabase();

    DesktopServices services;

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/Window/main.qml");
    engine.rootContext()->setContextProperty( "_database", &database);
    engine.rootContext()->setContextProperty( "_desktopServices", &services);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
