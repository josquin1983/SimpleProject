//
//  ViewController.m
//  SimpleProject
//
//  Created by MacBook Pro on 30.04.2020.
//  Copyright © 2020 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

#import "Game.h"

#import <UIKit/UIKit.h>

@interface ViewController ()

#pragma mark: outlets

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *lbl;

@property (weak, nonatomic) IBOutlet UITextField *txt;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

#pragma mark: props

@property (strong, nonatomic) Game *game;

@end

@implementation ViewController

- (IBAction)onButtonTapped:(UIButton *)sender {
    
    unsigned result = [self.txt.text intValue];
    
    if ([self.txt.text isEqualToString:@""]) {
        
        [self.lbl setText:@"ВЫ НЕ ВВЕЛИ ЧИСЛО!!!"];
        
    }
    
    if (!result) {
        
        [self.lbl setText:@"ВЫ ВВЕЛИ НЕ ЧИСЛО!!!"];
        
    }
    
    if (result == self.game.number) {

         [self.lbl setText:@"УРА! ПОБЕДА!!! ДЛЯ ПРОДОЛЖЕНИЯ СДЕЛАЙТЕ СВАЙП ВНИЗ."];
        
    } else {
        
        [self.lbl setText:@"НЕ УГАДАЛИ!!!"];
        
        [self.game incTry];
        
        self.btn.titleLabel.text = [NSString stringWithFormat:@"Попытка №%d", self.game.tries];
        
    }
    
    
    
}

-(void)setup {
    
    self.game = [[Game alloc] init];
    
    [self.game incTry];
    
    NSLog(@"%d", self.game.number);
    
    
}

-(void)showMessage {
    
    [self setup];
    
    self.btn.titleLabel.text = [NSString stringWithFormat:@"Попытка №1"];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message: @"ИГРА НАЧАЛАСЬ!" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self.btn setEnabled: YES];
        
        [self.txt setEnabled: YES];
        
        [self.lbl setText: @"ВВЕДИТЕ ЧИСЛО ОТ 1 ДО 20"];
        
    }];
    
    [alert addAction:ok];
    
    [self presentViewController: alert animated: YES completion: nil];
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.btn.layer.cornerRadius = self.btn.frame.size.height / 3;
    
    [self.btn setEnabled: NO];
    
    [self.txt setEnabled: NO];
    
    // tap gesture
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMessage)];
                                                                                                        
    tap.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer: tap];
    
    // swipe gestrure
    
    UISwipeGestureRecognizer *swipdown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showMessage)];
    
    swipdown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:swipdown];
    
}


@end
