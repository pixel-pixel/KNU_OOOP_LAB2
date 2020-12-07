#ifndef NOTESLIST_H
#define NOTESLIST_H

#include <QAbstractListModel>
#include <QVariant>
#include <vector>
#include <QString>

class NotesList : public QAbstractListModel
{
    Q_OBJECT
public:
    NotesList(QObject *parent);
    NotesList();

    int rowCount(const QModelIndex& parent = QModelIndex{}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    //QHash <int, QByteArray> roleNames() const override;

private:
    std::vector<int> notes;
};

#endif // NOTESLIST_H
