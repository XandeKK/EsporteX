#include "desktopservices.h"

#include <QDesktopServices>
#include <QUrl>

DesktopServices::DesktopServices(QObject *parent)
    : QObject{parent}
{

}

void DesktopServices::desktopServices(QString &url)
{
    QDesktopServices::openUrl(QUrl(url));
}


void DesktopServices::googleMap(QString &location)
{
    QString url = "http://maps.google.com/maps?&daddr=" + location;
    desktopServices(url);

}

void DesktopServices::instagram(QString &username)
{
    QString url = "https://www.instagram.com/" + username;
    desktopServices(url);
}

void DesktopServices::twitter(QString &username)
{
    QString url = "https://twitter.com/" + username;
    desktopServices(url);
}
