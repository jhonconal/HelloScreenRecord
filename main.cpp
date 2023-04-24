#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "screenrecord.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QCoreApplication::addLibraryPath(QCoreApplication::applicationDirPath()+"/plugins");
    qDebug()<<"==>"<<QCoreApplication::applicationDirPath()+"/plugins";

    QQmlApplicationEngine engine;
    ScreenRecord screenrecord;
    engine.rootContext()->setContextProperty(QStringLiteral("ScreenRecord"), &screenrecord);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
