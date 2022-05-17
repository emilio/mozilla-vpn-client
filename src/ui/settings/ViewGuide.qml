import QtQuick 2.15
import QtQuick.Layouts 1.15

import Mozilla.VPN 1.0
import components 0.1

Item {
    id: root

    property var guide
    property alias imageBgColor: imageBg.color
    property int safeAreaHeight: window.safeAreaHeightByDevice()


    ColumnLayout {
        anchors.fill: parent

        spacing: 0

        Rectangle {
            id: imageBg

            Layout.fillWidth: true
            Layout.preferredHeight: Screen.height * 0.33
            Layout.topMargin: -safeAreaHeight //we want to cover the safe area with the image background color

            VPNIconButton {
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: root.safeAreaHeight + 8
                anchors.leftMargin: 8

                skipEnsureVisible: true
                //% "Back"
                //: Go back
                accessibleName: qsTrId("vpn.main.back")

                onClicked: {
                    statusBarModifier.resetDefaults()
                    mainStackView.pop()
                }

                Image {
                    objectName: "menuIcon"

                    anchors.centerIn: parent

                    source: "qrc:/nebula/resources/arrow-back-white.svg"
                    sourceSize.width: VPNTheme.theme.iconSize * 1.5
                    fillMode: Image.PreserveAspectFit
                }
            }

            //Center image in background not including the iOS safe area
            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: root.safeAreaHeight

                spacing: 0

                Item {
                    Layout.fillHeight: true
                }

                Image {
                    Layout.alignment: Qt.AlignHCenter

                    source: guide.image
                    sourceSize.height: imageBg.height * 0.66
                    fillMode: Image.PreserveAspectFit
                }

                Item {
                    Layout.fillHeight: true
                }
            }

            VPNMobileStatusBarModifier {
                id: statusBarModifier
                statusBarTextColor: VPNTheme.StatusBarTextColorLight
            }
        }

        VPNFlickable {
            id: x
            Layout.fillWidth: true
            Layout.fillHeight: true

            contentHeight: layout.implicitHeight + layout.anchors.topMargin
            flickContentHeight: contentHeight
            interactive: contentHeight > height

            Column {
                id: layout
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.topMargin: VPNTheme.theme.vSpacingSmall
                anchors.leftMargin: VPNTheme.theme.windowMargin
                anchors.rightMargin: VPNTheme.theme.windowMargin

                ColumnLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right

                    spacing: 0

                    VPNBoldInterLabel {
                        Layout.fillWidth: true

                        text: VPNl18n.TipsAndTricksQuickTipsGuideViewTitle
                        font.pixelSize: VPNTheme.theme.fontSize
                        lineHeight: VPNTheme.theme.labelLineHeight
                        color: VPNTheme.theme.fontColor
                    }

                    VPNBoldLabel {
                        Layout.topMargin: VPNTheme.theme.vSpacingSmall
                        Layout.fillWidth: true

                        text: VPNl18n[guide.titleId]
                        lineHeightMode: Text.FixedHeight
                        lineHeight: 24
                        wrapMode: Text.Wrap
                        verticalAlignment: Text.AlignVCenter
                    }

                    VPNInterLabel {
                        Layout.topMargin: 8
                        Layout.fillWidth: true

                        text: VPNl18n[guide.subtitleId]
                        font.pixelSize: VPNTheme.theme.fontSizeSmall
                        color: VPNTheme.theme.fontColor
                        horizontalAlignment: Text.AlignLeft
                    }

                    Rectangle {
                        Layout.topMargin: 16
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1

                        color: VPNTheme.colors.grey10
                    }

                    Repeater {
                        id: repeater
                        property var indentTagRegex: /(<\/?li>)/g

                        Component {
                            id: titleBlock

                            VPNBoldInterLabel {
                                property var guideBlock

                                text: VPNl18n[guideBlock.id]
                                font.pixelSize: VPNTheme.theme.fontSize
                                lineHeight: VPNTheme.theme.labelLineHeight
                            }
                        }

                        Component {
                            id: textBlock

                            VPNInterLabel {
                                property var guideBlock

                                text: VPNl18n[guideBlock.id]
                                font.pixelSize: VPNTheme.theme.fontSizeSmall
                                color: VPNTheme.theme.fontColor
                                horizontalAlignment: Text.AlignLeft
                            }
                        }

                        Component {
                            id: listBlock

                            VPNInterLabel {
                                property var guideBlock
                                property string listType

                                property var tagsList: {
                                    var list = []
                                    guideBlock.subBlockIds.forEach(subBlockId => {
                                        list.push("<li>" + VPNl18n[subBlockId] + "</li>")
                                    });
                                    return list
                                }

                                text: `<${listType} style='margin-left: -24px;-qt-list-indent:1;'>%1</${listType}>`.arg(tagsList.join(""))
                                textFormat: Text.RichText
                                font.pixelSize: VPNTheme.theme.fontSizeSmall
                                color: VPNTheme.theme.fontColor
                                horizontalAlignment: Text.AlignLeft
                                Accessible.name: tagsList.join("\n").replace(repeater.indentTagRegex, "")
                            }
                        }

                        model: guide.blocks
                        delegate: Loader {

                            Layout.fillWidth: true

                            sourceComponent: {
                                switch(modelData.type) {
                                case VPNGuide.GuideBlockTypeTitle:
                                    Layout.topMargin = 16
                                    return titleBlock
                                case VPNGuide.GuideBlockTypeText:
                                    Layout.topMargin = 4
                                    return textBlock
                                case VPNGuide.GuideBlockTypeOrderedList:
                                case VPNGuide.GuideBlockTypeUnorderedList:
                                    Layout.topMargin = 4
                                    return listBlock
                                }
                            }

                            onLoaded: {
                                item.guideBlock = modelData
                                if(modelData.type === VPNGuide.GuideBlockTypeOrderedList) {
                                    item.listType = "ol"
                                }
                                else if(modelData.type === VPNGuide.GuideBlockTypeUnorderedList) {
                                    item.listType = "ul"
                                }
                            }
                        }
                    }

                    //padding for the bottom of the flickable
                    Item {
                        Layout.preferredHeight: 56
                    }
                }
            }
        }
    }
}
