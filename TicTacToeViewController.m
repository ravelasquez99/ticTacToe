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
@property NSMutableArray *xArray;
@property NSMutableArray *oArray;
@property int selectedGame;
@property  NSNumber *plusTenNSNumber;
@property NSNumber *minusTenNSNumber;


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
int countToWin = 3;




- (void)viewDidLoad {
    [super viewDidLoad];
    //set current player turn to have x starting
    [self.gameselectedOutlet setSelectedSegmentIndex:0];
    self.redO = [UIImage imageNamed:@"redO"];
    self.blueX = [UIImage imageNamed:@"blueX"];
    [self gameSelected:self.gameselectedOutlet];
    
    //initializing the x and o arrays
    self.xArray = [NSMutableArray new];
    self.oArray = [NSMutableArray new];
    self.selectedGame = 0;
    
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
                                                          handler:^(UIAlertAction * action) {
                                                              if (countToWin == 3) {
                                                                  [self threeByThreeGame];
                                                              }else if (countToWin ==4){
                                                                  [self fourByFourGame];
                                                              } else {
                                                                  [self fiveByFiveGame];
                                                              }
                                                          }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark KEVIN's CHANGES

- (IBAction)buttonPressed:(UIButton *)sender {
    
    
    //if player is x
    if (self.xIsCurrentTurn) {
        //creates a title string based on the current title string and converts it to an NSInteger so we can put it in the array
        NSString *xTitleString = sender.currentTitle;
        int temp = [xTitleString intValue];
        NSNumber *numberEntered = [NSNumber numberWithInt:temp];
        [self.xArray addObject:numberEntered];
        
       
        
        //get back out
        
        [sender titleForState:[sender state]];
        
        
        //changesTurn
        
        self.xIsCurrentTurn = NO;
        self.currentTurnLabel.text = OIsUp;
        BOOL thereIsAWinner = [self checkWinnerInArray:self.xArray forButtonPressed:numberEntered];
        if (thereIsAWinner) {
            [self showWinner:@"X is the winner"];
        }
        //[sender setImage:[UIImage imageNamed:@"redX"] forState:UIControlStateNormal];
        [sender setTitle:@"X" forState:UIControlStateNormal];
        
        // if player is O
    }else {
        
        //creates a title string based on the current title string and converts it to an NSInteger so we can put it in the array
        NSString *oTitleString = sender.currentTitle;
        int temp = [oTitleString intValue];
        NSNumber *numberEntered = [NSNumber numberWithInt:temp];
        [self.oArray addObject:numberEntered];
         BOOL thereIsAWinner = [self checkWinnerInArray:self.oArray forButtonPressed:numberEntered];
        if (thereIsAWinner) {
            [self showWinner:@"O is the winner"];
        }
       
         //[sender setImage:[UIImage imageNamed:@"blueO"] forState:UIControlStateNormal];
        
        //get back out
        
        [sender titleForState:[sender state]];
        
        
        //changesTurn
        
        self.xIsCurrentTurn = YES;
        self.currentTurnLabel.text = xIsUp;
       
        
         [sender setTitle:@"O" forState:UIControlStateNormal];
    }
    
    [sender setEnabled:NO];
}



// round checker. to see what round we are on out of 9
-(void)roundCounter{
    self.currentRound++;
}

-(BOOL)checkWinnerInArray: (NSMutableArray *)selectedSquares forButtonPressed:(NSNumber*)buttonPressed {
    
    
    //runs a horizontal check
    BOOL horizontalCheck = [self horizontalWinnerCheck:selectedSquares forButtonPressed:buttonPressed];
    if (horizontalCheck) {
        return YES;
    }
    
    //runs a vertical check
    BOOL verticalCheck = [self verticalWinnerCheck:selectedSquares forButtonPressed:buttonPressed];
    if (verticalCheck) {
        return YES;
    }
    
    //runs a diagonal check from top left to bottom right
    BOOL diagonalCheckTopLeftBottomRight = [self diagnolTopLeftToBottomrightCheck:selectedSquares forButtonPressed:buttonPressed];
    if (diagonalCheckTopLeftBottomRight) {
        return YES;
    }
    
    return NO;
}

-(BOOL)horizontalWinnerCheck: (NSMutableArray *)selectedSquares forButtonPressed: (NSNumber *)buttonPressed {
   //getting the row number
    NSString *buttonPressedString = [NSString stringWithFormat:@"%@", buttonPressed];
    unichar lastChar = [buttonPressedString characterAtIndex:[buttonPressedString length] - 1];
    NSString *characterLast = [NSString stringWithFormat:@"%c", lastChar];
    int numberChecked = [characterLast intValue] + 10;
    NSNumber *numberCheckedNS = [NSNumber numberWithInt:numberChecked];
    
    //runs through the array and checks if the numbers in the row are in the array
    for (int i = 0; i <= countToWin - 1; i++) {
        if ([selectedSquares containsObject:numberCheckedNS]){
            numberChecked = numberChecked + 10;
            numberCheckedNS = [NSNumber numberWithInt:numberChecked];
        
        }
        else {
            return NO;
        }
    }
    
    
    return YES;
}

-(BOOL)verticalWinnerCheck: (NSMutableArray *)selectedSquares forButtonPressed: (NSNumber *)buttonPressed {
    NSString *buttonPressedString = [NSString stringWithFormat:@"%@", buttonPressed];
    unichar lastChar = [buttonPressedString characterAtIndex:[buttonPressedString length] - 2];
    NSString *characterFirst= [NSString stringWithFormat:@"%c", lastChar];
    int numberChecked = ([characterFirst intValue] * 10) + 1;
    NSNumber *numberCheckedNS = [NSNumber numberWithInt:numberChecked];

    
    for (int i = 0; i <= countToWin -1; i++) {
        if ([selectedSquares containsObject:numberCheckedNS]) {
            numberChecked = numberChecked + 1;
            numberCheckedNS = [NSNumber numberWithInt:numberChecked];
        }else {
            return NO;
        }}
        
        return YES;
    
    //runs through the array and checks if the numbers in the row are in the array
}

-(BOOL)diagnolTopLeftToBottomrightCheck: (NSMutableArray *)selectedSquares forButtonPressed: (NSNumber *)buttonPressed {
    int numberChecked = 11;
    NSNumber *numberCheckedNS = [NSNumber numberWithInt:numberChecked];
    
    
    for (int i = 0; i <= countToWin -1; i++) {
        if ([selectedSquares containsObject:numberCheckedNS]) {
            NSLog(@"%@ was checked",numberCheckedNS);
            NSLog(@"%@", selectedSquares);
            numberChecked = numberChecked + 11;
            numberCheckedNS = [NSNumber numberWithInt:numberChecked];

        }else {
            return NO;
        }}
    
    return YES;
    

    
}



// game reset
-(void)gameReset {
    
    self.xArray = [NSMutableArray new];
    self.oArray = [NSMutableArray new];
    
    [self.button1 setTitle:@"11" forState:UIControlStateNormal];
    [self.button2 setTitle:@"21" forState:UIControlStateNormal];
    [self.button3 setTitle:@"31" forState:UIControlStateNormal];
    [self.button4 setTitle:@"41" forState:UIControlStateNormal];
    [self.button5 setTitle:@"51" forState:UIControlStateNormal];
    [self.button6 setTitle:@"12" forState:UIControlStateNormal];
    [self.button7 setTitle:@"22" forState:UIControlStateNormal];
    [self.button8 setTitle:@"32" forState:UIControlStateNormal];
    [self.button9 setTitle:@"42" forState:UIControlStateNormal];
    [self.button10 setTitle:@"52" forState:UIControlStateNormal];
    [self.button11 setTitle:@"13" forState:UIControlStateNormal];
    [self.button12 setTitle:@"23" forState:UIControlStateNormal];
    [self.button13 setTitle:@"33" forState:UIControlStateNormal];
    [self.button14 setTitle:@"43" forState:UIControlStateNormal];
    [self.button15 setTitle:@"53" forState:UIControlStateNormal];
    [self.button16 setTitle:@"14" forState:UIControlStateNormal];
    [self.button17 setTitle:@"24" forState:UIControlStateNormal];
    [self.button18 setTitle:@"34" forState:UIControlStateNormal];
    [self.button19 setTitle:@"44" forState:UIControlStateNormal];
    [self.button20 setTitle:@"54" forState:UIControlStateNormal];
    [self.button21 setTitle:@"15" forState:UIControlStateNormal];
    [self.button22 setTitle:@"25" forState:UIControlStateNormal];
    [self.button23 setTitle:@"35" forState:UIControlStateNormal];
    [self.button24 setTitle:@"45" forState:UIControlStateNormal];
    [self.button25 setTitle:@"55" forState:UIControlStateNormal];
    
  


    self.xIsCurrentTurn = YES;
    self.currentTurnLabel.text = xIsUp;
    self.currentRound = 0; //setting the round counter to 0 when starting the game
    
}


// after every round, call this method to double check if we have a winner or not
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
    countToWin = 3;
    self.selectedGame = 0;
    
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
    countToWin = 4;
    self.selectedGame = 1;
    
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
    countToWin = 5;
    self.selectedGame = 2;
    
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

- (IBAction)onResetGameButtonPressed:(UIButton *)sender {
    
    if (self.selectedGame == 0) {
        [self threeByThreeGame];
    } else if( self.selectedGame == 1){
        [self fourByFourGame];
    }else if (self.selectedGame == 2){
        [self fiveByFiveGame];
    }
}









@end
