import QtQuick 2.12
import QtQuick.Controls 2.5

//自定义button

Button{
    id:root
    width: 100
    height: 50
    font.pixelSize: 20

    property alias rect: rect
    property string normalType: "LightSkyBlue"
    property string hightlightType: "DeepSkyBlue"
    property string disGray: "gray"
    property alias radius: rect.radius

    function setDisabled(){
        rect.color = disGray
        root.state = "gray_color"
        enabled = false

    }

    contentItem: Label {
        text: root.text
        font: root.font
        color: "white"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    onEnabledChanged: {

        if(enabled){
            rect.color =  root.hovered || root.down ? hightlightType : normalType
        }else{
            rect.color = disGray
        }
    }

    background:Rectangle{
        id:rect
        color:  root.hovered || root.down ? hightlightType : normalType
        opacity: 0.8
        radius: 8
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onContainsMouseChanged: {
            if(enabled){
                containsMouse ? root.state = "deepSkyBlue_color" : root.state = "lightSkyBlue_color"
            }else{
                root.state = "gray_color"
            }
        }

        onClicked: {
            signal:root.clicked()
        }

        onDoubleClicked: {
            signal:root.doubleClicked()
        }
    }

    states: [
        State {
            name: "deepSkyBlue_color"
            PropertyChanges {
                target: root
                rect.color: hightlightType
            }
        },
        State {
            name: "lightSkyBlue_color"
            PropertyChanges {
                target: root
                rect.color: normalType
            }
        },
        State {
            name: "gray_color"
            PropertyChanges {
                target: root
                rect.color: disGray
            }
        }
    ]

}
