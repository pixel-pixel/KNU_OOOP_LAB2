#ifndef FILEDREADER_H
#define FILEDREADER_H

#include <QAbstractListModel>
#include <QFile>
#include <iostream>
#include <fstream>
#include <QTextStream>
#include <string>
#include <vector>
#include <QColor>


class FileDreader : public QAbstractListModel
{
    Q_OBJECT

private:
    QString pathNotesNames = "/home/andrew/Документи/data/notesNames";
    QString pathArchiveNotesNames = "/home/andrew/Документи/data/archiveNotesNames";
    QString pathNotes = "/home/andrew/Документи/data/notes/";
    QString pathArchiveNotes = "/home/andrew/Документи/data/archive/";
    std::vector<QString> notesName;
    std::vector<QString> notesText;
    std::vector<QColor> notesColor;

    std::vector<QString> archiveNotesName;
    std::vector<QString> archiveNotesText;
    std::vector<QColor> archiveNotesColor;

    int countOfFiles = -1;
    int saveIndex = -1;
public:
    explicit FileDreader(QObject* parent = nullptr);

    void initNotes();

    void initArchiveNotes();

    int rowCount( const QModelIndex& parent ) const override;

    QVariant data( const QModelIndex& index, int role ) const override;

    Q_INVOKABLE int getSize();

    Q_INVOKABLE int getArchiveSize();

    Q_INVOKABLE QString getText(int index = -1);

    Q_INVOKABLE QColor getNoteColor(int index);

    Q_INVOKABLE QString getArchiveNoteText(int index = -1);

    Q_INVOKABLE QColor getArchiveNoteColor(int index);

    Q_INVOKABLE void saveThisIndex(int index);

    Q_INVOKABLE void save(int index, QString text, QColor color);

    Q_INVOKABLE void archive(int index);

    Q_INVOKABLE void unarchive(int index);

    Q_INVOKABLE void removeFromAll(int index);

    Q_INVOKABLE void removeFromArchive(int index);

    //void removeName(QString line);
};

#endif // FILEDREADER_H
