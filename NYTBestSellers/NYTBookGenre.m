//
//  NYTBookGenre.m
//  NYTBestSellers
//
//  Created by Danny on 5/25/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import "NYTBookGenre.h"

@implementation NYTBookGenre

-(instancetype)initWithBookDisplayName:(NSString *)bookDisplayName andBookListName:(NSString *)bookListName{
    self = [super init];
    if(self){
        _bookDisplayName = bookDisplayName;
        _bookListName = bookListName;
    }
    return self;
}

+ (NSArray *)genreFromGenreDictionaries:(NSArray *)genreDictionaries{
    NSMutableArray *finalGenres = [[NSMutableArray alloc]init];
    for (NSDictionary *genre in genreDictionaries) {
        if ([genre isKindOfClass:[NSDictionary class]]) {
            [finalGenres addObject:[NYTBookGenre genresFromGenresDictionary:genre]];
        }
    }
    return finalGenres;
}

+ (instancetype)genresFromGenresDictionary:(NSDictionary *)genres{
    NYTBookGenre *bookGenre = [[NYTBookGenre alloc]initWithBookDisplayName:genres[@"display_name"]
                                                            andBookListName:genres[@"list_name"]];
    return bookGenre;
}

@end
