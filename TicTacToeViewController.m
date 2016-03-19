//
//  TicTacToeViewController.m
//  ticTacToe
//
//  Created by Richard Velazquez on 3/17/16.
//  Copyright © 2016 Richard Velazquez. All rights reserved.
//
#pragma Top of file
#import "TicTacToeViewController.h"


@interface TicTacToeViewController ()

#pragma properties - buttons
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;
@property (weak, nonatomic) IBOutlet UIButton *button11;
@property (weak, nonatomic) IBOutlet UIButton *button12;
@property (weak, nonatomic) IBOutlet UIButton *button13;
@property (weak, nonatomic) IBOutlet UIButton *button14;
@property (weak, nonatomic) IBOutlet UIButton *button15;
@property (weak, nonatomic) IBOutlet UIButton *button16;
@property (weak, nonatomic) IBOutlet UIButton *button17;
@property (weak, nonatomic) IBOutlet UIButton *button18;
@property (weak, nonatomic) IBOutlet UIButton *button19;
@property (weak, nonatomic) IBOutlet UIButton *button20;
@property (weak, nonatomic) IBOutlet UIButton *button21;
@property (weak, nonatomic) IBOutlet UIButton *button22;
@property (weak, nonatomic) IBOutlet UIButton *button23;
@property (weak, nonatomic) IBOutlet UIButton *button24;
@property (weak, nonatomic) IBOutlet UIButton *button25;


#pragma labels and other properties
@property (weak, nonatomic) IBOutlet UILabel *currentTurnLabel;
@property (weak, nonatomic) IBOutlet UILabel *winnerOrTieLabel;
@property BOOL xIsCurrentTurn;
@property int currentRound;
@property UIImage *blueX;
@property UIImage *redO;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameselectedOutlet;

@end

@implementation TicTacToeViewController
NSString *xIsUp = @"X is up!";
NSString *OIsUp = @"O is up!";


- (void)viewDidLoad {
    [super viewDidLoad];
    //set current player turn to have x starting
    [self.gameselectedOutlet setSelectedSegmentIndex:0];
    self.redO = [UIImage imageNamed:@"redO"];
    self.blueX = [UIImage imageNamed:@"blueX"];
    [self gameSelected:self.gameselectedOutlet];

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
    
    
    //if player is x
    if (self.xIsCurrentTurn) {
        
        
        [sender setTitle:@"X" forState:UIControlStateNormal];
        
        //get back out
        
        [sender titleForState:[sender state]];
        
        //changesTurn
        
        self.xIsCurrentTurn = NO;
        
        // if player is O
    }else {
      
        
        [sender setTitle:@"O" forState:UIControlStateNormal];
        
        //get back out
        
        [sender titleForState:[sender state]];
        
        //changesTurn
        
        self.xIsCurrentTurn = YES;
    }
}


// round checker. to see what round we are on out of 9
-(void)roundCounter{
    self.currentRound++;
}



