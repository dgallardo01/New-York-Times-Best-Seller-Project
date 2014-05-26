//
//  NYTBook.m
//  NYTBestSellers
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import "NYTBook.h"

@implementation NYTBook

-(instancetype)initWithBookTitle:(NSString *)title
                     Description:(NSString *)description
                            Rank:(NSNumber *)rank
                     Contributor:(NSString *)contributor
                          Author:(NSString *)author
                        AgeGroup:(NSString *)ageGroup
                       Publisher:(NSString *)publisher
                  Primary_ISBN13:(NSString *)isbn13
                  Primary_ISBN10:(NSString *)isbn10{
    self = [super init];
    if(self){
        _title = title;
        _description = description;
        _rank = rank;
        _contributor = contributor;
        _author = author;
        _ageGroup = ageGroup;
        _publisher = publisher;
        _isbn13 = isbn13;
        _isbn10 = isbn10;
            }
    return self;
}

+ (NSArray *)bookFromBookDictionaries:(NSArray *)bookDictionaries{
    NSMutableArray *finalBooks = [[NSMutableArray alloc]init];
    for (NSDictionary *book in bookDictionaries) {
        if ([book isKindOfClass:[NSDictionary class]]) {
            [finalBooks addObject:[NYTBook bookFromBooksDictionary:book]];
        }
    }
    return finalBooks;
}

+ (instancetype)bookFromBooksDictionary:(NSDictionary *)books{
    NYTBook *book = [[NYTBook alloc]initWithBookTitle:books[@"book_details"][0][@"title"]
                                          Description:books[@"book_details"][0][@"description"]
                                                 Rank:books[@"rank"]
                                          Contributor:books[@"book_details"][0][@"contributor"]
                                               Author:books[@"book_details"][0][@"author"]
                                             AgeGroup:books[@"book_details"][0][@"age_group"]
                                            Publisher:books[@"book_details"][0][@"publisher"]
                                       Primary_ISBN13:books[@"book_details"][0][@"primary_isbn13"]
                                       Primary_ISBN10:books[@"book_details"][0][@"primary_isbn10"] ];
    return book ;
}

@end
