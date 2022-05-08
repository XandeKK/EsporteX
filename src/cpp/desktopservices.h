#ifndef DESKTOPSERVICES_H
#define DESKTOPSERVICES_H

#include <QObject>

class DesktopServices : public QObject
{
    Q_OBJECT
public:
    explicit DesktopServices(QObject *parent = nullptr);

    void desktopServices(QString &url);

    Q_INVOKABLE void googleMap(QString &location);
    Q_INVOKABLE void instagram(QString &username);
    Q_INVOKABLE void twitter(QString &username);

signals:

};

#endif // DESKTOPSERVICES_H
