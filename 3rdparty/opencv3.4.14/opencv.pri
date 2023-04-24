INCLUDEPATH += $$PWD \
				$$PWD/include \
               $$PWD/include/opencv \
               $$PWD/include/opencv2
win32 {
  LIBS += -lws2_32 -static          
  LIBS += $$PWD/lib/mingw/lib/libopencv_calib3d3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_core3414.dll.a  \
          $$PWD/lib/mingw/lib/libopencv_dnn3414.dll.a   \
          $$PWD/lib/mingw/lib/libopencv_features2d3414.dll.a    \
          $$PWD/lib/mingw/lib/libopencv_flann3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_highgui3414.dll.a   \
          $$PWD/lib/mingw/lib/libopencv_imgcodecs3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_imgproc3414.dll.a   \
          $$PWD/lib/mingw/lib/libopencv_ml3414.dll.a    \
          $$PWD/lib/mingw/lib/libopencv_objdetect3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_photo3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_shape3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_stitching3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_superres3414.dll.a  \
          $$PWD/lib/mingw/lib/libopencv_video3414.dll.a \
          $$PWD/lib/mingw/lib/libopencv_videoio3414.dll.a   \
          $$PWD/lib/mingw/lib/libopencv_videostab3414.dll.a
  DEFINES += 
  SOURCES += 

} else{
    DEFINES +=
    SOURCES += 

}
