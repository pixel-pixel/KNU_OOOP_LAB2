#include "noteslist.h"

NotesList::NotesList(QObject *parent) : QAbstractListModel{parent}
{

}

NotesList::NotesList() : QAbstractListModel{nullptr}
{

    notes.push_back(3);
}

int NotesList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return notes.size();
}

//QHash<int, QByteArray> NotesList::roleNames() const
//{
//    return null;
//}

QVariant NotesList::data(const QModelIndex &index, int role) const
{
    if(index.isValid() || role != Qt::DisplayRole){
        return {}
    }
    const int row = index.row();
    return QVariant::fromValue(notes.at(row));
}
