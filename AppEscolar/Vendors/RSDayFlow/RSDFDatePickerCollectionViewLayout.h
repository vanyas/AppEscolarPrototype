//
// RSDFDatePickerCollectionViewLayout.h
//
// Copyright (c) 2013 Evadne Wu, http://radi.ws/
// Copyright (c) 2013-2014 Ruslan Skorb, http://lnkd.in/gsBbvb
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import <UIKit/UIKit.h>

/**
 The `RSDFDatePickerCollectionViewLayout` is a layout of the collection view which used the date picker.
 */
@interface RSDFDatePickerCollectionViewLayout : UICollectionViewFlowLayout

///-----------------------------------------
/// @name Accessing Attributes of the Layout
///-----------------------------------------

/**
 The default sizes to use for section headers. Default value is {320, 64}.
 
 @discussion Can be overridden in subclasses for customization.
 */
- (CGSize)selfHeaderReferenceSize;

/**
 The default size to use for cells. Default value is {44, 70}.
 
 @discussion Can be overridden in subclasses for customization.
 */
- (CGSize)selfItemSize;

/**
 The minimum spacing to use between lines of items in the grid. Default value is `2.0f`.
 
 @discussion Can be overridden in subclasses for customization.
 */
- (CGFloat)selfMinimumLineSpacing;

/**
 The minimum spacing to use between items in the same row. Default value is `2.0f`.
 
 @discussion Can be overridden in subclasses for customization.
 */
- (CGFloat)selfMinimumInteritemSpacing;

@end
