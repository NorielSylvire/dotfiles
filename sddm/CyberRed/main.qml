// Config created by Keyitdev https://github.com/Keyitdev/sddm-astronaut-theme
// Copyright (C) 2022-2025 Keyitdev
// Based on https://github.com/MarianArlt/sddm-sugar-dark
// Distributed under the GPLv3+ License https://www.gnu.org/licenses/gpl-3.0.html

import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Effects
import QtMultimedia

import "Components"

Pane {
    id: root

    height: Number(config.ScreenHeight) > 0
            ? Number(config.ScreenHeight)
            : Screen.height
    
    width: Number(config.ScreenWidth) > 0
           ? Number(config.ScreenWidth)
           : Screen.width
    
    padding: Number(config.ScreenPadding) || 0

    LayoutMirroring.enabled: config.RightToLeftLayout == "true" ? true : Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    palette.window: config.BackgroundColor
    palette.highlight: config.HighlightBackgroundColor
    palette.highlightedText: config.HighlightTextColor
    palette.buttonText: config.HoverSystemButtonsIconsColor

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height / 80) || 13

    focus: true

    property bool leftleft: config.HaveFormBackground == "true" &&
                            config.PartialBlur == "false" &&
                            config.FormPosition == "left" &&
                            config.BackgroundHorizontalAlignment == "left"

    property bool leftcenter: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "left" &&
                              config.BackgroundHorizontalAlignment == "center"

    property bool rightright: config.HaveFormBackground == "true" &&
                              config.PartialBlur == "false" &&
                              config.FormPosition == "right" &&
                              config.BackgroundHorizontalAlignment == "right"

    property bool rightcenter: config.HaveFormBackground == "true" &&
                               config.PartialBlur == "false" &&
                               config.FormPosition == "right" &&
                               config.BackgroundHorizontalAlignment == "center"

    Item {
        id: sizeHelper

        height: parent.height
        width: parent.width
        anchors.fill: parent

        Rectangle {
		    id: tintLayer

		    anchors.fill: parent
		    z: 1

		    color: config.DimBackgroundColor
			opacity: config.DimBackground
		}

        Rectangle {
			id: formBackground

		    anchors.fill: form
		    anchors.centerIn: form

		    z: 2

		    color: config.FormBackgroundColor
		    visible: config.HaveFormBackground == "true"
			opacity: config.PartialBlur == "true" ? 0.3 : 1

			radius: config.RoundCorners
		}

        LoginForm {
		    id: form

			height: parent.height
			width: parent.width / 2.5

		    anchors.left: config.FormPosition == "left" ? parent.left : undefined
		    anchors.horizontalCenter: config.FormPosition == "center" ? parent.horizontalCenter : undefined
		    anchors.right: config.FormPosition == "right" ? parent.right : undefined

		    z: 3
		}

        Loader {
            id: virtualKeyboard
            source: "Components/VirtualKeyboard.qml"

            // x * 0.4 = x / 2.5
            width: config.KeyboardSize == "" ? parent.width * 0.4 : parent.width * config.KeyboardSize
            anchors.bottom: parent.bottom
            anchors.bottomMargin: virtualKeyboard.item
                      ? virtualKeyboard.item.height * 0.22
                      : 80
            anchors.left: config.VirtualKeyboardPosition == "left" ? parent.left : undefined;
            anchors.horizontalCenter: config.VirtualKeyboardPosition == "center" ? parent.horizontalCenter : undefined;
            anchors.right: config.VirtualKeyboardPosition == "right" ? parent.right : undefined;
            z: 1

            state: "hidden"
            property bool keyboardActive: item ? item.active : false

            function switchState() { state = state == "hidden" ? "visible" : "hidden"}
            states: [
                State {
                    name: "visible"
                    PropertyChanges {
                        target: virtualKeyboard
                        y: root.height - virtualKeyboard.height
                        opacity: 1
                    }
                },
                State {
                    name: "hidden"
                    PropertyChanges {
                        target: virtualKeyboard
                        y: root.height - root.height/4
                        opacity: 0
                    }
                }
            ]
            transitions: [
                Transition {
                    from: "hidden"
                    to: "visible"
                    SequentialAnimation {
                        ScriptAction {
                            script: {
                                virtualKeyboard.item.activated = true;
                                Qt.inputMethod.show();
                            }
                        }
                        ParallelAnimation {
                            NumberAnimation {
                                target: virtualKeyboard
                                property: "y"
                                duration: 100
                                easing.type: Easing.OutQuad
                            }
                            OpacityAnimator {
                                target: virtualKeyboard
                                duration: 180
                                easing.type: Easing.OutQuad
                            }
                        }
                    }
                },
                Transition {
                    from: "visible"
                    to: "hidden"
                    SequentialAnimation {
                        ParallelAnimation {
                            NumberAnimation {
                                target: virtualKeyboard
                                property: "y"
                                duration: 100
                                easing.type: Easing.InQuad
                            }
                            OpacityAnimator {
                                target: virtualKeyboard
                                duration: 180
                                easing.type: Easing.InQuad
                            }
                        }
                        ScriptAction {
                            script: {
                                virtualKeyboard.item.activated = false;
                                Qt.inputMethod.hide();
                            }
                        }
                    }
                }
            ]
        }

        Image {
            id: backgroundPlaceholderImage

            z: 10
            source: config.BackgroundPlaceholder
            visible: false
        }

        Image {
		    id: backgroundImage

		    z: 0

		    anchors.fill: parent

			source: "file:///usr/share/sddm/themes/CyberRed/Backgrounds/wallp-waves.jpg"

			fillMode: config.CropBackground == "true"
				? Image.PreserveAspectCrop
				: Image.PreserveAspectFit

			horizontalAlignment:
				config.BackgroundHorizontalAlignment == "left"
				? Image.AlignLeft
				: config.BackgroundHorizontalAlignment == "right"
				? Image.AlignRight
				: Image.AlignHCenter

			verticalAlignment:
			    config.BackgroundVerticalAlignment == "top"
				? Image.AlignTop
			    : config.BackgroundVerticalAlignment == "bottom"
			    ? Image.AlignBottom
			    : Image.AlignVCenter
	
			asynchronous: false
			cache: false
			mipmap: true
			clip: true
		}

        MouseArea {
            anchors.fill: backgroundImage
            onClicked: parent.forceActiveFocus()
        }

        ShaderEffectSource {
            id: blurMask

            height: parent.height
            width: form.width
            anchors.centerIn: form

            sourceItem: backgroundImage
            sourceRect: Qt.rect(x,y,width,height)
            visible: config.FullBlur == "true" || config.PartialBlur == "true" ? true : false
        }

        MultiEffect {
            id: blur

            height: parent.height

            // width: config.FullBlur == "true" ? parent.width : form.width
            // anchors.centerIn: config.FullBlur == "true" ? parent : form

            // This solves problem when FullBlur and HaveFormBackground is set to true but PartialBlur is false and FormPosition isn't center.
            width: (config.FullBlur == "true" && config.PartialBlur == "false" && config.FormPosition != "center" ) ? parent.width - formBackground.width : config.FullBlur == "true" ? parent.width : form.width
            anchors.centerIn: config.FullBlur == "true" ? backgroundImage : form

            source: config.FullBlur == "true" ? backgroundImage : blurMask
            blurEnabled: true
            autoPaddingEnabled: false
            blur: config.Blur == "" ? 2.0 : config.Blur
            blurMax: config.BlurMax == "" ? 48 : config.BlurMax
            visible: config.FullBlur == "true" || config.PartialBlur == "true" ? true : false
        }
    }
}
