if (screenshot_auto_enabled && surface_exists(application_surface))
{
    screenshot_timer += Time.dt;
    // Take a screenshot every 1.0s
    if ( screenshot_timer > 1.0 )
    {
        screenshot_timer = 0;
        
        // Create screenshot dir
        var dir = "./screenshots";
        if ( !directory_exists(dir) )
            directory_create(dir);
        // Ensure screenshots are not overridden
        while ( file_exists(dir + "/shot_" + string_replace_all(string_format(screenshot_count,4,0)," ","0") + ".png") )
            screenshot_count += 1;
            
        // Save the current screen
        var filename = "shot_" + string_replace_all(string_format(screenshot_count,4,0)," ","0") + ".png";
        surface_save(surf_game, working_directory + "/" + filename);
        screenshot_count += 1;
    }
}

