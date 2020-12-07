#include "notesmodel.h"

NotesModel::NotesModel(QObject *parent) : QAbstractListModel{parent}
{
    notes.push_back(3);
}

int NotesModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return notes.size();
}

QVariant NotesModel::data(const QModelIndex &index, int role) const
{
    if(index.isValid() || role != Qt::DisplayRole){
        return {};
    }
    const int row = index.row();
    return QVariant::fromValue(notes.at(row));
}
