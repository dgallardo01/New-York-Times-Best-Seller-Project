//
//  NYTAPIClient.h
//  NYTBestSellers
//
//  Created by Danny on 5/25/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYTAPIClient : UICollectionViewCell


- (void) getGenresWithCompletion:(void(^)(NSArray * genres))completionBlock;

- (void) getGenreList:(NSString*)genreList WithCompletion:(void(^)(NSArray * genres))completionBlock;

@end
