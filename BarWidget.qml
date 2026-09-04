import QtQuick
import Omarchy.PluginPresentation 1.0

Item {
    id: root
    width: button.width
    height: button.height

    readonly property int unreadCount: github.unreadCount
    readonly property bool readAvailable: runtime.hasPermission("bash.execute", "run")
    readonly property var settings: runtime.settings
    readonly property bool active: github.alarming && !settings.iconAlwaysUnlit

    Service { id: github }

    Rectangle {
        id: button
        width: root.unreadCount > 0 ? 64 : 44
        height: 36
        radius: 8
        color: root.active ? Color.alpha(Color.background, 0.86)
          : pointer.containsMouse ? Color.alpha(Color.background, 0.72)
          : Color.alpha(Color.background, 0.58)
        border.color: Color.alpha(Color.foreground, pointer.containsMouse ? 0.42 : 0.2)
        opacity: root.readAvailable ? 1 : 0.5

        Row {
            anchors.centerIn: parent
            spacing: 5
            Text {
                text: "\uf09b"
                color: "#eef3f8"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 18
            }
            Text { visible: root.unreadCount > 0; text: root.unreadCount; color: "#eef3f8"; font.bold: true; font.pixelSize: 11 }
        }

        MouseArea {
            id: pointer
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton
            onPressed: function(mouse) {
                if (mouse.button === Qt.RightButton || mouse.button === Qt.MiddleButton) github.refresh()
                else runtime.requestSurfaceIntent("github", "toggle")
            }
        }
    }
}
