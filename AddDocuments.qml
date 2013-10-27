import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Layouts 1.0
import QtQuick.LocalStorage 2.0 as Sto
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
        id: label7
        x: 72
        y: 149
        width: 106
        height: 49
        color: "#ffffff"
        text: "Step 3: Add Photos"
        font.pointSize: 15
        font.underline: true
    }

    Label {
        id: label1
        x: 124
        y: 266
        width: 204
        height: 42
        color: "#ffffff"
        text: "Add Photos of the Property"
        font.pointSize: 15
    }

    Label {
        id: label2
        x: 551
        y: 266
        width: 204
        height: 42
        color: "#ffffff"
        text: "Owner Papers"
        font.pointSize: 15
    }

    Button {
        id: uploadPics
        x: 185
        y: 331
        width: 100
        height: 71
        text: "Add Image"
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
    }

    Button {
        id: uploadPapers
        x: 567
        y: 331
        width: 100
        height: 71
        text: "Scan Documents"
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
    }

    Button {
        id: backButton
        x: 276
        y: 531
        text: "Back"
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
        onClicked: container.state = "addLocDetails"
    }

    Button {
        id: submitButton
        x: 455
        y: 531
        text: "Submit"
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
        onClicked: submitData();
    }

    Image {
        id: image1
        x: 338
        y: 43
        width: 230
        height: 43
        source: "./Images/System/status3.jpg"
    }

    function submitData(){
        var db = Sto.LocalStorage.openDatabaseSync("realestate.db", "1.0", "The Example QML SQL!", 1000000);

        db.transaction(
            function(tx) {
                // Show all added greetings
                //var rs = tx.executeSql('SELECT * FROM user WHERE name =\"'+inputName.text+ '\" and passwd =\"'+inputPswd.text+'\"');
                var propId = Storage.Area+Storage.blockNo+Storage.tockenNo;
                var picsPath = "/Images/"+propId;
                var docsPath = "/Docs/"+propId;
                var rs = tx.executeSql('INSERT INTO property VALUES("'+propId+'","'+Storage.ownerName+'",'+Storage.phone+','+Storage.blockNo+','+Storage.houseNo+',"'+Storage.Street+'","'+Storage.location+'","'+ Storage.desc+'","'+picsPath+'")');
                var rs1 = tx.executeSql('INSERT INTO Property_details VALUES('+propId+',"'+Storage.mode+'","'+Storage.type+'","'+Storage.ownerName+'",'+ Storage.requestPrice+','+ Storage.commission+','+ Storage.minPrice+',"'+ Storage.purpose+'",'+ Storage.phone+',"'+Storage.picsPath+'")');
                var rs2 = tx.executeSql('INSERT INTO Location_details VALUES('+propId+',"'+Storage.Area+'","'+Storage.Street+'",'+Storage.blockNo+','+ Storage.Jada+','+Storage.houseNo+','+ Storage.sqMtrs+','+Storage.tockenNo+',"'+Storage.location+'","'+Storage.houseFeatures+'","'+docsPath+'","'+ Storage.desc+'")');
                if(rs2.insertId!==null)
                  console.log("Success");
                else
                  console.log("Failure");
            }
        )
       container.state = "myProps"

    }

}
