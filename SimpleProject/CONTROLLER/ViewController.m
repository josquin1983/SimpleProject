
//  Copyright © 2020 MacBook Pro. All rights reserved.


#import "ViewController.h"

#import "Game.h"

#import <UIKit/UIKit.h>



@interface ViewController ()

#pragma mark: outlets

@property (weak, nonatomic) IBOutlet UIButton *btn;

@property (weak, nonatomic) IBOutlet UILabel *lbl;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;


#pragma mark: props

@property (strong, nonatomic) Game *game;

@property (strong, nonatomic) NSArray *arr;

@property (strong, nonatomic) UISwipeGestureRecognizer *swipedown;

@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation ViewController

#pragma mark: picker's data source methods

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [self.arr count];
    
}

#pragma mark: picker's delegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return  [NSString stringWithFormat: @"%@", self.arr[row]];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    [self.lbl setText: [NSString stringWithFormat: @"ВЫ ВЫБРАЛИ ЧИСЛО %@!", self.arr[row]]];
    
    [self.btn setHidden: NO];
    
}


#pragma mark: IBAction


- (IBAction)onButtonTapped:(UIButton *)sender {
    
    
    NSInteger selectedRow = [self.picker selectedRowInComponent: 0];
    
                       
    if ((selectedRow + 1) == self.game.number) {
        
        [self.lbl setText: [NSString stringWithFormat: @"УРА! ПОБЕДА!!! ВЫ УГАДАЛИ ЧИСЛО ЗА %d ПОПЫТ%@. ДЛЯ НОВОЙ ИГРЫ СДЕЛАЙТЕ СВАЙП ВНИЗ.", self.game.tries, [self postfixAtNumber: self.game.tries]]];
        
        [self.lbl setBackgroundColor: UIColor.purpleColor];
        
        [self.btn setHidden: YES];
        
        [self.picker setHidden: YES];
        
        [self.swipedown setEnabled: YES];
        
    } else {
        
        [self.lbl setText: [NSString stringWithFormat:@"ПОПЫТКА №%d: НЕ УГАДАЛИ!!!", self.game.tries]];
        
        [self.game incTry];
        
    }
    
    
}

#pragma mark: others

-(void)setupNewGame {
    
    self.game = [[Game alloc] init];
    
    [self.game incTry];
    
    NSLog(@"%d", self.game.number);
    
    [self.lbl setBackgroundColor: UIColor.clearColor];
    
    [self.swipedown setEnabled: NO];
    
    [self.tap setEnabled: NO];

    
}



-(void)showMessage {
    
    [self setupNewGame];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message: @"ИГРА НАЧАЛАСЬ!" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
         [self.picker setHidden: NO];
        
        [self.picker selectRow: 0 inComponent: 0 animated: YES];
        
        [self.lbl setText: [NSString stringWithFormat: @"ВЫ ВЫБРАЛИ ЧИСЛО %@!", @1]];
        
        [self.lbl setText: @"ВЫБЕРИТЕ ЧИСЛО ОТ 1 ДО 15"];
        
    }];
    
    [alert addAction:ok];
    
    [self presentViewController: alert animated: YES completion: nil];
    
}

-(NSString*)postfixAtNumber: (NSInteger) num {
    
    switch (num) {
        case 1:
            return @"КУ";
            
            break;
            
        case 2:
        case 3:
        case 4:
            return @"КИ";
            
            break;
            
        default:
            return @"ОК";
            
            break;
    }
    
    
}

- (void)setupGestures {
    
    //tap gesture
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(showMessage)];
    
    self.tap.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer: self.tap];
    
    // swipe gestrure
    
    self.swipedown = [[UISwipeGestureRecognizer alloc] initWithTarget: self action:@selector(showMessage)];
    
    self.swipedown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer: self.swipedown];
}

#pragma mark: viewDidLoad method

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // literal's array
    
   self.arr = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15];
    
    // setting up picker's datasource & delegate
    
    self.picker.dataSource = self;
    
    self.picker.delegate = self;
    
    // outlets configuration
    
    self.btn.layer.cornerRadius = self.btn.frame.size.height / 4;
    
    [self.btn setHidden: YES];
    
    [self.picker setHidden: YES];
    
    // gestures
    
    [self setupGestures];
    
}



@end
