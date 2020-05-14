
//  Copyright © 2020 MacBook Pro. All rights reserved.


#import <Foundation/Foundation.h>



@interface Game : NSObject

@property unsigned number;

@property unsigned tries;

-(Game*)init;

-(void)incTry;

@end


