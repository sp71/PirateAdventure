//
//  CCCharacter.h
//  Pirate Adventure
//
//  Created by Satinder Singh on 9/2/14.
//  Copyright (c) 2014 games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCCharacter : NSObject

@property (nonatomic) int damage;
@property (nonatomic) int health;
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCWeapon *weapon;

@end
