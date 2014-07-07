//
//  Factory.m
//  Udemy_5(Pirate_adventure)
//
//  Created by Danil Mironov on 29.06.14.
//  Copyright (c) 2014 Danil Mironov. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"

@implementation Factory

-(NSArray *)tiles
{
    Tile *tile1 = [[Tile alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage. Take sword";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name = @"Blunted sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionbuttonName = @"Take the sword";
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor ?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    Armor *steelArmor = [[Armor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionbuttonName = @"Take armor";
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions ?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionbuttonName = @"Stop at the dark";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are great defender and are fiercy loyal to their captain !";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg "];
    Armor *parrotArmor = [[Armor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionbuttonName = @"Adopt Parrot";
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol ?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    Weapon *pistolWeapon = [[Weapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 12;
    tile5.actionbuttonName = @"Take Pistol";
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"You have been captured by pirates and aer ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionbuttonName = @"Show no fear";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tile *tile7 = [[Tile alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene ?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 10;
    tile7.actionbuttonName = @"Fight those scum";
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.story = @"The legend of the deep. The mightly kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PiratesOctupusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionbuttonName = @"Abandon ship";
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirates treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 9;
    tile9.actionbuttonName = @"Take treasurer";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tile *tile10 = [[Tile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PiratesAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionbuttonName = @"Repel the invaders";
    
    Tile *tile11 = [[Tile alloc] init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasure2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionbuttonName = @"Swim deeper";
    
    Tile *tile12 = [[Tile alloc] init];
    tile12.story = @"Your final faceoff with fearsome pirate boss!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionbuttonName = @"Fight";
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}

-(Character *)character
{
    Character *character = [[Character alloc] init];
    character.health = 100;
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(Boss *)boss
{
    Boss *boss = [[Boss alloc] init];
    boss.health = 20;
    return boss;
}

@end
