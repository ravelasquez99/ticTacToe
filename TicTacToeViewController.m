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
@property int currentRound;
@property UIImage *blueX;
@property UIImage *redO;

@end

@implementation TicTacToeViewController
NSString *xIsUp = @"X is up!";
NSString *OIsUp = @"O is up!";

- (void)viewDidLoad {
    [super viewDidLoad];
    //set current player turn to have x starting
    [self gameReset];
    self.redO = [UIImage imageNamed:@"redO"];
    self.blueX = [UIImage imageNamed:@"blueX"];

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

//method call to show the winner
-(void)showWinner:(NSString *)winner{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: [NSString stringWithFormat:@"%@ won the game!", winner] message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {[self gameReset];
                                                          }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark KEVIN's CHANGES

- (IBAction)buttonPressed:(UIButton *)sender {
    if (self.xIsCurrentTurn) {
        [self.button1 setImage:self.blueX forState:UIControlStateNormal];
        sender.enabled = NO;
        [self roundCounter];
        [self changePlayerTurn];
//        if (self.anyWinner) {
//            [self showWinner:@"X"];
//        }
    }else {
        [self.button1 setTitle:@"O:" forState:UIControlStateNormal];
        sender.enabled = NO;
        [self roundCounter];
        [self changePlayerTurn];
//        if (self.anyWinner) {
//            [self showWinner:@"O"];
//        }
    }
}


// round checker. to see what round we are on out of 9
-(void)roundCounter{
    self.currentRound++;
}



// game reset
-(void)gameReset {
    [self.button1 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b1");
    [self.button2 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b2");
    [self.button3 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b3");
    [self.button4 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b4");
    [self.button5 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b5");
    [self.button6 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b6");
    [self.button7 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b7");
    [self.button8 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b8");
    [self.button9 setTitle:nil forState:UIControlStateNormal];
    NSLog(@"b9");

    self.button1.enabled = YES;
    self.button2.enabled = YES;
    self.button3.enabled = YES;
    self.button4.enabled = YES;
    self.button5.enabled = YES;
    self.button6.enabled = YES;
    self.button7.enabled = YES;
    self.button8.enabled = YES;
    self.button9.enabled = YES;

    self.xIsCurrentTurn = YES;
    self.currentTurnLabel.text = xIsUp;
    self.currentRound = 0; //setting the round counter to 0 when starting the game
    NSLog(@"gameReset");
}


// after every round, call this method to double check if we have a winner or not
-(BOOL)anyWinner{
    //need to add something here to prevent empty boxes setting this to true. ie. when roundCount is at least 5 (since it takes 5 turns before someone can actually win)
    NSString *titleLabelText = [NSString new] ;
    titleLabelText = self.button1.titleLabel.text;
    
    NSLog(@"%@", titleLabelText);

    
    
    //if Button 1 is NOT empty, look for winners involving button 1
    if (self.button1.titleLabel.text != nil){
        //top row
        if (((self.button1.titleLabel.text == self.button2.titleLabel.text) && (self.button1.titleLabel.text == self.button3.titleLabel.text)) ||
            //left column
             ((self.button1.titleLabel.text == self.button4.titleLabel.text) && (self.button1.titleLabel.text == self.button7.titleLabel.text))) {
            NSLog(@"button 1 calc");
            return YES;
        }
    }
    
    
    //if Button 5 is NOT empty, look for winners involving button 5
    else if (self.button5.titleLabel.text != nil){
        //middle column
        if (((self.button5.titleLabel.text == self.button2.titleLabel.text) && (self.button5.titleLabel.text == self.button8.titleLabel.text)) ||
            //middle row
            ((self.button5.titleLabel.text == self.button4.titleLabel.text) && (self.button5.titleLabel.text == self.button6.titleLabel.text)) ||
            //1 to 9 diagonal
            ((self.button5.titleLabel.text == self.button1.titleLabel.text) && (self.button5.titleLabel.text == self.button9.titleLabel.text)) ||
            //3 to 7 diagonal
            ((self.button5.titleLabel.text == self.button3.titleLabel.text) && (self.button5.titleLabel.text == self.button7.titleLabel.text))) {
            NSLog(@"button 5 calc");
            return YES;

        }
    }
    
    
    //if Button 9 is NOT empty, look for winners involving button 9
    else if (self.button9.titleLabel.text != nil){
        //bottom row
        if (((self.button9.titleLabel.text == self.button8.titleLabel.text) && (self.button9.titleLabel.text == self.button7.titleLabel.text)) ||
            //right column
            ((self.button9.titleLabel.text == self.button6.titleLabel.text) && (self.button9.titleLabel.text == self.button3.titleLabel.text))) {
            NSLog(@"button 9 calc");
            return YES;
        }
    }
    

    // if all the possible combinations to win above aren't TRUE and we are at the roundCounter of 9, assume it is a tie.
    else if (self.currentRound == 9) {
        [self showWinner:@"It's a tie. Nobody"];
        return NO;
    }
    
    return NO;
}




@end
