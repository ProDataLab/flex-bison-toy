#include <QCoreApplication>
#include <QTimer>
#include <QtDebug>


int main(int argc, char** argv)
{
    QCoreApplication a(argc, argv);

    qDebug() << "Hello world!";

    return a.exec();
}



