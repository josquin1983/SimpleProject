//
//  Game.m
//  SimpleProject
//
//  Created by MacBook Pro on 30.04.2020.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

#import "Game.h"

@interface Game()

@end

@implementation Game

-(Game*)init {
    
    if (self = [super init]) {
        
        self.number = arc4random_uniform(20);
        
        self.tries = 0;
        
    }
    
    return self;
    
}

- (void)incTry {
    
    self.tries++;
    
}

@end
