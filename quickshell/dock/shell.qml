import Quickshell
import QtQuick

ShellRoot {
    property bool dockVisible: false
    property var activeScreen: null
    property bool mouseOverDock: false

    property int dockWidth: 360
    property int dockHeight: 80
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

    /*
     * One PanelWindow per screen.
     *
     * The window itself spans the screen horizontally, but its
     * input mask only covers the centered dock/hotspot area.
     *
     * Therefore the rest of the screen remains click-through.
     */
    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData

                screen: modelData

                anchors {
                    bottom: true
                    left: true
                    right: true
                }

                implicitHeight: dockHeight + hotspotHeight

                exclusiveZone: 0
                color: "transparent"

                /*
                 * Only this region receives mouse input.
                 *
                 * When the dock is hidden:
                 *
                 *     [ hotspot ]
                 *
                 * When the dock is visible:
                 *
                 *     [   dock   ]
                 *     [ hotspot ]
                 *
                 * Everything outside this region passes through
                 * to the application underneath.
                 */
                Item {
                    id: inputRegion

                    width: dockWidth

                    height: dockVisible &&
                            activeScreen === modelData
                            ? dockHeight + hotspotHeight
                            : hotspotHeight

                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                mask: Region {
                    item: inputRegion
                }

                /*
                 * Center-bottom hotspot.
                 *
                 * This is only 360px wide and 30px high.
                 */
                MouseArea {
                    id: hotspot

                    width: dockWidth
                    height: hotspotHeight

                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter

                    hoverEnabled: true

                    z: 1

                    onEntered: {
                        activeScreen = modelData
                        dockVisible = true

                        mouseOverDock = true
                        hideTimer.stop()

                        console.log(
                            "Dock hotspot:",
                            modelData.name
                        )
                    }

                    onExited: {
                        /*
                         * Moving upward into the dock is NOT
                         * considered leaving the dock.
                         *
                         * Give the dock's HoverHandler a chance
                         * to take over.
                         */
                        if (!mouseOverDock) {
                            hideTimer.restart()
                        }
                    }
                }

                /*
                 * Dock
                 */
                Rectangle {
                    id: dock

                    width: dockWidth
                    height: dockHeight

                    anchors.bottom: hotspot.top
                    anchors.horizontalCenter: parent.horizontalCenter

                    visible: dockVisible &&
                             activeScreen === modelData

                    color: "#09070b"

                    radius: 12

                    border.width: 1
                    border.color: "#8b1e35"

                    z: 2

                    /*
                     * HoverHandler tracks the entire dock without
                     * stealing mouse clicks from the buttons.
                     *
                     * This is the important difference from the
                     * previous MouseArea-based solution.
                     */
                    HoverHandler {
                        id: dockHover

                        onHoveredChanged: {
                            if (hovered) {
                                mouseOverDock = true
                                hideTimer.stop()

                                console.log("Mouse entered dock")
                            } else {
                                mouseOverDock = false
                                hideTimer.restart()

                                console.log("Mouse left dock")
                            }
                        }
                    }

                    /*
                     * Top accent
                     */
                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top

                        height: 2

                        color: "#c21f43"

                        z: 0
                    }

                    /*
                     * Bottom accent
                     */
                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom

                        height: 2

                        color: "#4a1020"

                        z: 0
                    }

                    /*
                     * Application buttons
                     */
                    Row {
                        anchors.centerIn: parent

                        spacing: 12

                        z: 10

                        Repeater {
                            model: apps

                            delegate: Rectangle {
                                width: 52
                                height: 52

                                radius: 8

                                color: "transparent"

                                z: 10

                                Text {
                                    anchors.centerIn: parent

                                    text: modelData.icon

                                    color: "#e8d9dd"

                                    font.pixelSize: 28
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    hoverEnabled: true

                                    acceptedButtons:
                                        Qt.LeftButton |
                                        Qt.RightButton

                                    onEntered: {
                                        parent.color = "#35101a"

                                        /*
                                         * HoverHandler on the dock
                                         * already keeps the dock alive.
                                         *
                                         * We only cancel the timer here
                                         * for extra safety.
                                         */
                                        hideTimer.stop()
                                    }

                                    onExited: {
                                        parent.color = "transparent"
                                    }

                                    onClicked: {
                                        if (
                                            mouse.button ===
                                            Qt.RightButton
                                        ) {
                                            console.log(
                                                "Cycling:",
                                                modelData.name
                                            )

                                            Quickshell.execDetached([
                                                "/home/liveuser/.config/quickshell/dock/cycle-app.sh",
                                                modelData.className
                                            ])
                                        } else {
                                            console.log(
                                                "Launching:",
                                                modelData.name
                                            )

                                            Quickshell.execDetached(
                                                modelData.command
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
