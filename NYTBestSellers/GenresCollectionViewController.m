//
//  GenresCollectionViewController.m
//  NYTBestSellers
//
//  Created by Danny on 5/25/14.
//  Copyright (c) 2014 Danny. All rights reserved.
//

#import "GenresCollectionViewController.h"
#import "NYTAPIClient.h"
#import "GenreCollectionViewCell.h"
#import "NYTBookGenre.h"
#import "NYTGenreListTableViewController.h"

@interface GenresCollectionViewController ()

@property (nonatomic, strong) NYTAPIClient *apiClient;
@property (nonatomic, strong) NSMutableArray *genreArray;

@end

@implementation GenresCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *myLayout =
    [[UICollectionViewFlowLayout alloc]init];
    
    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.apiClient = [[NYTAPIClient alloc] init];
    [self.apiClient getGenresWithCompletion:^(NSArray *genres) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.genreArray = [[NSMutableArray alloc]initWithArray:genres];
            [self.collectionView reloadData];
        });
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Collection View Data Source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.genreArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GenreCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"genreCell" forIndexPath:indexPath];
    
    NYTBookGenre *genre = [self.genreArray objectAtIndex:[indexPath row]];
    cell.genreTagLabel.text = genre.bookDisplayName;

    return cell;
}

//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    
//    [self performSegueWithIdentifier:@"genreCellToList" sender:self];
//
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NYTGenreListTableViewController *genreListTableViewController = segue.destinationViewController;
    NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
    NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
    
    NYTBookGenre *genre = [self.genreArray objectAtIndex:[indexPath row]];
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\s" options:0 error:&error];
    NSString *genreList = [regex stringByReplacingMatchesInString:genre.bookListName options:0 range:NSMakeRange(0, [genre.bookListName length]) withTemplate:@"-"];
    
    genreListTableViewController.genreKey = genreList;
}
@end
