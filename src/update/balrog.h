/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef BALROG_H
#define BALROG_H

#include "updater.h"

#include <QCryptographicHash>
#include <QNetworkReply>
#include <QTemporaryDir>

class NetworkRequest;

class Balrog final : public Updater {
  Q_DISABLE_COPY_MOVE(Balrog)

 public:
  Balrog(QObject* parent, Op operation);
  ~Balrog();

  void start(Task* task) override;

 private:
  static QString userAgent();

  bool processData(Task* task, const QByteArray& data);
  bool fetchSignature(Task* task, NetworkRequest* request,
                      const QByteArray& data);
  bool checkSignature(Task* task, const QByteArray& x5uData,
                      const QByteArray& updateData,
                      const QByteArray& signatureBlob);
  bool validateSignature(const QByteArray& x5uData,
                         const QByteArray& updateData,
                         const QByteArray& signatureBlob);
  bool computeHash(const QByteArray& data, const QString& hashValue,
                   const QString& hashFunction);
  bool saveFileAndInstall(const QString& filePath, const QByteArray& data,
                          bool required);
  bool completeOperation(const QString& filePath, bool required);
  bool install(const QString& filePath);
  void propagateError(NetworkRequest* request,
                      QNetworkReply::NetworkError error);
  QString cacheFolder();
  QString fromUrlToFilePath(const QString& url);
  bool checkCache(const QString& filePath, const QString& hashValue,
                  const QString& hashFunction);
  void invalidateCache();

 private:
  QTemporaryDir m_tmpDir;
  Op m_operation;
};

#endif  // BALROG_H
