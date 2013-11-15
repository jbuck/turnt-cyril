// This variable stores the data
JSONArray data;

// Background color
int background_color = color(67, 84, 101);

// Variables to change circles
int circle_diameter = 25;
int circle_padding = 35;

// Size of text on bottom of sketch
int text_size = 14;

// Colours we use repeatedly throughout this sketch
color black = color(0);
color white = color(255);

void setup() {
  // Load JSON Array
  data = loadJSONArray("kittens.json");

  // Set the size of our sketch
  size(385, 435);

  // Change the text size to be a little larger
  textSize(text_size);
  textLeading(text_size * 1.3);

  // Turn off the stroking around shapes
  noStroke();
  
  // Set the colour of the background
  background(background_color);

  // Start drawing our circles!
  for (int i = 0; i < data.size(); i++) {
    // Get the JSON object for an individual tweet
    JSONObject tweet = data.getJSONObject(i);

    // Calculate and set the circle fill colour
    int retweet_count = tweet.getInt("retweet_count");
    float opacity = map(retweet_count, 0, 5, 50, 200);
    int circle_color = color(brightness(white), opacity);
    fill(circle_color);
    
    // Calculate the X and Y position of the circle and draw it
    int circle_x = circle_padding + (i % 10 * circle_padding);
    int circle_y = circle_padding + (i / 10 * circle_padding);
    ellipse(circle_x, circle_y, circle_diameter, circle_diameter);
  }

  // Draw a white rectangle at the bottom of the sketch for text
  fill(white);
  rect(0, 385, width, height);
}

void draw() {
  // Calculate the position of the tweet within the tweets array
  int circle_x = (mouseX - circle_padding / 2) / circle_padding;
  int circle_y = (mouseY - circle_padding) / circle_padding * 10;
  int index = circle_x + circle_y;
  
  // Make sure that we don't access any indices that are out of bounds
  int safe_index = constrain(index, 0, data.size() - 1);
  
  // Grab the correct tweet data
  JSONObject tweet = data.getJSONObject(safe_index);

  // Draw a white rectangle at the bottom of the sketch for text
  fill(white);
  rect(0, 385, width, height);

  // Draw the black tweet text inside the white rectangle
  fill(black);
  text(tweet.getString("text"), 10, 390, width - 20, 40);
}

