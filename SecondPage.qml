import QtQuick 2.12
import QtQml 2.12

Item {
    id:root
    width: parent.width
    height: parent.height

    Rectangle{
        id:rect
        anchors.fill: parent
        color: "transparent"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                stackView.push(firstPage)
            }
        }
    }

    Component.onCompleted: {
        console.log("second page completed")
    }
}
