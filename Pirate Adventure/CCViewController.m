//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Satinder Singh on 9/2/14.
//  Copyright (c) 2014 games. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CCFactory *factory = [[CCFactory alloc] init];
    self.character = [factory character];  
    self.tiles = [factory tiles]; // tiles is array
    self.boss = [factory boss];
    
    self.curPt = CGPointMake(0,0);
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    CCTile *tile = [[self.tiles objectAtIndex:self.curPt.x] objectAtIndex:self.curPt.y];
    if (tile.healthState == -15)
        self.boss.health = self.boss.health - self.character.damage;
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthState];
    [self updateTile];
    if(self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You died. Restart Game" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if(self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil boss" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
    }
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.curPt = CGPointMake(self.curPt.x, self.curPt.y+1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.curPt = CGPointMake(self.curPt.x-1, self.curPt.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.curPt = CGPointMake(self.curPt.x, self.curPt.y-1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.curPt = CGPointMake(self.curPt.x+1, self.curPt.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad]; //RESTART EVERYTHING
}

# pragma mark - helper method

-(void)updateTile
{
    CCTile *tileModel = [[self.tiles objectAtIndex:self.curPt.x] objectAtIndex:self.curPt.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text =  [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle: tileModel.actionbuttonName forState:UIControlStateNormal];
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPt:CGPointMake(self.curPt.x-1, self.curPt.y)];
    self.eastButton.hidden = [self tileExistsAtPt:CGPointMake(self.curPt.x+1, self.curPt.y)];
    self.northButton.hidden =[self tileExistsAtPt:CGPointMake(self.curPt.x, self.curPt.y+1)];
    self.southButton.hidden =[self tileExistsAtPt:CGPointMake(self.curPt.x, self.curPt.y-1)];
}

-(BOOL)tileExistsAtPt:(CGPoint)point
{
    return !(point.y >=0 && point.x >= 0 &&
             point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]);
}

-(void)updateCharacterStatsForArmor:(CCArmor *)armor withWeapons:(CCWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if(weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if(healthEffect != 0)
        self.character.health = self.character.health + healthEffect;
    else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}
@end
