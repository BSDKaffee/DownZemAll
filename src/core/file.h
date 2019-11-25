/* - DownZemAll! - Copyright (C) 2019 Sebastien Vavassori
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef CORE_FILE_H
#define CORE_FILE_H

#include <QtCore/QObject>

class Settings;
class IFileAccessManager;
class QSaveFile;

class File : public QObject
{
    Q_OBJECT

public:
    enum OpenFlag {
        Open,
        Skip,
        Error
    };

    explicit File(QObject *parent = Q_NULLPTR);
    ~File();

    static void setFileAccessManager(IFileAccessManager *manager);

    OpenFlag open(const QString &fileName);
    void write(const QByteArray &data);
    bool commit();
    void cancel();

private:
    QSaveFile *m_file;

    inline QString rename(const QString &name) const;
};

#endif // CORE_FILE_H