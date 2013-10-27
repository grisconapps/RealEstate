import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import QtQuick.LocalStorage 2.0 as Sto
import QtQuick.Layouts 1.0



ApplicationWindow {
    title: qsTr("Welcome to RealEstate Application")
    minimumWidth: 840
    minimumHeight: 680
    color: "black"
    id: root

    Loader {
           id: loader
           anchors.fill: parent
           visible: source != ""
       }

    Rectangle {
        id: container
        x: -83
        y: -38
        anchors.centerIn: parent
        color: "grey"
        width: 500; height: 300
        radius: 10
        anchors.verticalCenterOffset: -8
        anchors.horizontalCenterOffset: 7
        visible: !loader.visible

        Image {
            x: 15
            y: 112
            source: "./Images/System/logo.jpeg"
            fillMode: Image.PreserveAspectCrop
            smooth: true
        }
        //state: Login


        Text {
            id: signIn
            x: 208
            y: 38
            width: 200
            height: 18
            text: qsTr("Sign In")
            color: "#ffffff"
            font.bold: true
            font.pointSize: 19
        }

        Text {
                    id: text1
                    x: 104
                    y: 95
                    width: 80
                    height: 20
                    color: "white"
                    text: "Username"
                    font.family: "OCR A Extended"
                    font.pixelSize: 24
             }

        Text {
                    id: text2
                    x: 104
                    y: 150
                    width: 80
                    height: 20
                    color: "white"
                    text: "Password"
                    font.family: "OCR A Extended"
                    font.pixelSize: 24
                }

        TextField
                    {
                        id: inputName
                        text: ""
                        x: 257
                        y: 95
                        width: 200
                        height: 30
                        font.family: "OCR A Std"

                    }

        TextField
                    {
                        id: inputPswd
                        text: ""
                        x: 257
                        y: 150
                        width: 200
                        height: 30
                        font.family: "OCR A Std"
                        echoMode: TextInput.Password
                    }


        Button {
            text: qsTr("Login")
            x: 387
            y: 220
            width: 70
            height: 30
            onClicked: findGreetings();
        }

        Connections {
                target: loader.source != "" ? loader.item : null
                onClicked: loader.source = ""
        }

        Label {
            id: label1
            x: 222
            y: 226
            color: "#ffffff"
            text: "forgot password ?"
            font.pointSize: 11
            font.underline: true
        }

        Text {
            id: errorText
            x: 150
            y: 8
            width: 200
            height: 18
            text: qsTr("")
            color: "#f52f2f"
            font.bold: true
            font.pointSize: 12
        }

        states: [
                State {
                    name: "Login"
                    PropertyChanges {
                        target: loader
                        source: "RealEstate.qml"
                    }
                },
                State {
                    name: "addProp"
                    PropertyChanges {
                        target: loader
                        source: "AddNewProperty.qml"
                    }
                },
                State {
                    name: "addLocDetails"
                    PropertyChanges {
                        target: loader
                        source: "AddLocationDetails.qml"
                    }
                },
                State {
                    name: "addDocs"
                    PropertyChanges {
                        target: loader
                        source: "AddDocuments.qml"
                    }
                },
                State {
                    name: "myProps"
                    PropertyChanges {
                        target: loader
                        source: "Myproperties.qml"
                    }
                }
            ]
    }

        function findGreetings() {
            var db = Sto.LocalStorage.openDatabaseSync("realestate.db", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                function(tx) {
                    // Show all added greetings
                    var rs = tx.executeSql('SELECT * FROM user WHERE name =\"'+inputName.text+ '\" and passwd =\"'+inputPswd.text+'\"');
                    if(rs.rows.length!==0){
                    console.log(rs.rows.item(0).name);
                        container.state = "myProps"
                    }
                    else
                        errorText.text="Login failed, Try again";
                }
            )
        }



}
