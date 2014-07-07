//
//  ViewController.m
//  Udemy_5(Pirate_adventure)
//
//  Created by Danil Mironov on 26.06.14.
//  Copyright (c) 2014 Danil Mironov. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Factory *factory = [[Factory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    self.currentPoint = CGPointMake(0, 0);
    
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15){
        self.boss.health -= self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    if (self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death message" message:@"You have died please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    } else if (self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }

    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

-(void)updateTile
{
    Tile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionbuttonName forState:UIControlStateNormal];
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return NO;
    } else {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(Armor *)armor withWeapons:(Weapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil){
        self.character.health -= self.character.armor.health + armor.health;
    } else if (weapon != nil){
        self.character.damage -= self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    } else if (healthEffect != 0){
        self.character.health += healthEffect;
    } else {
        self.character.health += self.character.armor.health;
        self.character.damage += self.character.weapon.damage;
    }
}

@end
