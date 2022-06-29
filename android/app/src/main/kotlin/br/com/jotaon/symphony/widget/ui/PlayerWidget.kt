package br.com.jotaon.symphony.widget.ui

import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.*
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.layout.*
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import br.com.jotaon.symphony.R
import br.com.jotaon.symphony.MainActivity

@Composable
fun PlayerWidget(state: PlayerWidgetState) {
    Column(
        modifier = GlanceModifier
            .background(ImageProvider(R.drawable.background_widget))
            .clickable(actionStartActivity(activity = MainActivity::class.java))
            .padding(16.dp)
    ) {
        Text(
            text = state.songTitle
        )
    }
}