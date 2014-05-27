//
//  NYTAPIClient.m
//  NYTBestSellers
//
//  Created by Danny on 5/25/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import "NYTAPIClient.h"
#import "NYTBookGenre.h"
#import "NYTBook.h"
#import "APIKeys.h"

@interface NYTAPIClient ()

@property (nonatomic, strong) APIKeys *apiKey;

@end

@implementation NYTAPIClient

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.apiKey = [[APIKeys alloc]init];
    }
    return self;
}

- (void) getGenresWithCompletion:(void(^)(NSArray * genres))completionBlock{
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *nytBestSellerURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.nytimes.com/svc/books/v2/lists/names.json?api-key=%@",[self.apiKey getAPIKey]]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:nytBestSellerURL];
    NSURLSessionDataTask *nytDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@",responseDictionary[@"results"]);
        NSArray *genresArray = [NYTBookGenre genreFromGenreDictionaries:responseDictionary[@"results"]];
        completionBlock(genresArray);
    }];
    [nytDataTask resume];
    NSLog(@"task completed");
}

- (void) getGenreList:(NSString*)genreList WithCompletion:(void(^)(NSArray * books))completionBlock{
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *nytBestSellerURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.nytimes.com/svc/books/v2/lists.json?list=%@&api-key=651e50b5ac2b529a5a5a0df1ae73bae8:7:69324718", genreList]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:nytBestSellerURL];
    NSURLSessionDataTask *nytDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        NSLog(@"%@",responseDictionary[@"results"]);
        NSArray *booksArray = [NYTBook bookFromBookDictionaries:responseDictionary[@"results"]];
            completionBlock(booksArray);
    }];
    [nytDataTask resume];
    NSLog(@"task completed");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
