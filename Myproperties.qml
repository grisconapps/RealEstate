import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtQuick.XmlListModel 2.0

import "Storage.js" as Storage

Rectangle {
    id: ovrelay
    width: ovrelay.implicitWidth
    height: ovrelay.implicitHeight
    color: "#000000"

    signal clicked
Item {
    ToolBar {
        id: tools

       RowLayout {
           width: root.width

           Image {
               source: "./Images/System/logo.jpeg"
               fillMode: Image.PreserveAspectCrop
               smooth: true
           }
               Button {
                       text: "My Properties"
                       style: ButtonStyle {
                           background: Rectangle {
                               implicitWidth: 130
                               implicitHeight: 45
                               border.width: control.activeFocus ? 2 : 1
                               border.color: "#888"
                               radius: 4
                               gradient: Gradient {
                                   GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                   GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                               }
                           }
                       }
                       onClicked: container.state = "myProps"
                   }

               Button {
                   text: qsTr("Add Property")
                       style: ButtonStyle {
                           background: Rectangle {
                               implicitWidth: 130
                               implicitHeight: 45
                               border.width: control.activeFocus ? 2 : 1
                               border.color: "#888"
                               radius: 4
                               gradient: Gradient {
                                   GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                   GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                               }
                           }
                       }
                       onClicked: container.state = "addProp"
                   }
               Button {
                   text: qsTr("Settings")
                       style: ButtonStyle {
                           background: Rectangle {
                               implicitWidth: 130
                               implicitHeight: 45
                               border.width: control.activeFocus ? 2 : 1
                               border.color: "#888"
                               radius: 4
                               gradient: Gradient {
                                   GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                   GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                               }
                           }
                       }
                   }

               Button {
                   text: qsTr("Profile")
                       style: ButtonStyle {
                           background: Rectangle {
                               implicitWidth: 130
                               implicitHeight: 45
                               border.width: control.activeFocus ? 2 : 1
                               border.color: "#888"
                               radius: 4
                               gradient: Gradient {
                                   GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                                   GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                               }
                           }
                       }
                   }


       }
    }
}

    Rectangle {
        id: rectangle1
        x: 9
        y: 52
        width: root.width
        height: root.height
        color: "#ffffff"
        clip: false

        SplitView {
            anchors.fill: rectangle1
            orientation: Qt.Horizontal
            resizing: true

            Rectangle {
                width: 300
                Layout.maximumWidth: 400
                color: "gray"

                XmlListModel {
                        id: xmlModel

                        source: "http://192.168.1.3:8080/?name=property"
                        // contains XML content
                        //source: "data.xml"
                        query: "/results/row"

                        XmlRole { name: "propertyid";    query: "propId/string()" }
                        XmlRole { name: "ownerName";  query: "OwnerName/string()" }
                        XmlRole { name: "blockNo";      query: "blockNo/string()" }
                        XmlRole { name: "phoneNo";      query: "phoneNum/string()" }
                        XmlRole { name: "street";  query: "street/string()" }
                        XmlRole { name: "houseNo";  query: "houseNo/string()" }
                        XmlRole { name: "Location";  query: "Location/string()" }
                        XmlRole { name: "description";  query: "description/string()" }
                        XmlRole { name: "pic_path";  query: "pic_path/string()" }
                        XmlRole { name: "status";  query: "status/string()" }
                    }

                Component {
                       id: myDelegate
                       Rectangle {
                           id:rect1
                           width: 500
                           height:50
                           color: "grey"
                           border.color: "white"
                           border.width: 1
                           radius: 5
                           Image {
                               source:"./Images/System/thumbnail.jpg"
                               x:5
                               y:5
                           }

                           Text {
                               text: houseNo + ", Block# " + blockNo + "\n "+street+" "+Location
                               font.pointSize: 13
                               font.bold: false
                               x:60
                               y:0
                           }
                           Rectangle {
                               width:40
                               height:20
                               color: "black"
                               radius:5
                               x:250
                               y:20
                                   Label {
                                        text: status
                                        font.pixelSize: 12
                                        font.italic: true
                                        color: "white"
                                   }
                          }

                          MouseArea{
                               anchors.fill:parent
                               onClicked: setSplitViewdata(propertyid);
                          }
                      }
                   }
                ListView {
                            anchors.fill: parent
                            model: xmlModel
                            delegate: myDelegate
                        }
            }
            Rectangle {
                id: centerItem
                Layout.minimumWidth: 50
                Layout.fillWidth: true
                color: "grey"
                Label {
                    id: label
                    width: 106
                    height: 49
                    color: "#ffffff"
                    //text: "Hello"
                    text: ownerName
                    font.family: "MS Sans Serif"
                    font.pointSize: 16
                }
            }
        }

    }
    function setSplitViewdata(propertyid){
        label.text=propertyid;
    }

}
