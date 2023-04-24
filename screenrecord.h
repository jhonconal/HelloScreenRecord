#ifndef SCREENRECORD_H
#define SCREENRECORD_H

#include <QObject>
#include <QDir>
#include <QImage>
#include <QTimer>
#include <QDateTime>
#include <QQuickWindow>

#ifdef USING_OPENCV
#include <opencv2/videoio.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#endif

class ScreenRecord : public QObject
{
    Q_OBJECT
public:
    explicit ScreenRecord(QObject *parent = nullptr);

    Q_INVOKABLE bool startRecord(QQuickWindow *rootWindow);
    Q_INVOKABLE void stopRecord();
signals:

private:
#ifdef USING_OPENCV
    cv::VideoWriter m_VideoWriter;	//opencv写视频的类
#endif
    bool m_bIsRecording;
    QTimer m_Timer;
};

#endif // SCREENRECORD_H