// game reset
-(void)gameReset {
//    [self.button1 setTitle:nil forState:UIControlStateNormal];
//    [self.button2 setTitle:nil forState:UIControlStateNormal];
//    [self.button3 setTitle:nil forState:UIControlStateNormal];
//    [self.button4 setTitle:nil forState:UIControlStateNormal];
//    [self.button5 setTitle:nil forState:UIControlStateNormal];
//    [self.button6 setTitle:nil forState:UIControlStateNormal];
//    [self.button7 setTitle:nil forState:UIControlStateNormal];
//    [self.button8 setTitle:nil forState:UIControlStateNormal];
//    [self.button9 setTitle:nil forState:UIControlStateNormal];
//    [self.button10 setTitle:nil forState:UIControlStateNormal];
//    [self.button11 setTitle:nil forState:UIControlStateNormal];
//    [self.button12 setTitle:nil forState:UIControlStateNormal];
//    [self.button13 setTitle:nil forState:UIControlStateNormal];
//    [self.button14 setTitle:nil forState:UIControlStateNormal];
//    [self.button15 setTitle:nil forState:UIControlStateNormal];
//    [self.button16 setTitle:nil forState:UIControlStateNormal];
//    [self.button17 setTitle:nil forState:UIControlStateNormal];
//    [self.button18 setTitle:nil forState:UIControlStateNormal];
//    [self.button19 setTitle:nil forState:UIControlStateNormal];
//    [self.button20 setTitle:nil forState:UIControlStateNormal];
//    [self.button21 setTitle:nil forState:UIControlStateNormal];
//    [self.button22 setTitle:nil forState:UIControlStateNormal];
//    [self.button23 setTitle:nil forState:UIControlStateNormal];
//    [self.button24 setTitle:nil forState:UIControlStateNormal];
//    [self.button25 setTitle:nil forState:UIControlStateNormal];
    
  

//    self.button1.enabled = YES;
//    self.button2.enabled = YES;
//    self.button3.enabled = YES;
//    self.button4.enabled = YES;
//    self.button5.enabled = YES;
//    self.button6.enabled = YES;
//    self.button7.enabled = YES;
//    self.button8.enabled = YES;
//    self.button9.enabled = YES;
//    self.button10.enabled = YES;
//    self.button11.enabled = YES;
//    self.button12.enabled = YES;
//    self.button13.enabled = YES;
//    self.button14.enabled = YES;
//    self.button15.enabled = YES;
//    self.button16.enabled = YES;
//    self.button17.enabled = YES;
//    self.button18.enabled = YES;
//    self.button19.enabled = YES;
//    self.button20.enabled = YES;
//    self.button21.enabled = YES;
//    self.button22.enabled = YES;
//    self.button23.enabled = YES;
//    self.button24.enabled = YES;
//    self.button25.enabled = YES;
// 

    self.xIsCurrentTurn = YES;
    self.currentTurnLabel.text = xIsUp;
    self.currentRound = 0; //setting the round counter to 0 when starting the game
    NSLog(@"gameReset");
}


// after every round, call this method to double check if we have a winner or not
-(BOOL)anyWinner{
    //need to add something here to prevent empty boxes setting this to true. ie. when roundCount is at least 5 (since it takes 5 turns before someone can actually win)
//    NSString *titleLabelText = [NSString new] ;
//    titleLabelText = self.button1.titleLabel.text;
//    
//    NSLog(@"%@", titleLabelText);
//
//    
//    //if Button 1 is NOT empty, look for winners involving button 1
//    if (self.button1.titleLabel.text != nil){
//        //top row
//        (([self.button1.titleLabel.text isEqualToString: self.button2.titleLabel.text]) && ([self.button1.titleLabel.text isEqualToString: self.button3.titleLabel.text])) ||
//        //middle row
//        (([self.button5.titleLabel.text isEqualToString: self.button4.titleLabel.text]) && ([self.button5.titleLabel.text isEqualToString: self.button6.titleLabel.text])) ||
//        //bottom row
//        (([self.button9.titleLabel.text isEqualToString: self.button8.titleLabel.text]) && ([self.button9.titleLabel.text isEqualToString: self.button7.titleLabel.text])) ||
//        
//        //middle column
//        (([self.button5.titleLabel.text isEqualToString: self.button2.titleLabel.text]) && ([self.button5.titleLabel.text isEqualToString: self.button8.titleLabel.text])) ||
//        //left column
//        (([self.button1.titleLabel.text isEqualToString:self.button4.titleLabel.text]) && ([self.button1.titleLabel.text isEqualToString:self.button7.titleLabel.text])) ||
//        //right column
//        (([self.button9.titleLabel.text isEqualToString: self.button6.titleLabel.text]) && ([self.button9.titleLabel.text isEqualToString:self.button3.titleLabel.text])) ||
//        
//        //1 to 9 diagonal
//        (([self.button5.titleLabel.text isEqualToString: self.button1.titleLabel.text]) && ([self.button5.titleLabel.text isEqualToString:self.button9.titleLabel.text])) ||
//        //3 to 7 diagonal
//        (([self.button5.titleLabel.text isEqualToString:self.button3.titleLabel.text]) && ([self.button5.titleLabel.text isEqualToString:self.button7.titleLabel.text]));
//         {
//        return YES;
//         }}
//    
//    
//    //if Button 9 is NOT empty, look for winners involving button 9
//    else if (self.button9.titleLabel.text != nil){
//        //bottom row
//        if (((self.button9.titleLabel.text == self.button8.titleLabel.text) && (self.button9.titleLabel.text == self.button7.titleLabel.text)) ||
//            //right column
//            ((self.button9.titleLabel.text == self.button6.titleLabel.text) && (self.button9.titleLabel.text == self.button3.titleLabel.text))) {
//            NSLog(@"button 9 calc");
//            return YES;
//        }
//    }
//    
//
//    // if all the possible combinations to win above aren't TRUE and we are at the roundCounter of 9, assume it is a tie.
//    else if (self.currentRound == 9) {
//        [self showWinner:@"It's a tie. Nobody"];
//        return NO;
//    }
//    
//    return NO;
//}
    
    NSLog(@"any winner called");
    return NO;
    
}

