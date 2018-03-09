//
//  DocumentViewController.m
//  XQCategoryExample
//
//  Created by xiao qiang on 2018/3/9.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "DocumentViewController.h"

@interface DocumentViewController()

@property IBOutlet UILabel *documentNameLabel;

@end

@implementation DocumentViewController
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Access the document
    [self.document openWithCompletionHandler:^(BOOL success) {
        if (success) {
            // Display the content of the document, e.g.:
            self.documentNameLabel.text = self.document.fileURL.lastPathComponent;
        } else {
            // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
        }
    }];
}

- (IBAction)dismissDocumentViewController {
    [self dismissViewControllerAnimated:YES completion:^ {
        [self.document closeWithCompletionHandler:nil];
    }];
}

@end
