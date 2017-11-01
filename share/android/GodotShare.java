package org.godotengine.godot;

import java.io.File;

import android.content.Intent;
import android.app.*;
import android.net.Uri;
import android.content.ContextWrapper;

import android.util.Log;

public class GodotShare extends Godot.SingletonBase
{

	private Activity activity;

	static public Godot.SingletonBase initialize(Activity p_activity)
	{
		return new GodotShare(p_activity);
	}
	
	public GodotShare(Activity p_activity)
	{
		registerClass("GodotShare", new String[]
		{
			"sharePic","shareText"
		});
		activity = p_activity;
		
	}

	public void shareText(String title, String subject, String text)
	{
		Intent sharingIntent = new Intent(android.content.Intent.ACTION_SEND);
		sharingIntent.setType("text/plain");
		sharingIntent.putExtra(android.content.Intent.EXTRA_SUBJECT, subject);
		sharingIntent.putExtra(android.content.Intent.EXTRA_TEXT, text);
		activity.startActivity(Intent.createChooser(sharingIntent, title)); 
		
		Log.d("godot", "shareText");
	}
	
	public void sharePic(String path, String title, String subject, String text)
	{
		Intent shareIntent = new Intent(Intent.ACTION_SEND);
		shareIntent.setType("image/*");
		File f = new File(path);
		f.setReadable(true, false);
		Uri uri = Uri.fromFile(f);
		
		shareIntent.putExtra(Intent.EXTRA_SUBJECT, subject);
		shareIntent.putExtra(Intent.EXTRA_TEXT, text);
		shareIntent.putExtra(Intent.EXTRA_STREAM, uri);
		activity.startActivity(Intent.createChooser(shareIntent, title));
		
		Log.d("godot", "sharePic");
	}
}
