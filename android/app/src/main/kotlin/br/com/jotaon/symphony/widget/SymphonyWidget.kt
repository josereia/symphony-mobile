package br.com.jotaon.symphony.widget

import androidx.compose.runtime.Composable
import androidx.datastore.preferences.core.Preferences
import androidx.glance.*
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.state.GlanceStateDefinition
import androidx.glance.state.PreferencesGlanceStateDefinition
import br.com.jotaon.symphony.R
import br.com.jotaon.symphony.widget.receiver.PlayerWidgetReceiver
import br.com.jotaon.symphony.widget.ui.PlayerWidget
import br.com.jotaon.symphony.widget.ui.PlayerWidgetState

class SymphonyWidget : GlanceAppWidget() {
    val sateDefinition: GlanceStateDefinition<*> = PreferencesGlanceStateDefinition

    @Composable
    override fun Content() {
        val context = LocalContext.current
        val prefs = currentState<Preferences>()

        val currentSongTitle = prefs[PlayerWidgetReceiver.songTitle]
        val currentSongArtists = prefs[PlayerWidgetReceiver.songArtists]

        val playerWidgetState = PlayerWidgetState(
            songTitle= currentSongTitle ?: "título não definido",
            songArtists= currentSongArtists ?: "artistas não definido"
        )

        PlayerWidget(playerWidgetState)
    }
}