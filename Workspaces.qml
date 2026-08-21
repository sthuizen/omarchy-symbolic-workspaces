// Derived from Omarchy's Workspaces widget, distributed under the MIT License.
// Upstream copyright (c) David Heinemeier Hansson. Modifications by thenailedone.

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "nlsthzn.workspaces"

  readonly property var workspaceSymbols: ({
    1: "\uDB80\uDE38", // Material Design Icons: fire
    2: "\uDB82\uDD53", // Material Design Icons: cross
    3: "\uDB81\uDCCE", // Material Design Icons: star
    4: "\uDB80\uDDA5", // Material Design Icons: crown
    5: "\uDB80\uDC31"  // Material Design Icons: anchor
  })

  function workspaceLabel(id) {
    return workspaceSymbols[id] || (id === 10 ? "0" : String(id))
  }

  function workspaceById(id) {
    var values = Hyprland.workspaces.values
    for (var i = 0; i < values.length; i++) {
      if (values[i].id === id) return values[i]
    }

    return null
  }

  function workspaceIds() {
    var ids = [1, 2, 3, 4, 5]
    var values = Hyprland.workspaces.values

    for (var i = 0; i < values.length; i++) {
      var id = values[i].id
      if (id > 0 && id <= 10 && ids.indexOf(id) === -1) ids.push(id)
    }

    ids.sort(function(left, right) { return left - right })
    return ids
  }

  function focusWorkspace(id) {
    if (!root.bar) return
    root.bar.run("hyprctl dispatch " + Util.shellQuote("hl.dsp.focus({ workspace = \"" + id + "\" })"))
  }

  readonly property real trailingGap: root.vertical ? 0 : Style.spaceReal(1.5)

  implicitWidth: grid.implicitWidth + trailingGap
  implicitHeight: grid.implicitHeight

  GridLayout {
    id: grid
    anchors.fill: parent
    anchors.rightMargin: root.trailingGap
    columns: root.vertical ? 1 : root.workspaceIds().length
    columnSpacing: root.vertical ? 0 : Style.space(1)
    rowSpacing: root.vertical ? Style.space(2) : 0

    Repeater {
      model: root.workspaceIds()

      WidgetButton {
        required property int modelData

        readonly property var workspace: root.workspaceById(modelData)
        readonly property bool occupied: workspace !== null && workspace.toplevels.values.length > 0
        readonly property bool focused: Hyprland.focusedWorkspace !== null && Hyprland.focusedWorkspace.id === modelData

        bar: root.bar
        text: focused ? "\uDB85\uDCFB" : root.workspaceLabel(modelData)
        fontFamily: "JetBrainsMono Nerd Font"
        fontSize: focused ? Style.font.iconLarge : Style.font.icon
        opacity: occupied || focused ? 1 : 0.5
        horizontalMargin: 6
        verticalPadding: 6
        fixedWidth: root.vertical ? root.barSize : Style.space(20)
        fixedHeight: root.barSize
        onPressed: function() { root.focusWorkspace(modelData) }

        Text {
          anchors.centerIn: parent
          visible: parent.focused
          text: root.workspaceLabel(parent.modelData)
          color: root.bar ? root.bar.themeContrastForeground : Color.background
          font.family: "JetBrainsMono Nerd Font"
          font.pixelSize: Style.font.icon
          renderType: Text.NativeRendering
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
        }
      }
    }
  }
}
