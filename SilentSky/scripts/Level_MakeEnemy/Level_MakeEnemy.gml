/// @description Level_MakeEnemy(x,y)
/// @param x
/// @param y
var tx = argument0;
var ty = argument1;
var enemy = enemyTest;

// If beyond starting area, spawn different types of enemies
if ( levelManager.lvAreaCount > 0 )
{   
    // Replace with a fast one instead
    if ( random(1.0) < levelManager.lvAreaCount * 0.20 )
    {   // Multiply that chance by 66%
        if ( choose(0,1,1) )
        {
            enemy = enemyMonster1;
        }
    }
}

enemy = place_unique( tx, ty, enemy );
if ( iexists(enemy) )
{
    // Start to strengthen enemies (10% health each area)
    enemy.chMaxHealth += floor(levelManager.lvAreaCount * enemy.chMaxHealth * 0.1);
    enemy.chHealth = enemy.chMaxHealth;
    // 20% damage each area
    enemy.moAtkDamage0 += floor(levelManager.lvAreaCount * enemy.moAtkDamage0 * 0.2);
    enemy.moAtkDamage1 += floor(levelManager.lvAreaCount * enemy.moAtkDamage1 * 0.2);
}

return enemy;

