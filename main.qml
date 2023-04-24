import QtQuick 2.12
import QtQuick.Window 2.12
import QtQml 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id:rootWindow
//    width: Screen.desktopAvailableWidth
//    height: Screen.desktopAvailableHeight
    width: 1280
    height: 800
    visible: true
    title: qsTr("Hello World")
    property bool running: false
    property int  time: 0  //ms
    Timer {
        id:recordTimer
        interval: 33    //40ms
        running: false
        repeat: true
        property int step: 40
        onTriggered: {
            if (false === ScreenRecord.startRecord(rootWindow))
            {
                recordTimer.stop()
                ScreenRecord.stopRecord()
                running = false
                console.log("++++++++++++++++++")
            }
            else
            {
                running = true
            }
            if(time >= 30*1000)
            {
                recordTimer.stop()
                ScreenRecord.stopRecord()
                running = false
                startbutton.visible = true
                stopbutton.visible = false
                time_text.text=qsTr("00:30"+"/00:30")
                return
            }
//            if(time/1000==0)//
            {
                time_text.text=qsTr("00:"+time/1000.0+"/00:30")
            }
            time +=interval
        }
    }

    Rectangle{
        anchors.centerIn: parent //设置居中显示
        width: 120*2
        height: 100*2
        color: "yellow"
        opacity: 0.5  //设置透明度,0-1,0为完全透明，1表示不透明.
        Text {
            id: time_text
            anchors.centerIn: parent
            text: qsTr("00:00/00:30")
            font.pixelSize: 32
        }
    }

    RoundButton {
        id: startbutton
        text: "开始"
        width: 80
        height: 80
        onClicked:
        {
            time =0;
            time_text.text=qsTr("00:00/00:30")
            //利用定时器不停的将图片写入到视频文件
            recordTimer.start()

            startbutton.visible = false
            stopbutton.visible = true
        }
    }

    RoundButton {
        id: stopbutton
        text: "结束"
        width: 80
        height: 80
        visible: false
        onClicked:
        {
            recordTimer.stop()
            ScreenRecord.stopRecord()

            running = false
            startbutton.visible = true
            stopbutton.visible = false
        }
    }//
}
