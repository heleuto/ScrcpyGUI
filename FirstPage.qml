import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "js/messageDialogCreation.js" as MsgDlg
// import QtQuick.Dialogs 1.3

Item {
    id:root
    width: parent.width
    height: parent.height
    implicitWidth: 800
    implicitHeight: 600
    property string tag: "FirstPage: "

    Column{
        id:column
        anchors.left: root.left
        anchors.top: root.top
        anchors.leftMargin: 15
        anchors.topMargin: 10
        spacing: 10

        Row{
            id:row
            spacing: 15
            property int deviceRectHeight: 470
            property int deviceRectWidth: 370

            Rectangle{
                id:rect1
                width: row.deviceRectWidth
                height: row.deviceRectHeight
                color: "#35C759"
                radius: 8

                Column{
                    id:androidDevicesDetails
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.leftMargin: 15
                    anchors.topMargin: 20
                    anchors.rightMargin: 15
                    anchors.bottomMargin: 20
                    width: parent.width

                    Label{
                        text: qsTr("Android Devices")
                        font.pixelSize: 20
                        color: "white"
                    }

                    //Android设备展示栏,长度必须是可变化的
                    Rectangle{
                        color: "transparent"
                        width: parent.width
                        height: 70
                    }

                    Label{
                        width: parent.width
                        color: "white"
                        height: 50
                        font.bold: true
                        font.pixelSize: 16
                        wrapMode: "WordWrap"
                        textFormat: Text.RichText
                        linkColor: "white"
                        text: qsTr("Android not found? Make sure <a href=\"http://www.baidu.com\">Android USB Debugging is enabled</a>.")

                        onLinkActivated: {
                            //                            console.log("onLinkActivated")
                        }
                    }

                    Label{
                        width: parent.width
                        color: "white"
                        height: 50
                        font.bold: true
                        font.pixelSize: 16
                        wrapMode: "WordWrap"
                        textFormat: Text.RichText

                        linkColor: "white"
                        text: qsTr("Windows users need to install <a href=\"http://www.baidu.com\">ADB Drivers</a>.")

                        onLinkActivated: {
                            //                            console.log("onLinkActivated")
                        }
                    }

                    RowLayout{
                        Label{
                            width: parent.width
                            color: "white"
                            height: 50
                            font.bold: true
                            font.pixelSize: 16
                            wrapMode: "WordWrap"
                            //                            textFormat: Text.RichText

                            linkColor: "white"
                            text: qsTr("Using Android SDK ADB server.")

                            //                            onLinkActivated: {
                            //                            console.log("onLinkActivated")
                            //                            }
                        }

                        PButton{
                            id:forceRestartBtn
                            font.pixelSize: 12
                            text: qsTr("Force Restart")
                            radius: 5
                            width: Layout.width - 5
                            height: Layout.height - 5
                            Layout.margins: 5
                        }
                    }
                }

            }

            Rectangle{
                id:rect2
                width: row.deviceRectWidth
                height: row.deviceRectHeight
                color: "#007AFF"
                radius: 8

                Column{
                    id:iosDevicesDetails
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.leftMargin: 15
                    anchors.topMargin: 20
                    anchors.rightMargin: 15
                    anchors.bottomMargin: 20
                    width: parent.width


                    Label{
                        text: qsTr("iOS Devices")
                        font.pixelSize: 20
                        color: "white"

                    }

                    //备用的iOS设备展示框
                    Rectangle{
                        color: "transparent"
                        width: parent.width
                        height: 70

                        Label{
                            text: qsTr("No iOS devices are connected.")
                            color: "white"
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                        }
                    }

                    Label{
                        width: parent.width
                        color: "white"
                        height: 50
                        font.bold: true
                        font.pixelSize: 18

                        text: qsTr("iOS is unsupported.")
                    }
                }
            }
        }

        Rectangle{
            id:networkDeviceRect
            height: 300
            width: row.deviceRectWidth

            ColumnLayout{
                Rectangle{
                    Layout.minimumWidth: 370
                    Layout.minimumHeight: 50
                    color: "red"
                    radius: 3

                    Label{
                        id:networkDeviceLab
                        font.bold: true
                        font.pixelSize: 24
                        color: "white"
                        anchors.fill: parent
                        anchors.leftMargin: 10

                        text: qsTr("Connect Network Device")
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                GroupBox {
                    title: qsTr("Network Address")
                    Layout.minimumWidth: row.deviceRectWidth

                    RowLayout{
                        id:netAddressRow
                        anchors.fill: parent
                        property int textInputHeight: parent.height

                        TextInput{
                            id:ipInput
                            Layout.minimumHeight: netAddressRow.textInputHeight
                            Layout.minimumWidth:  255
                            //                            validator:RegExpValidator{
                            //                                regExp:/^((1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[0-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[0-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[0-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[0-9])(\\:(6553[0-5]|655[0-2]\\d|65[0-4]\\d{2}|6[0-4]\\d{3}|([1-5]\\d{0,4}|\\d{0,4})))?)$/
                            //                            }

                            inputMask: "000.000.000.000:00000;_"
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 16
                        }

                        PButton{
                            id:connectNetDevBtn
                            text: qsTr("Connect")
                            width: 80
                            height: 40
                            radius: 3
                            font.pixelSize: 16

                            onClicked: {
                                console.log()
                                if(ipInput.length < 4){
                                    MsgDlg.createMessageDialogObject(root,"test","test")
                                    return;
                                }
                                else{
                                    console.log(tag+ ipInput.text)
                                    MsgDlg.createMessageDialogObject(root,MsgDlg.Information,"提示","正在连接设备"+ipInput.text)
                                }
                            }
                        }
                    }
                }

            }
        }

    }

    Component.onCompleted: {
        console.log("first page completed")
    }
}
