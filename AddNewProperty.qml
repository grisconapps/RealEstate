import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0

import "Storage.js" as Storage

Rectangle {
    id: ovrelay
    width: ovrelay.implicitWidth
    height: ovrelay.implicitHeight
    color: "#000000"

    signal clicked

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

    ExclusiveGroup {
        id: modeGrp
    }

    ExclusiveGroup {
        id: typeGrp
    }

    CheckBox {
        id: check_box1
        x: 197
        y: 271
        width: 88
        height: 24
        Text {
            x: 25
            y: -5
            width: 55
            height: 29
                text: qsTr("Direct")
                font.pointSize: 16
                color: "white"
            }
        opacity: 1
        activeFocusOnPress: false
        checked: true
        exclusiveGroup: modeGrp
        onClicked: setLabel();
    }

    CheckBox {
        id: check_box2
        x: 296
        y: 271
        width: 88
        height: 24
        Text {
            x: 25
            y: -5
            width: 55
            height: 29
                text: qsTr("Indirect")
                font.pointSize: 16
                color: "white"
            }
        opacity: 1
        activeFocusOnPress: false
        checked: false
        exclusiveGroup: modeGrp
        onClicked: setLabel();
    }

    CheckBox {
        id: check_box3
        x: 614
        y: 271
        width: 88
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 130
        opacity: 1
        Text {
            x: 25
            y: -5
            width: 55
            height: 29
            color: "#ffffff"
            text: qsTr("Buy")
            anchors.right: parent.right
            anchors.rightMargin: 8
            font.pointSize: 16
        }
        activeFocusOnPress: false
        checked: true
        exclusiveGroup: typeGrp
    }

    CheckBox {
        id: check_box4
        x: 698
        y: 271
        width: 88
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 54
        opacity: 1
        Text {
            x: 25
            y: -5
            width: 55
            height: 29
            color: "#ffffff"
            text: qsTr("Rent")
            anchors.right: parent.right
            anchors.rightMargin: 8
            font.pointSize: 16
        }
        activeFocusOnPress: false
        checked: false
        exclusiveGroup: typeGrp
    }

    Label {
        id: label1
        x: 45
        y: 316
        width: 106
        height: 49
        color: "#ffffff"
        font.pointSize: 15
        text: "Owner Name"
    }

    TextField {
        id: ownerName
        x: 197
        y: 316
        width: 172
        height: 24
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 10
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }

    }

    Label {
        id: label2
        x: -387
        y: 371
        width: 106
        height: 49
        color: "#ffffff"
        text: "Phone"
        anchors.right: phoneNum.left
        anchors.rightMargin: 55
        font.pointSize: 15
    }

    TextField {
        id: phoneNum
        x: 624
        y: 371
        width: 172
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 54
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 10
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        validator: RegExpValidator { regExp: /\d+/ }
    }

    Label {
        id: label3
        x: -387
        y: 316
        width: 106
        height: 49
        color: "#ffffff"
        text: "Purpose"
        anchors.right: purpose.left
        anchors.rightMargin: 55
        font.pointSize: 15
    }

    Label {
        id: label4
        x: 45
        y: 433
        width: 106
        height: 49
        color: "#ffffff"
        text: "Commission"
        font.pointSize: 15
    }

    TextField {
        id: commission
        x: 197
        y: 434
        width: 172
        height: 24
        placeholderText: "KWD"
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 10
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        validator: RegExpValidator { regExp: /\d+/ }
    }

    Label {
        id: label5
        x: 45
        y: 371
        width: 106
        height: 49
        color: "#ffffff"
        text: "Request Price"
        font.pointSize: 15
    }

    TextField {
        id: requestedPrice
        x: 197
        y: 371
        width: 172
        height: 24
        placeholderText: "KWD"
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 10
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        validator: RegExpValidator { regExp: /\d+/ }
    }

    Label {
        id: label6
        x: -387
        y: 433
        width: 106
        height: 49
        color: "#ffffff"
        text: "Minimum Price"
        anchors.right: minPrice.left
        anchors.rightMargin: 55
        font.pointSize: 15
    }

    TextField {
        id: minPrice
        x: -226
        y: 434
        width: 172
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 54
        placeholderText: "KWD"
        style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 10
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        validator: RegExpValidator { regExp: /\d+/ }
    }

    ComboBox {
        id: purpose
        x: 614
        y: 318
        width: 172
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 54
        model: [ "Banana", "Apple", "Coconut" ]

    }

    Button {
        id: nextButton
        x: 364
        y: 608
        width: 50
        height: 26
        text: "Next"
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
        onClicked: setData();
    }

    Label {
        id: label7
        x: 36
        y: 171
        width: 106
        height: 49
        color: "#ffffff"
        text: "Step 1: Add Details"
        font.underline: true
        font.pointSize: 15
    }

    Label {
        id: label8
        x: 45
        y: 266
        width: 106
        height: 49
        color: "#ffffff"
        text: "Mode"
        font.pointSize: 15
    }

    Label {
        id: label9
        x: -387
        y: 266
        width: 106
        height: 49
        color: "#ffffff"
        text: "Type"
        anchors.right: parent.right
        anchors.rightMargin: 281
        font.pointSize: 15
    }

    Image {
        id: image1
        x: 296
        width: 230
        height: 43
        transformOrigin: Item.Center
        anchors.top: tools.bottom
        anchors.topMargin: 50
        source: "./Images/System/status1.jpg"
    }

    function setLabel(){
        if(check_box1.checked){
           label1.text="Owner Name";
           label2.text="Phone";
        }

        if(check_box2.checked){
           label1.text="Office Number";
           label2.text="Landline Number";
        }
    }

    function setData(){
        Storage.ownerName = ownerName.text;
        if(check_box1.checked)
            Storage.mode = "Direct";
        else
            Storage.mode = "Indirect";

        if(check_box3.checked)
            Storage.type = "Buy";
        else
            Storage.type = "Rent";

        Storage.requestPrice = requestedPrice.text;
        Storage.phone = phoneNum.text;
        Storage.commission = commission.text;
        Storage.purpose = purpose.currentText;
        Storage.minPrice = minPrice.text;
        Storage.requestPrice = requestedPrice.text;

        container.state = "addLocDetails"

    }
   }
