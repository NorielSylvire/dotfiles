import Quickshell
import QtQuick

ShellRoot {
    property bool dockVisible: false
    property var activeScreen: null
    property bool mouseOverDock: false

    property int hotspotHeight: 30
    property int hideDelay: 400

    property var apps: [
        {
            icon: "",
            name: "Kitty",
            className: "kitty",
            command: ["kitty"]
        },
        {
            icon: "",
            name: "Thunar",
            className: "thunar",
            command: ["thunar"]
        },
        {
            icon: "",
            name: "Firefox",
            className: "firefox",
            command: ["firefox"]
        },
        {
            icon: "󰎂",
            name: "Obsidian",
            className: "md.obsidian.Obsidian",
            command: ["/home/liveuser/applications/Obsidian.AppImage"]
        },
        {
            icon: "",
            name: "Godot",
            className: "Godot",
            command: ["godot"]
        }
    ]

    Timer {
        id: hideTimer

        interval: hideDelay
        repeat: false

        onTriggered: {
            if (!mouseOverDock) {
                dockVisible = false
                activeScreen = null
            }
        }
    }

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData

                screen: modelData

                anchors.bottom: true

                implicitWidth: modelData.width
                implicitHeight: hotspotHeight

                exclusiveZone: 0
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        activeScreen = modelData
                        dockVisible = true
                        hideTimer.stop()

                        console.log("Dock hotspot:", modelData.name)
                    }

                    onExited: {
                        if (!mouseOverDock) {
                            hideTimer.restart()
                        }
                    }
                }
            }
        }
    }

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData

                screen: modelData

                anchors.bottom: true

                implicitWidth: 360
                implicitHeight: 80

                exclusiveZone: 0
                color: "transparent"

                visible: dockVisible && activeScreen === modelData

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 4

                    color: "#09070b"
                    radius: 12

                    border.width: 1
                    border.color: "#8b1e35"

                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top

                        height: 2

                        color: "#c21f43"
                    }

                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom

                        height: 2

                        color: "#4a1020"
                    }

                    Row {
                        anchors.centerIn: parent
                        spacing: 12

                        Repeater {
                            model: apps

                            delegate: Rectangle {
                                width: 52
                                height: 52

                                radius: 8

                                color: "transparent"

                                Text {
                                    anchors.centerIn: parent

                                    text: modelData.icon

                                    color: "#e8d9dd"

                                    font.pixelSize: 28
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    hoverEnabled: true

                                    acceptedButtons: Qt.LeftButton | Qt.RightButton

                                    onEntered: {
                                        parent.color = "#35101a"
                                    }

                                    onExited: {
                                        parent.color = "transparent"
                                    }

                                    onClicked: {
                                        if (mouse.button === Qt.RightButton) {
                                            console.log("Cycling:", modelData.name)

                                            Quickshell.execDetached([
                                                "/home/liveuser/.config/quickshell/dock/cycle-app.sh",
                                                modelData.className
                                            ])
                                        } else {
                                            console.log("Launching:", modelData.name)

                                            Quickshell.execDetached(modelData.command)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true

                        z: -1

                        onEntered: {
                            mouseOverDock = true
                            hideTimer.stop()
                        }

                        onExited: {
                            mouseOverDock = false
                            hideTimer.restart()
                        }
                    }
                }
            }
        }
    }
}

