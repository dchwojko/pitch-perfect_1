//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by DONALD CHWOJKO on 4/26/15.
//  Copyright (c) 2015 DONALD CHWOJKO. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL!,title:String!) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}