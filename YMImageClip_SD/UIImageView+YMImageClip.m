//
//  UIImageView+YMRound.m
//  SDWebImage_Round
//
//  Created by JoeXu on 2018/5/3.
//  Copyright © 2018年 JoeXu. All rights reserved.
//

#import "UIImageView+YMImageClip.h"

@implementation UIImageView (YMImageClip)

- (void)ym_setImageWithURL:(NSURL *)url radius:(NSUInteger)radius
{
    [self ym_setImageWithURL:url placeholderImage:nil radius:radius completed:nil];
}

- (void)ym_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius
{
    [self ym_setImageWithURL:url placeholderImage:placeholder radius:radius completed:nil];
}

- (void)ym_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder radius:(NSUInteger)radius completed:(SDExternalCompletionBlock)completedBlock
{
    
    if (radius == CGFLOAT_MIN) {
        radius = self.frame.size.width/2.0;
    }
    
    if (radius == 0){
        [self sd_setImageWithURL:url placeholderImage:placeholder completed:completedBlock];
        return;
    }
    NSString *cacheKey = [UIImage ym_keyOfStoredImageForURL:url radius:radius size:self.frame.size];
    UIImage *cachedImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheKey];

    if (cachedImg){
        self.image = cachedImg;
    }else{
        [self sd_setImageWithURL:url placeholderImage:placeholder completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (!error){
                UIImage *roundImage = [image ym_roundedImageWithSize:self.frame.size radius:radius];
                self.image = roundImage;
                [[SDImageCache sharedImageCache] storeImage:roundImage forKey:cacheKey completion:nil];
            }
            if (completedBlock){completedBlock(image,error,cacheType,imageURL);}
        }];
    }
    
    
    
}




@end
