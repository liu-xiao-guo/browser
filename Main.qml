import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Web 0.2
import QtQuick.Layouts 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "browser.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    Page {
        title: i18n.tr("")

        RowLayout {
            id:toolbar
            anchors.top: parent.top
            width: parent.width
            height: units.gu(8)
            spacing: units.gu(1)

            Icon {
                id: back
                anchors.verticalCenter: parent.verticalCenter
                name: "go-previous"
                height: input.height
                width: height
                visible: webview.canGoBack

                MouseArea {
                    anchors.fill: parent
                    onClicked: webview.goBack();
                }
            }
            Icon {
                id: forward
                anchors.verticalCenter: parent.verticalCenter
                name: "go-next"
                height: input.height
                width: height
                visible: webview.canGoForward
                MouseArea {
                    anchors.fill: parent
                    onClicked: webview.goForward();
                }
            }

            TextField {
                id: input
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height - units.gu(1)
                Layout.maximumWidth: parent.width
                Layout.preferredWidth: parent.width - back.width - forward.width
                text: "http://www.baidu.com"

                onAccepted: {
                    webview.url = input.text
                }
            }
        }

        WebView {
            id: webview
            anchors.top: toolbar.bottom
            height: parent.height - toolbar.height
            width: parent.width

            url: "http://www.baidu.com"
        }

    }
}

