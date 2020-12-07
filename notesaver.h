#ifndef NOTESAVER_H
#define NOTESAVER_H

#include <QObject>


class NoteSaver : public QObject
{
    Q_OBJECT
public:
    NoteSaver() {}
    virtual ~NoteSaver() {}
};

#endif // NOTESAVER_H
