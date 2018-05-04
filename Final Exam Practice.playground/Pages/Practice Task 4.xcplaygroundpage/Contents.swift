//: # Exam Prep 4
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
/*:
 Each image is exactly 400 pixels wide by 600 pixels tall.
 
 Your goal is to precisely reproduce this image:
 
 ![runaways-no-grid](runaways-no-grid.png "The Runaways")
 ![runaways-with-grid](runaways-with-grid.png "The Runaways")
 
 By precisely reproducing this image, you will demonstrate your understanding of:
 
 * sequence (order of statements in a program)
 * conditionals (making decisions with ``if`` statements)
 * iteration (use of loops to repeat statements)
 
 You can use the **Digital Color Meter** app (already installed on your Mac) to find specific colours as RGB (red-green-blue) codes.
 
 You [can use this site](http://www.workwithcolor.com/color-converter-01.htm) to convert colours to HSB to use with the Canvas class.
 
 Or, if you wish, you may use the color constants created below.
 */

// Create a new canvas
let canvas = Canvas(width: 400, height: 600)

// COLORS
let pink = Color(hue: 338, saturation: 83, brightness: 89, alpha: 100)
let black = Color(hue: 0, saturation: 0, brightness: 0, alpha: 100)
let beige = Color(hue: 69, saturation: 6, brightness: 87, alpha: 100)

// Begin your solution here...
//background
canvas.fillColor = pink
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: canvas.width, height: canvas.height)

//loop for squares

canvas.translate(byX: 200, byY: 200)

canvas.drawShapesWithFill = false
canvas.defaultBorderWidth = 16

for _ in 1...4 {
    
    for size in stride(from: 35, to: 400, by: 55) {
        
        if size % 2 == 1 {
            canvas.borderColor = black
        } else {
            canvas.borderColor = beige
        }
        
        canvas.drawRectangle(centreX: -200, centreY: 200, width: size, height: size)
        
        canvas.rotate(by: 90)
        
    }
    
    
}








//reset
canvas.translate(byX: -200, byY: -200)
canvas.drawShapesWithFill = true
canvas.fillColor = pink
canvas.drawShapesWithBorders = false

//stopping block
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 400, width: 400, height: 200)



//THE TEXT
canvas.textColor = beige
canvas.drawText(message: "the runaways", size: 55, x: 10, y: 410, kerning: -0.5)

//OTHER TEEXT

var subTextYPosition = 520
var subTextKerning = -0.5

canvas.textColor = Color.black
canvas.drawText(message: """
friday
august 19 1977
tickets $4.50
""", size: 11, x: 10, y: subTextYPosition, kerning: -0.5)






canvas.drawShapesWithFill = false
canvas.defaultBorderWidth = 1
canvas.lineColor = Color.white

for x in stride(from: 0, to: 600, by: 50) {
    canvas.drawLine(fromX: x, fromY: 0, toX: x, toY: 600)
      canvas.drawLine(fromX: 0, fromY: x, toX: 400, toY: x)
}

/*:
 **Remember to commit and push your work,please**.
 */
/*:
 ## Template code
 The code below is necessary to see results in the Assistant Editor at right. Please do not remove.
 */
PlaygroundPage.current.liveView = canvas.imageView
