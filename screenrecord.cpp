#include "screenrecord.h"
#define  MK_SCREEN_RECODER  "./screenrecoder/"

ScreenRecord::ScreenRecord(QObject *parent)
    : QObject{parent}
{
    m_bIsRecording = false;
}

bool ScreenRecord::startRecord(QQuickWindow *rootWindow)
{
    if(!rootWindow)
    {
        return false;
    }
    QDir dir;
    //创建存储视频目录
    if (false == dir.exists(MK_SCREEN_RECODER))
    {
        dir.mkpath(MK_SCREEN_RECODER);
    }
    if (m_bIsRecording == false)
    {
        QString filePathName = MK_SCREEN_RECODER;
        filePathName += QDateTime::currentDateTime().toString("yyyy-MM-dd-hhmmss.zzz");
        filePathName += QString(".avi");
#ifdef USING_OPENCV
        int w = rootWindow->width();
        int h = rootWindow->height();
        //30 fps  1280x800
        m_VideoWriter.open(filePathName.toStdString(), cv::VideoWriter::fourcc('M','J','P','G'), 30, cv::Size(w, h), true);
#endif
        m_bIsRecording = true;
    }

    QImage image;
    image = rootWindow->grabWindow();
    image = image.convertToFormat(QImage::Format_RGB888);

#ifdef USING_OPENCV
    //QImage转换为mat
    cv:: Mat mat(image.height(), image.width(), CV_8UC3, (void*)image.constBits(), image.bytesPerLine());
    cv::cvtColor(mat, mat, CV_RGB2BGR);	//opencv储存为BGR，故需要进行转化
    if (m_VideoWriter.isOpened())
    {
        //写入一张图片
        m_VideoWriter.write(mat);
    }
#else
    if (false == dir.exists("/tmp/screenrecoder"))
    {
        dir.mkpath("/tmp/screenrecoder");
    }
    image.save(QString("/tmp/screenrecoder/screenshot_%1.png").arg(QDateTime::currentDateTime().toString("yyyy-MM-dd-hhmmss.zzz")));
#endif
    return true;
}

void ScreenRecord::stopRecord()
{
    qDebug()<<Q_FUNC_INFO;
    m_bIsRecording = false;
#ifdef USING_OPENCV
    m_VideoWriter.release();
#endif
}
