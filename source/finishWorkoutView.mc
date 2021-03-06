using Toybox.Application as App;
using Toybox.Lang as Lang;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class finishWorkoutView extends Ui.View {
	private var select_items;
	private var max_items = 3;
	
    function initialize() {
    	View.initialize();
    	
    	var c = App.getApp().getController();
        var currentWorkout = c.getCurrentWorkout();
        select_items = ApeTools.AppHelper.getDiscardOptions(currentWorkout.isTerminated());
    	max_items = select_items.size();
    }

    // Update the view
    function onUpdate(dc) {
        var index, txt, text_height, x, y;
        var text_distance = 35;
        
        var c = App.getApp().getController();        
        
        var width = dc.getWidth();
        var height = dc.getHeight();
        
        //** clear screen
		dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear(); 
        
        
        //CURRENT MENU ITEM
        index = c.finish_workout_option;
        txt = select_items.get(index);
        text_height = 34;
        y = (height - text_height) / 2;
        dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(width/2, y, Gfx.FONT_SYSTEM_LARGE, txt, Gfx.TEXT_JUSTIFY_CENTER);
        
  		//CENTRAL LINES
        y = (height - text_height - 10) / 2;
        dc.drawLine(0, y, width, y);
        y = (height + text_height + 10) / 2;
        dc.drawLine(0, y, width, y);        

		/*
        //PREVIOUS MENU ITEM
        if(max_items > 2)
        {
	        index = c.finish_workout_option - 1;
	        if(index < 0) {
	        	index = max_items - 1;
	        }
	        txt = select_items[index];
	        text_height = 24;
	        y = (height / 2)- text_height - text_distance;
	        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
	        dc.drawText(width/2, y, Gfx.FONT_SYSTEM_MEDIUM, txt, Gfx.TEXT_JUSTIFY_CENTER);
	    }
        
        //NEXT MENU ITEM
        if(max_items > 2)
        {
	        index = c.finish_workout_option + 1;
	        if(index > (max_items - 1)) {
	        	index = 0;
	        }
	        txt = select_items[index];
	        y = (height / 2) + text_distance;
	        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
	        dc.drawText(width/2, y, Gfx.FONT_SYSTEM_MEDIUM, txt, Gfx.TEXT_JUSTIFY_CENTER);
	    }
	    */
    }
}

