//
//  CCFactory.m
//  Pirate Adventure
//
//  Created by Satinder Singh on 9/2/14.
//  Copyright (c) 2014 games. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

// return an array with 4 elements that each contain an array
// each sub array consists of 3 CCTile objects
-(NSArray *)tiles
{
    NSMutableArray *firstCol = [[NSMutableArray alloc] init];
    NSMutableArray *secondCol = [[NSMutableArray alloc] init];
    NSMutableArray *thirdCol = [[NSMutableArray alloc] init];
    NSMutableArray *fourthCol = [[NSMutableArray alloc] init];

    CCTile *tile1 = [[CCTile alloc] init];
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    
    CCTile *tile2 = [[CCTile alloc] init];
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    CCTile *tile3 = [[CCTile alloc] init];
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    
    CCTile *tile4 = [[CCTile alloc] init];
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    
    CCTile *tile5 = [[CCTile alloc] init];
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
    CCTile *tile6 = [[CCTile alloc] init];
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    
    CCTile *tile7 = [[CCTile alloc] init];
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    
    CCTile *tile8 = [[CCTile alloc] init];
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    
    CCTile *tile9 = [[CCTile alloc] init];
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    
    CCTile *tile10 = [[CCTile alloc] init];
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    
    CCTile *tile11 = [[CCTile alloc] init];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    
    CCTile *tile12 = [[CCTile alloc] init];
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    
    tile1.actionbuttonName = @"Take the sword";
    CCWeapon *bluntedSword = [[CCWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    
    tile2.actionbuttonName = @"Take steel armor";
    CCArmor *steelArmor = [[CCArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    
    tile3.actionbuttonName = @"Stop at the Dock";
    tile3.healthState = 12;
    
    tile4.actionbuttonName = @"Adopt Parrot";
    CCArmor *parrotArmor = [[CCArmor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot Armor";
    tile4.armor = parrotArmor;
    
    tile5.actionbuttonName = @"Take pistol";
    CCWeapon *pistolWeapon = [[CCWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.weapon = pistolWeapon;
    
    tile6.actionbuttonName = @"Show no fear!";
    tile6.healthState = -22;
    
    tile7.actionbuttonName = @"Fight those scum!";
    tile7.healthState = 8;
    
    tile8.actionbuttonName = @"Abandon Ship";
    tile8.healthState = -46;
    
    tile9.actionbuttonName = @"Take Treasurer";
    tile9.healthState = 20;
    
    tile10.actionbuttonName = @"Repel the invaders";
    tile10.healthState = -15;
    
    tile11.actionbuttonName = @"Swim deeper";
    tile11.healthState = -7;
    
    tile12.actionbuttonName = @"Fight!";
    tile12.healthState = -15;
    
    [firstCol addObject:tile1];
    [firstCol addObject:tile2];
    [firstCol addObject:tile3];
 
    [secondCol addObject:tile4];
    [secondCol addObject:tile5];
    [secondCol addObject:tile6];
    
    [thirdCol addObject:tile7];
    [thirdCol addObject:tile8];
    [thirdCol addObject:tile9];
    
    [fourthCol addObject:tile10];
    [fourthCol addObject:tile11];
    [fourthCol addObject:tile12];
    
    return [[NSArray alloc] initWithObjects:firstCol, secondCol, thirdCol, fourthCol, nil];
}

-(CCCharacter *)character // name of function is character
{
    CCCharacter *character = [[CCCharacter alloc] init];
    character.health = 100;
    CCArmor *cloackAmor = [[CCArmor alloc] init];
    
    cloackAmor.name = @"Cloak";
    cloackAmor.health = 5;
    character.armor = cloackAmor;
    
    CCWeapon *fistWeapon = [[CCWeapon alloc] init];
    fistWeapon.name = @"Fists of Fury";
    fistWeapon.damage = 10;
    character.weapon = fistWeapon;
    
    return character;
}

-(CCBoss *)boss
{
    CCBoss *boss = [[CCBoss alloc] init];
    boss.health = 65;
    return boss;
}
@end
