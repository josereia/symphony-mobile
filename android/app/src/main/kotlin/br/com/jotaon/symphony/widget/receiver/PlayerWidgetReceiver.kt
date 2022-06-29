package br.com.jotaon.symphony.widget.receiver

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetManager
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.state.updateAppWidgetState
import androidx.glance.state.PreferencesGlanceStateDefinition
import br.com.jotaon.symphony.widget.SymphonyWidget
import kotlinx.coroutines.MainScope
import kotlinx.coroutines.launch


class PlayerWidgetReceiver : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = SymphonyWidget()
    private val coreoutlineScope = MainScope()

    private fun observeData(context: Context) {
        coreoutlineScope.launch {
            val glanceId = GlanceAppWidgetManager(context).getGlanceIds(SymphonyWidget::class.java).firstOrNull()

            glanceId?.let {
                updateAppWidgetState(context, PreferencesGlanceStateDefinition, it) {pref ->
                    pref.toMutablePreferences().apply {
                        this[songTitle] = "teste title"
                        this[songArtists] = "teste artists"
                    }
                }
                glanceAppWidget.update(context, it)
            }
        }
    }

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)
        observeData(context)
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
    }

    companion object {
        val songTitle = stringPreferencesKey("songTitle")
        val songArtists = stringPreferencesKey("songArtists")
    }
}