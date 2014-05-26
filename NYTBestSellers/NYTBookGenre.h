//
//  NYTBookGenre.h
//  NYTBestSellers
//
//  Created by Danny on 5/25/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYTBookGenre : NSObject

@property (nonatomic, strong)NSString *bookDisplayName;
@property (nonatomic, strong)NSString *bookListName;

- (instancetype)initWithBookDisplayName:(NSString *)bookDisplayName andBookListName:(NSString *)bookListName;

+(NSArray *) genreFromGenreDictionaries:(NSArray *)genreDictionaries;

+ (instancetype)genresFromGenresDictionary:(NSDictionary *)genres;
@end
