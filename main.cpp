#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "filedreader.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    FileDreader fd{};
    qmlRegisterType <FileDreader>("NOTERdam", 1, 0, "FileReader");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
