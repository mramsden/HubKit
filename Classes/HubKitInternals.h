/*!
 @file
 
 This file contains internal support methods for use by HubKit. Think of it as
 one of HubKit's private APIs. It won't get your app rejected but probably for
 the benefit of your health you shouldn't use them. <strong>Don't rely on any of 
 the listed methods since they may change or disappear without warning between 
 releases.</strong>
 
 @author Marcus Ramsden
 @date 04/12/2010
 
 Copyright 2010 Marcus Ramsden
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <UIKit/UIKit.h>

#ifndef DOXYGEN_IGNORE

/*!
 Methods in this category shouldn't be interacted with directly. Think of it as
 one of HubKit's private APIs. It won't get your app rejected but probably for
 the benefit of your health you shouldn't use them. <strong>Don't rely on any of 
 the listed methods since they may change or disappear without warning between 
 releases.</strong>
 */
@interface HubKit (InternalHelpers)

/*!
 Returns a shared instance of the HubKitConfigurationManager.
 */
+ (HubKitConfigurationManager *)sharedConfigurationManager;

@end

#endif /* DOXYGEN_IGNORE */