#pragma game settings method



- (IBAction)gameSelected:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self threeByThreeGame];
    } else if (sender.selectedSegmentIndex == 1) {
        [self fourByFourGame];
    } else {
        [self fiveByFiveGame];
    }
}



-(void)threeByThreeGame {
    [self gameReset];
    
    //enabled + appeared buttons
    [self.button1 setEnabled:YES];
    [self.button1 setHidden:NO];
    
    [self.button2 setEnabled:YES];
    [self.button2 setHidden:NO];
    
    [self.button3 setEnabled:YES];
    [self.button3 setHidden:NO];
    
    [self.button6 setEnabled:YES];
    [self.button6 setHidden:NO];
    
    [self.button7 setEnabled:YES];
    [self.button7 setHidden:NO];
    
    [self.button8 setEnabled:YES];
    [self.button8 setHidden:NO];
    
    [self.button11 setEnabled:YES];
    [self.button9 setHidden:NO];
    
    [self.button12 setEnabled:YES];
    [self.button12 setHidden:NO];
    
    [self.button13 setEnabled:YES];
    [self.button13 setHidden:NO];
    
    
    
    //disabled buttons + hidden buttons
    [self.button4 setHidden:YES];
    [self.button4 setEnabled:NO];
    
    [self.button5 setHidden:YES];
    [self.button5 setEnabled:NO];
    
    [self.button9 setHidden:YES];
    [self.button9 setEnabled:NO];
    
    [self.button10 setHidden:YES];
    [self.button10 setEnabled:NO];
    
    [self.button14 setHidden:YES];
    [self.button14 setEnabled:NO];
    
    [self.button15 setHidden:YES];
    [self.button15 setEnabled:NO];
    
    [self.button16 setHidden:YES];
    [self.button16 setEnabled:NO];
    
    [self.button17 setHidden:YES];
    [self.button17 setEnabled:NO];
    
    [self.button18 setHidden:YES];
    [self.button18 setEnabled:NO];
    
    
    [self.button19 setHidden:YES];
    [self.button19 setEnabled:NO];
    
    [self.button20 setHidden:YES];
    [self.button20 setEnabled:NO];
    
    [self.button24 setHidden:YES];
    [self.button24 setEnabled:NO];
    
    [self.button21 setHidden:YES];
    [self.button21 setEnabled:NO];
    
    [self.button22 setHidden:YES];
    [self.button22 setEnabled:NO];
    
    [self.button23 setHidden:YES];
    [self.button23 setEnabled:NO];
    
    [self.button25 setHidden:YES];
    [self.button25 setEnabled:NO];
    
    
}

