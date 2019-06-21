//
//  FeedTableViewController.m
//  testfeed
//
//  Created by Мария Водолазкая on 14/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import "FeedTableViewController.h"
#import "DetailViewController.h"
@interface FeedTableViewController ()
@end

NSString * const SEG_showDetail  =  @"SEGUE_showDetail";


@implementation FeedTableViewController {
    NSArray *feedItems;
    NSNumber *offset;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    offset = [NSNumber numberWithInt:0];
    
    VKRequest *getWall = [VKRequest requestWithMethod:@"wall.get"
                                            parameters:@{VK_API_OWNER_ID : @"-1",
                                                            VK_API_COUNT : @(10),
                                                           VK_API_OFFSET :  offset
                                                         }];
    offset = [NSNumber numberWithInt:offset.integerValue + 10];
    [getWall executeWithResultBlock:^(VKResponse * response) {
        //NSLog(@"Json result: %@", response.json);
        
        NSError *error = nil;
        
        // Get JSON data into a Foundation object
        id object = response.json;
        
        // Verify object retrieved is dictionary
        if ([object isKindOfClass:[NSDictionary class]] && error == nil)
        {
            // Get the value (an array) for key 'results'
            NSArray *array;
            // Get the 'results' array
            if ([[object objectForKey:@"items"] isKindOfClass:[NSArray class]])
            {
                array = [object objectForKey:@"items"];
                self->feedItems = array;
                [self.tableView reloadData];
            }
        }
        
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        } else {
            NSLog(@"VK error: %@", error);
        }
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feedItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feedCellwImage" forIndexPath:indexPath];
    
    if (indexPath.row > feedItems.count - 3 && feedItems.count < 144) {
        [self loadWithCount:10 andOffset:offset.integerValue];
    }
    
    // Configure the cell...
    NSDictionary *currentPost = feedItems[indexPath.row];
    UILabel *postTextLabel = [cell viewWithTag:104];
    postTextLabel.text = [currentPost objectForKey:@"text"];
    
    UILabel *usernameTextLabel = [cell viewWithTag:102];
    usernameTextLabel.text = [NSString stringWithFormat: @"%@", [currentPost objectForKey:@"owner_id"]];
    
    
    //get user info
    VKRequest *getUser ;
    NSNumber *userID = [currentPost objectForKey:@"owner_id"];
    if (userID.integerValue < 0) {
        userID = @(userID.integerValue * -1);
        getUser = [VKRequest requestWithMethod:@"groups.getById"
                                    parameters:@{VK_API_GROUP_IDS : userID
                                                 }];
    } else {
        getUser = [VKRequest requestWithMethod:@"users.get"
                                               parameters:@{VK_API_USER_IDS : @[[currentPost objectForKey:@"owner_id"]]
                                                            }];
    }
    
    
    UIImageView *avatar = [cell viewWithTag:101];
    avatar.layer.cornerRadius = avatar.width / 2;
    [avatar setBackgroundColor:[UIColor grayColor]];
    
    if ([[Preferences sharedPreferences] showAvatar])
        avatar.hidden = NO;
    else
        avatar.hidden = YES;
        
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - VK

- (void) loadWithCount:(int)count andOffset:(int)offset {
    VKRequest *getWall = [VKRequest requestWithMethod:@"wall.get"
                                           parameters:@{VK_API_OWNER_ID : @"-1",
                                                           VK_API_COUNT : @(count),
                                                          VK_API_OFFSET : @(offset)
                                                        }];
    self->offset = [NSNumber numberWithInt:offset + count];
    [getWall executeWithResultBlock:^(VKResponse * response) {
        //NSLog(@"Json result: %@", response.json);
        
        NSError *error = nil;
        
        // Get JSON data into a Foundation object
        id object = response.json;
        
        // Verify object retrieved is dictionary
        if ([object isKindOfClass:[NSDictionary class]] && error == nil)
        {
            // Get the value (an array) for key 'results'
            NSArray *array;
            // Get the 'results' array
            if ([[object objectForKey:@"items"] isKindOfClass:[NSArray class]])
            {
                array = [object objectForKey:@"items"];
                self->feedItems = [self->feedItems arrayByAddingObjectsFromArray:array];
                
                [self.tableView reloadData];
            }
        }
        
    } errorBlock:^(NSError * error) {
        if (error.code != VK_API_ERROR) {
            [error.vkError.request repeat];
        } else {
            NSLog(@"VK error: %@", error);
        }
    }];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:SEG_showDetail] && [sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath* indexPath = [self.tableView indexPathForCell:(UITableViewCell*)sender];
        DetailViewController * dvc = [segue destinationViewController];
        NSDictionary *currentPost = feedItems[indexPath.row];
        dvc.content = [currentPost objectForKey:@"text"];
        dvc.username = [NSString stringWithFormat: @"%@", [currentPost objectForKey:@"owner_id"]];
    }
}


@end
