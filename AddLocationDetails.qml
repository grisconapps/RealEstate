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
    ToolBar
    {
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

    Label {
        id: label1
        x: 36
        y: 171
        width: 106
        height: 49
        color: "#ffffff"
        text: "Step 2: Add Location Details"
        font.underline: true
        font.pointSize: 15
    }

    TextField {
        id: street
        x: 197
        y: 309
        width: 172
        height: 24
        text: ""
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
        x: 479
        y: 371
        width: 106
        height: 49
        color: "#ffffff"
        text: "Tocken No."
        font.pointSize: 15
    }

    TextField {
        id: tockenNo
        x: 624
        y: 371
        width: 172
        height: 24
        text: ""
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
        id: label3
        x: 479
        y: 309
        width: 106
        height: 49
        color: "#ffffff"
        text: "Jada"
        font.pointSize: 15
    }

    TextField {
        id: jada
        x: 624
        y: 309
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
        id: label4
        x: 45
        y: 433
        width: 106
        height: 49
        color: "#ffffff"
        text: "Squared Meters"
        font.pointSize: 15
    }

    TextField {
        id: squareMtrs
        x: 197
        y: 434
        width: 172
        height: 24
        placeholderText: ""
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
        text: "House No."
        font.pointSize: 15
    }

    TextField {
        id: houseNo
        x: 197
        y: 371
        width: 172
        height: 24
        placeholderText: ""
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
        id: label6
        x: 479
        y: 433
        width: 106
        height: 49
        color: "#ffffff"
        text: "Location"
        font.pointSize: 15
    }

    TextField {
        id: location
        x: 624
        y: 434
        width: 172
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 44
        placeholderText: ""
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

    ComboBox {
        id: area
        x: 197
        y: 246
        width: 172
        height: 24
        model: [ "Banana", "Apple", "Coconut" ]

    }

    Button {
        id: nextButton
        x: 364
        y: 608
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
        onClicked: setLocationData();
    }

    Label {
        id: label7
        x: 42
        y: 309
        width: 106
        height: 49
        color: "#ffffff"
        text: "Street"
        font.pointSize: 15
    }

    Label {
        id: label8
        x: 42
        y: 246
        width: 106
        height: 49
        color: "#ffffff"
        text: "Area"
        font.pointSize: 15
    }

    Label {
        id: label9
        x: 479
        y: 246
        width: 106
        height: 49
        color: "#ffffff"
        text: "Block"
        font.pointSize: 15
    }

    ComboBox {
        id: block
        x: 624
        y: 246
        width: 172
        height: 24
        model: [ 1, 2, 3, 4 ]
    }

    Label {
        id: label10
        x: 45
        y: 488
        width: 106
        height: 49
        color: "#ffffff"
        text: "Description"
        font.pointSize: 15
    }
    TextField {
        id: desc
        x: 197
        y: 488
        width: 172
        height: 24
        anchors.right: parent.right
        anchors.rightMargin: 471
        placeholderText: ""
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
        id: label11
        x: 479
        y: 488
        width: 106
        height: 49
        color: "#ffffff"
        text: "House Features"
        font.pointSize: 15
    }

    TextArea {
        id: features
        x: 624
        y: 488
        width: 172
        height: 100
        text: ""
        font.pointSize: 9
         textColor: "black"
    }

    Image {
        id: image1
        x: 332
        y: 68
        width: 230
        height: 43
        source: "./Images/System/status2.jpg"
    }

    function setLocationData(){

        Storage.Area = area.currentText;
        Storage.Street = street.text;
        Storage.houseNo = houseNo.text;
        Storage.houseFeatures = features.text;
        Storage.desc = desc.text;
        Storage.sqMtrs = squareMtrs.text;
        Storage.blockNo = block.currentText
        Storage.Jada = jada.text;
        Storage.tockenNo = tockenNo.text;
        Storage.location = location.text;

        container.state = "addDocs";
    }
}
