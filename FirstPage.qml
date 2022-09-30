import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.5

Item {
    id:root
    width: parent.width
    height: parent.height

    //    Grid{
    //        id:grid
    //        anchors.left: root.left
    //        anchors.top: root.top
    //        anchors.margins: 10

    //        PButton{
    //            id:chkBtn
    //            width: 80
    //            height: 40
    //            font.pixelSize: 16
    //            text: qsTr("查询设备")

    //            onClicked: {
    //                console.log("chkBtn clicked")
    //            }
    //        }

    //    }

    Column{
        id:column
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 15
        anchors.topMargin: 10

        Row{
            id:row
            Rectangle{
                id:rect1
                width: 370
                height: 470
                color: "#35C759"

                Label{
                    text: qsTr("Android Devices")
                    font.pixelSize: 20
                    color: "white"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //                        stackView.push(secondPage)
                    }
                }
            }

            Rectangle{
                id:rect2
                width: 370
                height: 470
                color: "#007AFF"
            }
        }



    }



    Component.onCompleted: {
        console.log("first page completed")
    }
}
