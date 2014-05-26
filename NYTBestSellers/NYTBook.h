//
//  NYTBook.h
//  NYTBestSellers
//
//  Created by Danny on 5/26/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NYTBook : NSObject

@property (nonatomic, strong)NSString *title;

@property (nonatomic, strong)NSString *description;

@property (nonatomic,strong) NSNumber *rank;

@property (nonatomic, strong)NSString *contributor;

@property (nonatomic, strong)NSString *author;

@property (nonatomic, strong)NSString *ageGroup;

@property (nonatomic, strong)NSString *publisher;

@property (nonatomic, strong)NSString *isbn13;

@property (nonatomic, strong)NSString *isbn10;



-(instancetype)initWithBookTitle:(NSString *)title
                     Description:(NSString *)description
                            Rank:(NSNumber *)rank
                     Contributor:(NSString *)contributor
                          Author:(NSString *)author
                        AgeGroup:(NSString *)ageGroup
                       Publisher:(NSString *)publisher
                  Primary_ISBN13:(NSString *)isbn13
                  Primary_ISBN10:(NSString *)isbn10;

+ (NSArray *)bookFromBookDictionaries:(NSArray *)bookDictionaries;

+ (instancetype)bookFromBooksDictionary:(NSDictionary *)books;
    
@end
