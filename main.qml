import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.VirtualKeyboard.Settings 2.2
import QtQml 2.12
import QtQuick.Controls 2.5

Window {
    id: window
    width: 800
    height: 900
    visible: true
    title: qsTr("ScrcpyGUI")


    //界面数组
    property var stackPages: new Array

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    Component.onCompleted: {
        var locallang = new Array(2)
        locallang[0] = "en_US"
        locallang[1] = "zh_CN"
        //console.log(VirtualKeyboardSettings.availableLocales) //Windows平台打印内容为空
        VirtualKeyboardSettings.activeLocales = locallang
        VirtualKeyboardSettings.locale = locallang[0]
//        VirtualKeyboardSettings.wordCandidateList.autoHideDelay = 5000
    }

    function initStackPages(){
        stackPages.length =0 //清空数组
        stackPages[0] = firstPage
        stackPages[1] = secondPage
    }

    StackView{
        id:stackView
        anchors.fill: parent
        initialItem: firstPage

        Component.onCompleted:  {
            initStackPages()
        }
    }

    Component{
        id:firstPage
        FirstPage{}
    }

    Component{
        id:secondPage
        SecondPage{}
    }

}
