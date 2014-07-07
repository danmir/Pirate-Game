//
//  Factory.h
//  Udemy_5(Pirate_adventure)
//
//  Created by Danil Mironov on 29.06.14.
//  Copyright (c) 2014 Danil Mironov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"

@interface Factory : NSObject

-(NSArray *)tiles;
-(Character *)character;
-(Boss *) boss;

@end
