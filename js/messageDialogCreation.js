.pragma library


var index = 0;
const NoIcon = 0;
const Question =1;
const Information =2;
const Warning = 3;
const Critical = 4;

//object createQmlObject(string qml,  object parent,  string filepath)

function createMessageDialogObject(parentItem,icon,title,text) {

    if(typeof(parentItem) != "object"){
        return null;
    }

    var curIcon = "StandardIcon.NoIcon"
    if(typeof(icon) == "number"){
        switch(icon){
        case 1:
            curIcon = "StandardIcon.Question";
            break;
        case 2:
            curIcon = "StandardIcon.Information";
            break;
        case 3:
            curIcon = "StandardIcon.Warning";
            break;
        case 4:
            curIcon = "StandardIcon.Critical";
            break;
        }
    }

    var curTitle = ""
    if(typeof(title) == "string"){
        curTitle = title;
    }

    var curText = ""
    if(typeof(text) == "string"){
        curText = text;
    }

    var newObject = Qt.createQmlObject(' import QtQuick 2.12; import QtQuick.Dialogs 1.3; \
                        MessageDialog { \
                            title: "' + curTitle +'"; \
                            icon : ' +curIcon +'; \
                            text: "' + curText + '"; \
                            Component.onCompleted: visible = true; \
                        } ',parentItem,"dynamicSnippet" + String(++index));

    return newObject;
}
