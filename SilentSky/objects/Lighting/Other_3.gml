if (surface_exists(surf_lighting))
{
    surface_free(surf_lighting);
    surf_lighting = null;
}
if (surface_exists(surf_lighting_game))
{
    surface_free(surf_lighting_game);
    surf_lighting_game = null;
}

idelete(this);

