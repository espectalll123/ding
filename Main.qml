import QtQuick 2.0
import Qt.WebSockets 1.0
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0
import Ubuntu.Components.Pickers 1.0
import Ubuntu.Components.ListItems 1.0 as ListItem

MainView {
    objectName: "mainView"

    applicationName: "ding.espectalll123"

    //automaticOrientation: true

    width: units.gu(100)
    height: units.gu(75)

    WebSocket {
        id: ws
        url: "wss://ding-espectalll123.rhcloud.com:8443"
        onTextMessageReceived: {
            console.log("The socket said: " + message)
        }
        onStatusChanged: if (ws.status == WebSocket.Error) {
                             console.log("Error: " + ws.errorString)
                         } else if (ws.status == WebSocket.Open) {
                             console.log("Connection established!")
                         } else if (ws.status == WebSocket.Closed) {
                             console.log("Closed connection")
                         }
        active: true
    }

    Tabs {
        id: tabs
        Tab {
            title: i18n.tr("Ding")
            page: Page {
                Column {
                    id: datColumn
                    spacing: units.gu(1)
                    anchors {
                        margins: units.gu(2)
                        fill: parent
                    }
                    GridView {
                        id: favoritesGrid
                        width: parent.width; height: units.gu(20)
                        flow: GridView.FlowTopToBottom
                        flickableDirection: GridView.HorizontalFlick
                        cellWidth: units.gu(18); cellHeight: units.gu(18)
                        model: ListModel {
                            ListElement {
                                name: "Francisco Gómez"
                                picture: "graphics/Xerzvolution.png"
                            }
                            ListElement {
                                name: "初音ミク"
                                picture: "graphics/Miku.png"
                            }
                            ListElement {
                                name: "Bugs Bunny"
                                picture: "graphics/Bugs.png"
                            }
                            ListElement {
                                name: "KNUCKLE$"
                                picture: "graphics/Knuckle$.png"
                            }
                        }
                        delegate: Grid {
                            rows: 2; columns: 1
                            UbuntuShape {
                                width: units.gu(16); height: units.gu(16)
                                image: Image {
                                    source: picture
                                }
                                DropArea {
                                    anchors.fill: parent
                                    onDropped: {
                                        console.log("Sending...");
                                        ws.sendTextMessage(name);
                                    }
                                }
                            }
                            Label {
                                text: name
                            }
                        }
                    }

                    Rectangle {
                        width: parent.width; height: parent.height - units.gu(34)
                        opacity: 0
                    }

                    Rectangle {
                            id: dingCircle
                            x: datColumn.width / 2 - units.gu(6); y: datColumn.height - units.gu(12)
                            width: units.gu(12); height: units.gu(12)
                            radius: width * 0.5
                            gradient: UbuntuColors.orangeGradient
                            Image {
                                source: "graphics/dingCircle.svg"
                                width: parent.width; height: parent.height
                            }

                            Drag.active: dragArea.drag.active
                            MouseArea {
                                id: dragArea
                                anchors.fill: parent
                                drag {
                                    target: parent
                                    minimumY: 0
                                }
                                onPressed: PropertyAnimation {
                                    target: dingCircle
                                    property: "opacity"
                                    to: 0.8
                                }
                                onReleased: {
                                    parent.Drag.drop()
                                    moveDingX.start()
                                    moveDingY.start()
                                    opaqueDingX.start()
                                }

                                PropertyAnimation {
                                    id: opaqueDingX
                                    target: dingCircle
                                    property: "opacity"
                                    to: 1
                                }
                                PropertyAnimation {
                                    id: moveDingX
                                    target: dingCircle
                                    property: "x"
                                    to: datColumn.width / 2 - units.gu(6)
                                    easing.type: Easing.OutQuad
                                }
                                PropertyAnimation {
                                    id: moveDingY
                                    target: dingCircle
                                    property: "y"
                                    to: datColumn.height - units.gu(12)
                                    easing.type: Easing.OutQuad
                                }
                            }
                        }
                    }
                }
            }
        Tab {
            title: i18n.tr("Dialer")
            page: Page {
                Grid {
                    columns: 3
                    spacing: units.gu(.5)
                    Button {
                        id: dialerOne
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "1"
                    }
                    Button {
                        id: dialerTwo
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "2"
                    }
                    Button {
                        id: dialerThree
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "3"
                    }
                    Button {
                        id: dialerFour
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "4"
                    }
                    Button {
                        id: dialerFive
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "5"
                    }
                    Button {
                        id: dialerSix
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "6"
                    }
                    Button {
                        id: dialerSeven
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "7"
                    }
                    Button {
                        id: dialerEight
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "8"
                    }
                    Button {
                        id: dialerNine
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "9"
                    }
                    Button {
                        id: dialerPlus
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "+"
                    }
                    Button {
                        id: dialerZero
                        width: units.gu(10); height: units.gu(6)
                        font.pointSize: 18
                        color: UbuntuColors.warmGrey
                        text: "0"
                    }
                    Button {
                        id: dialerDing
                        width: units.gu(10); height: units.gu(6)
                        iconSource: "graphics/dingDialer.svg"
                        color: "green"
                    }
                }
            }
        }
        Tab {
            title: i18n.tr("List")
            page: Page {
                ListView {
                anchors.fill: parent
                model: ListModel {
                    ListElement {
                        name: "Thingie 1"
                    }
                    ListElement {
                        name: "Thingie 2"
                    }
                    ListElement {
                        name: "Thingie 3"
                    }
                    ListElement {
                        name: "Thingie 4"
                    }
                }
                delegate: ListItem.Standard {
                        width: ListView.view.width
                        height: units.gu(5)
                        text: modelData
                }
                }
            }
            }
        }
}
