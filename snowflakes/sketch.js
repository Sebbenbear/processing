const canvasWidth = window.innerWidth;
const canvasHeight = window.innerHeight;
let snowflakes;

function createSnowFlakes(numSnowflakes) {
    let snowflakes = [];
    for (let i = 0; i < numSnowflakes; i++) {

        let size = random() * (24 - 10) + 10;
        let fillColor;

        if (size > 20) {
            a = 255;
        } else if (size > 15) {
            a = 200;
        } else {
            a = 150;
        }

        fillColor = color(255, 255, 255, a);
        angle = random() * 180;

        let snowflake = {
            x: random() * canvasWidth,
            y: random() * canvasHeight,
            size: size,
            fillColor: fillColor,
            angle: angle,
            draw: () => {
                stroke(fillColor);
                fill(fillColor);
                // ellipse(snowflake.x, snowflake.y, snowflake.size, snowflake.size);
                rect(snowflake.x, snowflake.y, snowflake.size, snowflake.size);
            },
            updatePosition: () => {
                snowflake.x = snowflake.x + random(-1, 1);
                snowflake.y = snowflake.y + 1;
                snowflake.angle += 1;
                
                if (snowflake.y > height) {
                    snowflake.y = 0;
                    snowflake.x = random() * canvasWidth;
                }
            }
        }
        
        snowflakes.push(snowflake);
    }
    return snowflakes;
}

function setup() {
  createCanvas(canvasWidth, canvasHeight);
  snowflakes = createSnowFlakes(100);
}

function draw() {
  background(color(173,216,230));

  for (snowflake of snowflakes) {
    snowflake.draw();
    snowflake.updatePosition();
  }
}
