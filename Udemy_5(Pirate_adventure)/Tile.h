//
//  Tile.h
//  Udemy_5(Pirate_adventure)
//
//  Created by Danil Mironov on 27.06.14.
//  Copyright (c) 2014 Danil Mironov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"

@interface Tile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionbuttonName;
@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthEffect;

@end
