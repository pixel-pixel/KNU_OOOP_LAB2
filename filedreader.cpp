#include "filedreader.h"

FileDreader::FileDreader(QObject *parent)
{
    initNotes();
    initArchiveNotes();

//    if(documents.open(QIODevice::ReadOnly | QIODevice::Text))
//        documents.cr

//    countOfFiles = documents.readLine().toInt();
    //    std::cout << countOfFiles << std::endl;
}

void FileDreader::initNotes()
{
    QFile notesNames(pathNotesNames);

    if(notesNames.exists() && notesNames.open(QFile::ReadOnly | QFile::Text)){
        QTextStream streamNotesNames(&notesNames);
        QString name = streamNotesNames.readLine();

        QFile note;
        QTextStream streamNote;

        while (!name.isNull()) {
            note.setFileName(pathNotes + name);
            //TODO
            if(note.open(QFile::ReadOnly | QFile::Text)){
                streamNote.setDevice(&note);
                QColor c(streamNote.readLine());

                notesName.insert(notesName.begin(), name);
                notesColor.insert(notesColor.begin(), c);
                notesText.insert(notesText.begin(), streamNote.readAll());
            }
            note.close();

            name = streamNotesNames.readLine();
        }
    }
}

void FileDreader::initArchiveNotes()
{
    QFile notesNames(pathArchiveNotesNames);

    if(notesNames.exists() && notesNames.open(QFile::ReadOnly | QFile::Text)){
        QTextStream streamNotesNames(&notesNames);
        QString name = streamNotesNames.readLine();

        QFile note;
        QTextStream streamNote;

        while (!name.isNull()) {
            std::cout << archiveNotesName.size() << std::endl;

            note.setFileName(pathArchiveNotes + name);
            //TODO
            if(note.open(QFile::ReadOnly | QFile::Text)){
                streamNote.setDevice(&note);
                QColor c(streamNote.readLine());

                archiveNotesName.insert(archiveNotesName.begin(), name);
                archiveNotesColor.insert(archiveNotesColor.begin(), c);
                archiveNotesText.insert(archiveNotesText.begin(), streamNote.readAll());
            }
            note.close();

            name = streamNotesNames.readLine();
        }
    }


}

int FileDreader::rowCount(const QModelIndex &parent) const
{
    return notesText.size() + 1;
}

QVariant FileDreader::data(const QModelIndex &index, int role) const
{
    return {};
}

int FileDreader::getSize()
{
    return notesText.size() + 1;
}

int FileDreader::getArchiveSize()
{
    return archiveNotesText.size();
}

QString FileDreader::getText(int index)
{
    if(index <= 0)
        return "";


    return notesText[index - 1];
}

QColor FileDreader::getNoteColor(int index)
{
    if(index <= 0)
        return "blue";

    return notesColor[index - 1];
}

QString FileDreader::getArchiveNoteText(int index)
{
    if(index < 0)
        return "kek";


    return archiveNotesText[index];
}

QColor FileDreader::getArchiveNoteColor(int index)
{
    if(index < 0)
        return "blue";

    return archiveNotesColor[index];
}

void FileDreader::saveThisIndex(int index)
{
    saveIndex = index;
}

void FileDreader::save(int index, QString text, QColor color)
{
    QString name = text.split("\n").at(0);

    QFile notesNames(pathNotesNames);
    QTextStream streamNotesNames;

    QFile note;
    QTextStream stream;

    for(int i = 0; i < notesName.size(); i++){
        std::cout << name.toStdString() << " - index: " << i << " : " << notesName[i].toStdString() << std::endl;
        if(i != index-1 && name == notesName[i]){
            name += " om";
            i = -1;
        }
    }

    if(index > 0 && notesNames.open(QFile::ReadWrite | QFile::Text)){
        QString newNames = "";
        QString line;

        streamNotesNames.setDevice(&notesNames);
        while (!streamNotesNames.atEnd()) {
            line = streamNotesNames.readLine();

            if(line != notesName[index - 1]){
                newNames.append(line + "\n");
            }
        }
        notesNames.resize(0);
        streamNotesNames << newNames;
        notesNames.close();
    }

    if(notesNames.open(QFile::Append | QFile::Text)){
        streamNotesNames.setDevice(&notesNames);
        streamNotesNames << name << "\n";

        notesNames.close();
    }

    if(index > 0){
        note.setFileName(pathNotes + notesName[index - 1]);
        note.remove();
        note.close();

        notesName.erase(notesName.begin() + index - 1);
        notesColor.erase(notesColor.begin() + index - 1);
        notesText.erase(notesText.begin() + index - 1);
    }

    note.setFileName(pathNotes + name);
    if(note.open(QFile::WriteOnly | QFile::Text)){
        stream.setDevice(&note);

        stream << color.name() << "\n" << text;

        notesName.insert(notesName.begin(), name);
        notesColor.insert(notesColor.begin(), color);
        notesText.insert(notesText.begin(), text);
    }

    note.close();
}

