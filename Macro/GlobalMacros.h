
    //
//  GlobalMacros.h
//
//  Created by YeMing on 2018/5/7.
//  Copyright © 2018年 YeMing. All rights reserved.
//

#ifndef GlobalMacros_h
#define GlobalMacros_h

/*  设备  */

#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize kScreenBounds.size
#define kScreenWidth kScreenSize.width
#define kScreenHeight kScreenSize.height

#define isIphone4  ((kScreenWidth == 320) && (kScreenHeight == 480))
#define isIphone5  ((kScreenWidth == 320) && (kScreenHeight == 568))
#define isIphone6  ((kScreenWidth == 375) && (kScreenHeight == 667))
#define isIphone6p  ((kScreenWidth == 414) && (kScreenHeight == 736))


/*  颜色   */
#define UIColorRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorRGBAlpha(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kColorWhite [UIColor whiteColor]
#define kColorBlack [UIColor blackColor]

/**灰色，例如：提示*/
#define kColorGrayText UIColorHex(0x8C8D8E)
/*红色*/
#define KRedColor UIColorHex(0xff007b)


#endif /* GlobalMacros_h */

    