//
//  NYTBookTableViewCell.h
//  NYTBestSellers
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYTBookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookRankLabel;

@end
