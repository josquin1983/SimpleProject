//
//  ViewController.m
//  SimpleProject
//
//  Created by MacBook Pro on 30.04.2020.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

#import "Game.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *lbl;

@property (weak, nonatomic) IBOutlet UITextField *txt;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation ViewController

-(void)setup {
    
    Game *game = [[Game alloc] init];
    
    NSLog(@"%d", game.number);
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.btn.layer.cornerRadius = self.btn.frame.size.height / 3;
    
    [self setup];
    
    
}


@end
