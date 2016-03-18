//
//  TicTacToeViewController.m
//  ticTacToe
//
//  Created by Richard Velazquez on 3/17/16.
//  Copyright © 2016 Richard Velazquez. All rights reserved.
//

#import "TicTacToeViewController.h"

@interface TicTacToeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UILabel *currentTurnLabel;

@property (weak, nonatomic) IBOutlet UILabel *winnerOrTieLabel;
@property BOOL xIsCurrentTurn;


@end

@implementation TicTacToeViewController
NSString *xIsUp = @"X is up!";
NSString *OIsUp = @"O is up!";

- (void)viewDidLoad {
    [super viewDidLoad];
    //set current player turn to have x starting
    self.xIsCurrentTurn = YES;
    self.currentTurnLabel.text = xIsUp;

}

//created a method to change the player turn
-(void) changePlayerTurn {
    if (self.xIsCurrentTurn) {
        self.xIsCurrentTurn = NO;
        self.currentTurnLabel.text = OIsUp;
    } else {
        self.xIsCurrentTurn = YES;
        self.currentTurnLabel.text = xIsUp;

    }
}

-(void)showWinner:(NSString *)winner{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: [NSString stringWithFormat:@"%@ won the game!", winner] message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(BOOL)anyWinner{
    
    //need to add something here to prevent empty boxes setting this to true. ie. when roundCount is at least 5 (since it takes 5 turns before someone can actually win)
    if (
        
        //top row
        ((self.button1.titleLabel.text == self.button2.titleLabel.text) && (self.button1.titleLabel.text == self.button3.titleLabel.text)) ||
        //middle row
        ((self.button5.titleLabel.text == self.button4.titleLabel.text) && (self.button5.titleLabel.text == self.button6.titleLabel.text)) ||
        //bottom row
        ((self.button9.titleLabel.text == self.button8.titleLabel.text) && (self.button9.titleLabel.text == self.button7.titleLabel.text)) ||
        
        //middle column
        ((self.button5.titleLabel.text == self.button2.titleLabel.text) && (self.button5.titleLabel.text == self.button8.titleLabel.text)) ||
        //left column
        ((self.button1.titleLabel.text == self.button4.titleLabel.text) && (self.button1.titleLabel.text == self.button7.titleLabel.text)) ||
        //right column
        ((self.button9.titleLabel.text == self.button6.titleLabel.text) && (self.button9.titleLabel.text == self.button3.titleLabel.text)) ||
        
        //1 to 9 diagonal
        ((self.button5.titleLabel.text == self.button1.titleLabel.text) && (self.button5.titleLabel.text == self.button9.titleLabel.text)) ||
        //3 to 7 diagonal
        ((self.button5.titleLabel.text == self.button3.titleLabel.text) && (self.button5.titleLabel.text == self.button7.titleLabel.text))
        ) {
        return YES;
    }
    return NO;
}




@end