-(void)fourByFourGame {
    [self gameReset];
    
    //enabled + appeared buttons
    [self.button1 setEnabled:YES];
    [self.button1 setHidden:NO];
    
    [self.button2 setEnabled:YES];
    [self.button2 setHidden:NO];
    
    [self.button3 setEnabled:YES];
    [self.button3 setHidden:NO];
    
    [self.button4 setEnabled:YES];
    [self.button4 setHidden:NO];

    
    [self.button6 setEnabled:YES];
    [self.button6 setHidden:NO];
    
    [self.button7 setEnabled:YES];
    [self.button7 setHidden:NO];
    
    [self.button8 setEnabled:YES];
    [self.button8 setHidden:NO];
    
    [self.button9 setEnabled:YES];
    [self.button9 setHidden:NO];

    [self.button11 setEnabled:YES];
    [self.button11 setHidden:NO];
    
    [self.button12 setEnabled:YES];
    [self.button12 setHidden:NO];
    
    [self.button13 setEnabled:YES];
    [self.button13 setHidden:NO];
    
    [self.button14 setEnabled:YES];
    [self.button14 setHidden:NO];

    
    [self.button16 setEnabled:YES];
    [self.button16 setHidden:NO];
    
    [self.button17 setEnabled:YES];
    [self.button17 setHidden:NO];
    
    [self.button18 setEnabled:YES];
    [self.button18 setHidden:NO];
    
    [self.button19 setEnabled:YES];
    [self.button19 setHidden:NO];

    
    
    
    
    //disabled buttons + hidden buttons
    
    [self.button5 setHidden:YES];
    [self.button5 setEnabled:NO];
    
    
    [self.button10 setHidden:YES];
    [self.button10 setEnabled:NO];
    
    
    [self.button15 setHidden:YES];
    [self.button15 setEnabled:NO];

    
    [self.button20 setHidden:YES];
    [self.button20 setEnabled:NO];
    
    [self.button21 setHidden:YES];
    [self.button21 setEnabled:NO];
    
    [self.button22 setHidden:YES];
    [self.button22 setEnabled:NO];
    
    [self.button23 setHidden:YES];
    [self.button23 setEnabled:NO];
    
    [self.button24 setHidden:YES];
    [self.button24 setEnabled:NO];
    
    [self.button25 setHidden:YES];
    [self.button25 setEnabled:NO];
    
}

-(void)fiveByFiveGame {
    [self gameReset];
    
    //enabled + appeared buttons
    [self.button1 setEnabled:YES];
    [self.button1 setHidden:NO];
    
    [self.button2 setEnabled:YES];
    [self.button2 setHidden:NO];
    
    [self.button3 setEnabled:YES];
    [self.button3 setHidden:NO];
    
    [self.button4 setEnabled:YES];
    [self.button4 setHidden:NO];
    
    [self.button5 setEnabled:YES];
    [self.button5 setHidden:NO];
    
    [self.button6 setEnabled:YES];
    [self.button6 setHidden:NO];
    
    [self.button7 setEnabled:YES];
    [self.button7 setHidden:NO];
    
    [self.button8 setEnabled:YES];
    [self.button8 setHidden:NO];
    
    [self.button9 setEnabled:YES];
    [self.button9 setHidden:NO];
    
    [self.button10 setEnabled:YES];
    [self.button10 setHidden:NO];
    
    [self.button11 setEnabled:YES];
    [self.button11 setHidden:NO];
    
    [self.button12 setEnabled:YES];
    [self.button12 setHidden:NO];
    
    [self.button13 setEnabled:YES];
    [self.button13 setHidden:NO];
    
    [self.button14 setEnabled:YES];
    [self.button14 setHidden:NO];
    
    [self.button15 setEnabled:YES];
    [self.button15 setHidden:NO];
    
    [self.button16 setEnabled:YES];
    [self.button16 setHidden:NO];
    
    [self.button17 setEnabled:YES];
    [self.button17 setHidden:NO];
    
    [self.button18 setEnabled:YES];
    [self.button18 setHidden:NO];
    
    [self.button19 setEnabled:YES];
    [self.button19 setHidden:NO];
    
    [self.button20 setEnabled:YES];
    [self.button20 setHidden:NO];
    
    [self.button21 setEnabled:YES];
    [self.button21 setHidden:NO];
    
    [self.button22 setEnabled:YES];
    [self.button22 setHidden:NO];
    
    [self.button23 setEnabled:YES];
    [self.button23 setHidden:NO];
    
    [self.button24 setEnabled:YES];
    [self.button24 setHidden:NO];
    
    [self.button25 setEnabled:YES];
    [self.button25 setHidden:NO];
}




@end
