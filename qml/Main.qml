import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'mfpve.hummlbach'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('MinFlickPathViewExample')
        }

        ListModel {
            id: colorsModel

            ListElement {
                name: "green"
            }
            ListElement {
                name: "blue"
            }
            ListElement {
                name: "red"
            }
        }
        
        Component {
            id: rectangleDelegate

            Flickable {
                id: flickit
                objectName: "letsflickit"

                height: parent.height/2
                width: parent.width

                //contentWidth: width
                //contentHeight: height
                contentWidth: 2*width
                contentHeight: 2*height
                
                boundsBehavior: Flickable.StopAtBounds

                clip: true

                Column {

                    anchors.fill: parent

                    Row {
                        id: upperRow

                        width: parent.width
                        height: parent.height/2

                        Rectangle {
                            width: parent.width/2
                            height: parent.height
                            color: name
                        }

                        Rectangle {
                            width: parent.width/2
                            height: parent.height
                            color: name
                            opacity: 0.5
                        }
                    }

                    Row {
                        id: lowerRow

                        width: parent.width
                        height: parent.height/2
                        
                        Rectangle {
                            width: parent.width/2
                            height: parent.height
                            color: name
                            opacity: 0.5
                        }

                        Rectangle {
                            width: parent.width/2
                            height: parent.height
                            color: name
                        }
                    }
     
                }
            }
        }

        PathView {
            id: pathview

            anchors.fill: parent
            model: colorsModel
            snapMode: PathView.SnapOneItem
            delegate: rectangleDelegate

            path: Path {
                startX: (-pathview.width/2); startY: pathview.height/2
                PathLine { x: (2.5*pathview.width)  ; relativeY: 0;  }
            }
        }
    }
}
