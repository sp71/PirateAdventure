//
//  CCViewController.h
//  Pirate Adventure
//
//  Created by Satinder Singh on 9/2/14.
//  Copyright (c) 2014 games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCViewController : UIViewController

//instance Variable
@property (nonatomic) CGPoint curPt;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) CCCharacter *character;
@property (strong, nonatomic) CCBoss *boss;

// IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;// outlet here and action below
@property (strong, nonatomic) IBOutlet UIButton *northButton; // outlet here and action below
@property (strong, nonatomic) IBOutlet UIButton *westButton;  // outlet here and action below
@property (strong, nonatomic) IBOutlet UIButton *southButton; // outlet here and action below
@property (strong, nonatomic) IBOutlet UIButton *eastButton;  // outlet here and action below

 // IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;

- (IBAction)resetButtonPressed:(UIButton *)sender;

@end
