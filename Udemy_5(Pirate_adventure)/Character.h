//
//  Character.h
//  Udemy_5(Pirate_adventure)
//
//  Created by Danil Mironov on 30.06.14.
//  Copyright (c) 2014 Danil Mironov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject

@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
