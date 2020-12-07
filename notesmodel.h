#ifndef NOTESMODEL_H
#define NOTESMODEL_H


#include <QAbstractListModel>
#include <QVariant>
#include <vector>
#include <QString>

class NotesModel : public QAbstractListModel
{
    Q_OBJECT
public:
    NotesModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex{}) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    //QHash <int, QByteArray> roleNames() const override;

private:
    std::vector<int> notes;
};
#endif // NOTESMODEL_H