void FileDreader::archive(int index)
{
    QString name = notesName[index - 1];

    QFile fileArchiveNames(pathArchiveNotesNames);
    QTextStream streamArchiveNames(&fileArchiveNames);

    QFile fileNote(pathNotes + name);

    if(fileArchiveNames.open(QFile::Append | QFile::Text)){
        streamArchiveNames << name << "\n";

        fileArchiveNames.close();
    }

    if(fileNote.open(QFile::Append | QFile::Text)){
        fileNote.copy(pathArchiveNotes + name);
    }

    archiveNotesName.insert(archiveNotesName.begin(), notesName[index - 1]);
    archiveNotesColor.insert(archiveNotesColor.begin(), notesColor[index - 1]);
    archiveNotesText.insert(archiveNotesText.begin(), notesText[index - 1]);

    removeFromAll(index);
}

void FileDreader::unarchive(int index)
{
    QString name = archiveNotesName[index];

    QFile fileNames(pathNotesNames);
    QTextStream streamNames(&fileNames);

    QFile fileNote(pathArchiveNotes + name);

    if(fileNames.open(QFile::Append | QFile::Text)){
        streamNames << name << "\n";

        fileNames.close();
    }

    if(fileNote.open(QFile::Append | QFile::Text)){
        fileNote.copy(pathArchiveNotes + name);
    }

    notesName.insert(notesName.begin(), archiveNotesName[index]);
    notesColor.insert(notesColor.begin(), archiveNotesColor[index]);
    notesText.insert(notesText.begin(), archiveNotesText[index]);

    removeFromArchive(index);
}

void FileDreader::removeFromAll(int index)
{
    QString name = notesName[index - 1];
    QString newNames = "";

    QFile fileNames(pathNotesNames);
    QTextStream streamFileNames(&fileNames);

    QFile fileNote(pathNotes + name);

    if(fileNames.open(QFile::ReadWrite | QFile::Text)){
        QString line;

        while(!streamFileNames.atEnd()){
            line = streamFileNames.readLine();

            if(line != name){
                newNames.append(line + "\n");
            }
        }
        fileNames.resize(0);
        streamFileNames << newNames;
        fileNames.close();
    }

    if(fileNote.open(QFile::Append | QFile::Text)){
        fileNote.remove();
    }

    notesName.erase(notesName.begin() + index - 1);
    notesColor.erase(notesColor.begin() + index - 1);
    notesText.erase(notesText.begin() + index - 1);
}

void FileDreader::removeFromArchive(int index)
{
    QString name = archiveNotesName[index];
    QString newNames = "";

    QFile fileNames(pathArchiveNotesNames);
    QTextStream streamFileNames(&fileNames);

    QFile fileNote(pathArchiveNotes + name);

    if(fileNames.open(QFile::ReadWrite | QFile::Text)){
        QString line;

        while(!streamFileNames.atEnd()){
            line = streamFileNames.readLine();

            if(line != name){
                newNames.append(line + "\n");
            }
        }
        fileNames.resize(0);
        streamFileNames << newNames;
        fileNames.close();
    }

    if(fileNote.open(QFile::Append | QFile::Text)){
        fileNote.remove();
    }

    archiveNotesName.erase(archiveNotesName.begin() + index);
    archiveNotesColor.erase(archiveNotesColor.begin() + index);
    archiveNotesText.erase(archiveNotesText.begin() + index);
}
