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



    



@end
