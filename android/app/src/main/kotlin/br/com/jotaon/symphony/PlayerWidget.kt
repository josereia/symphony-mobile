package br.com.jotaon.symphony

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import android.graphics.Bitmap
import com.bumptech.glide.request.transition.Transition
import com.bumptech.glide.*
import com.bumptech.glide.request.target.AppWidgetTarget
import com.bumptech.glide.request.RequestOptions


class PlayerWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        var songAlbumPic : String? = ""
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.player_widget).apply {

                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                    MainActivity::class.java)
                val skipForwardIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                    Uri.parse("myAppWidget://skipForward"))
                val skipBacktIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                    Uri.parse("myAppWidget://skipBack"))
                val playPauseIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                    Uri.parse("myAppWidget://playPause"))


                val songTitle = widgetData.getString("_songTitle", "")
                val songArtists = widgetData.getString("_songArtists", "")
                songAlbumPic = widgetData.getString("_songAlbumPic", "")

                setTextViewText(R.id.song_title, songTitle)
                setTextViewText(R.id.song_artists, songArtists)

                setOnClickPendingIntent(R.id.bt_skip_forward, skipForwardIntent)
                setOnClickPendingIntent(R.id.bt_play_pause, playPauseIntent)
                setOnClickPendingIntent(R.id.bt_skip_back, skipBacktIntent)

                setOnClickPendingIntent(R.id.player_widget_root, pendingIntent)
            }

            val awt: AppWidgetTarget = object : AppWidgetTarget(context.applicationContext, R.id.album_pic, views, *appWidgetIds) {
                override fun onResourceReady(resource: Bitmap, transition: Transition<in Bitmap>?) {
                    super.onResourceReady(resource, transition)
                }
            }
            var options = RequestOptions().
            override(300, 300).placeholder(R.drawable.placeholder_img).error(R.drawable.error_img)
            Glide.with(context.applicationContext).asBitmap().load(songAlbumPic).apply(options).into(awt)


            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}