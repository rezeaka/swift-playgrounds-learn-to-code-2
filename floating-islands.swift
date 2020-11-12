import Foundation

let character = Character()
let greenPortal = Portal(color: #colorLiteral(red: 0.4666666666666667, green: 0.7647058823529411, blue: 0.26666666666666666, alpha: 1.0))
let bluePortal = Portal(color: #colorLiteral(red: 0.17647058823529413, green: 0.4980392156862745, blue: 0.7568627450980392, alpha: 1.0))
let block = Block()

var gemCounter = 0
var switchCounter = 0

world.place(character, facing: .south,  atColumn: 1, row: 2)
world.place(greenPortal, atStartColumn: 1, startRow: 2, atEndColumn: 5, endRow: 3)
world.place(bluePortal, atStartColumn: 1, startRow: 0, atEndColumn: 1, endRow: 6)

greenPortal.isActive = false

func turnAround() {
    character.turnLeft()
    character.turnLeft()
}

func collectGem() {
    if character.isOnGem {
        character.collectGem()
        gemCounter += 1
    }
}

func toggleSwitch() {
    while character.isOnClosedSwitch {
        character.toggleSwitch()
        switchCounter += 1
    }
}

while switchCounter < 6 && gemCounter <= 3 {
    character.jump()
    if character.isOnClosedSwitch {
        toggleSwitch()
        character.turnLeft()
    }
    if character.isOnGem {
        character.turnLeft()
        collectGem()
    }
    
    if switchCounter == 2 {
        greenPortal.isActive = true
        character.jump()
        turnAround()
        }
    
    if switchCounter == 5 {
        character.jump()
        character.turnLeft()
        character.jump()
        character.toggleSwitch()
        switchCounter += 1
    }
}
       
