//
//  GameScene.swift
//  quotes
//
//  Created by Randall Clayborn on 5/15/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

struct QuoteDetails {
    let quote: String
}

struct AuthorDetails {
    let author: String
}

class GameScene: SKScene {
    let quote1 = QuoteDetails(quote: "Just do it")
    let quote2 = QuoteDetails(quote: "There ain't no easy way out")
    let quote3 = QuoteDetails(quote: "My life is my message")
    let quote4 = QuoteDetails(quote: "Courage is a kind of salvation")
    let quote5 = QuoteDetails(quote: "Love is friendship set on fire")
    
    let author1 = AuthorDetails(author: "Nike")
    let author2 = AuthorDetails(author: "Tom Petty")
    let author3 = AuthorDetails(author: "Gandhi")
    let author4 = AuthorDetails(author: "Plato")
    let author5 = AuthorDetails(author: "Jeremy Taylor")
    
    
    var quotes = [QuoteDetails]()
    var authors = [AuthorDetails]()

    var quoteIndex = 0
    var authorIndex = 0
    
    var quoteLabel = SKLabelNode()
    var authorLabel = SKLabelNode()
    var titleLabel = SKLabelNode()
    var nextButton = SKSpriteNode()
    var bg = SKSpriteNode()
    var bg2 = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        quotes = [quote1, quote2, quote3, quote4, quote5]
        authors = [author1, author2, author3, author4, author5]
        
        labels()
    }
    
    func getNewQuote() ->(String) {
        if quotes.count - 1 < quoteIndex {
            quoteIndex = 0
        }
        let result = (quotes[quoteIndex].quote)
            quoteIndex += 1
        
        return result
    }
    
    func getNewAuthor() -> (String) {
        if authors.count - 1 < authorIndex {
            authorIndex = 0
        }
        let result = (authors[authorIndex].author)
        authorIndex += 1
        
        return result

    }
    
    func labels() {

        bg2 = SKSpriteNode(imageNamed: "bg")
        bg2.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        bg2.xScale = 2.0
        bg2.yScale = 1.0
        bg2.alpha = 0.8
        bg2.zPosition = -1
        addChild(bg2)
        
        titleLabel = SKLabelNode(fontNamed: "copperPlate")
        titleLabel.text = "Quote of The Day"
        titleLabel.alpha = 0.5
        titleLabel.fontColor = SKColor.blueColor()
        titleLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.75)
        titleLabel.fontSize = 55
        addChild(titleLabel)
        
        quoteLabel = SKLabelNode(fontNamed: "copperPlate")
        quoteLabel.text = "\(getNewQuote())"
        quoteLabel.fontColor = SKColor.blackColor()
        quoteLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.55)
        quoteLabel.zPosition = 2
        quoteLabel.fontSize = 45
        addChild(quoteLabel)
    
        authorLabel = SKLabelNode(fontNamed: "copperPlate")
        authorLabel.text = "\(getNewAuthor())"
        authorLabel.fontColor = SKColor.blackColor()
        authorLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        authorLabel.zPosition = 2
        authorLabel.fontSize = 25
        addChild(authorLabel)
        
        nextButton = SKSpriteNode(imageNamed: "nextButton")
        nextButton.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.25)
        nextButton.setScale(0.5)
        nextButton.zPosition = 5
        addChild(nextButton)

    }
    
    func createQuoteAndAuthor() {
        quoteLabel = SKLabelNode(fontNamed: "copperPlate")
        quoteLabel.text = "\(getNewQuote())"
        quoteLabel.fontColor = SKColor.blackColor()
        quoteLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.55)
        quoteLabel.zPosition = 2
        quoteLabel.fontSize = 45
        addChild(quoteLabel)
        
        authorLabel = SKLabelNode(fontNamed: "copperPlate")
        authorLabel.text = "\(getNewAuthor())"
        authorLabel.fontColor = SKColor.blackColor()
        authorLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5)
        authorLabel.zPosition = 2
        authorLabel.fontSize = 25
        addChild(authorLabel)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.locationInNode(self)
            
            if (CGRectContainsPoint(nextButton.frame, touchLocation)) {
                quoteLabel.removeFromParent()
                authorLabel.removeFromParent()
                createQuoteAndAuthor()
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
