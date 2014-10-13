//
//  CCArmor.h
//  Pirate Adventure
//
//  Created by Satinder Singh on 9/2/14.
//  Copyright (c) 2014 games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCArmor : NSObject

@property(strong, nonatomic) NSString *name;
@property(nonatomic) int health; // primitives are not objects. reason for no strong.

@end
