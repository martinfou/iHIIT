using Toybox.Application as App;
using Toybox.Lang as Lang;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;

class selectWorkoutView extends Ui.View {
	
	var select_workout_prompt;
	
    function initialize() {
    	View.initialize();    	  	
    	select_workout_prompt = Ui.loadResource(Rez.Strings.select_workout_prompt);
    }

    // Update the view
    function onUpdate(dc)
    {        
        var app = App.getApp();
        var m = app.getController().getModel();
        var WOI = m.getSelectedWorkout();
        var txt, x, y;
        
        var width = dc.getWidth();
        var height = dc.getHeight();
        
        //** clear screen
		dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear(); 
        
        y = (height/2) - 32;
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);        
        dc.drawText(width/2, y, Gfx.FONT_TINY, select_workout_prompt, Gfx.TEXT_JUSTIFY_CENTER);
        
        txt = m.getPropertyForWorkout(WOI, "title", "");
        y = (height/2) - 12;
        dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
        dc.drawText(width/2, y, Gfx.FONT_MEDIUM, txt, Gfx.TEXT_JUSTIFY_CENTER);
        
        txt = "Number of exercises: " + m.getNumberOfExercises();
        y = (height/2) + 20;
        dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
        dc.drawText(width/2, y, Gfx.FONT_SMALL, txt, Gfx.TEXT_JUSTIFY_CENTER);
        
    }
}
