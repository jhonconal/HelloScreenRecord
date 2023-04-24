QT += quick

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
#include($$PWD/3rdparty/3rdparty.pri)

DEFINES += USING_OPENCV

INCLUDEPATH += $$PWD \
               $$PWD/3rdparty/opencv3.4.14/include \
               $$PWD/3rdparty/opencv3.4.14/include/opencv \
               $$PWD/3rdparty/opencv3.4.14/include/opencv2

INCLUDEPATH += $$PWD/3rdparty/opencv3.4.14/lib/mingw
DEPENDPATH += $$PWD/3rdparty/opencv3.4.14/lib/mingw

win32:{
    LIBS += -lws2_32 -static
    LIBS += $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_calib3d3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_core3414.dll.a  \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_dnn3414.dll.a   \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_features2d3414.dll.a    \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_flann3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_highgui3414.dll.a   \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_imgcodecs3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_imgproc3414.dll.a   \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_ml3414.dll.a    \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_objdetect3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_photo3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_shape3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_stitching3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_superres3414.dll.a  \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_video3414.dll.a \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_videoio3414.dll.a   \
             $$PWD/3rdparty/opencv3.4.14/lib/mingw/lib/libopencv_videostab3414.dll.a
}
else: {
    LIBS +=  -L$$PWD/3rdparty/opencv3.4.14/lib/aarch64/lib/ \
             -lopencv_highgui -lopencv_ml -lopencv_objdetect -lopencv_shape -lopencv_stitching \
             -lopencv_superres -lopencv_videostab -lopencv_calib3d -lopencv_videoio -lopencv_imgcodecs \
             -lopencv_features2d -lopencv_video -lopencv_photo -lopencv_imgproc -lopencv_flann -lopencv_core
}

SOURCES += \
        main.cpp \
        screenrecord.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    screenrecord.h

