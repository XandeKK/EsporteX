#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>
#include <qqmlcontext.h>

#include "src/cpp/database.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::Round);

    Database database;

    QQmlApplicationEngine engine;
    const QUrl url("qrc:/Window/main.qml");
    engine.rootContext()->setContextProperty( "_database", &database);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
